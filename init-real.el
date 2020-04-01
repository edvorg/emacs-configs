;; start emacs server

(require 'server)
(unless (server-running-p)
  (server-start))

;; elpa

(setq package-archives '(("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("melpa" . "https://melpa.org/packages/")))

(defconst my-init-dir "~/.emacs.d/init.d")

(eval-when-compile (package-initialize))

(defun require-package (package)
  "refresh package archives, check package presence and install if it's not installed"
  (if (null (require package nil t))
      (progn (let* ((ARCHIVES (if (null package-archive-contents)
                                  (progn (package-refresh-contents)
                                         package-archive-contents)
                                package-archive-contents))
                    (AVAIL (assoc package ARCHIVES)))
               (if AVAIL
                   (package-install package)))
             (require package))))

;; use package

(require-package 'use-package)
(require 'use-package)

;; chords

(use-package use-package-chords
  :ensure t)

;; req-package

(use-package use-package-chords
  :ensure t
  :config (key-chord-mode 1))

(use-package req-package
  :ensure t
  :config (req-package--log-set-level 'debug))

;; init.d

(random t)

(req-package load-dir
  :ensure t
  :force true
  :init
  (setq force-load-messages nil)
  (setq load-dir-debug nil)
  (setq load-dir-recursive t)
  :config
  (load-dir-one my-init-dir)
  (req-package-finish)
  (funcall 'select-theme))

(load "~/.emacs.d/init-bindings.el")
