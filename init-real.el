;; start emacs server

(require 'server)
(unless (server-running-p)
  (server-start))

;; recompile configs

(add-hook 'kill-emacs-hook (lambda () (byte-recompile-directory my-init-dir 0 t)))

;; elpa

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")))

(defconst my-init-dir "~/.emacs.d/init.d")
(defconst emacs-major-version-rad 1000000)

(defun has-emacs-version (major minor)
  (<= (+ (* major emacs-major-version-rad) minor)
      (+ (* emacs-major-version emacs-major-version-rad) emacs-minor-version)))

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

;; el-get

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require-package 'el-get)
(require 'el-get)
(use-package el-get
  :config
  (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/el-get/recipes")
  (el-get 'sync))

;; chords

(require-package 'use-package-chords)
(require 'use-package-chords)

;; req-package

(require-package 'req-package)
(require 'req-package)
(req-package--log-set-level 'trace)

;; init.d

(random t)
(req-package load-dir
  :force true
  :init
  (setq force-load-messages nil)
  (setq load-dir-debug nil)
  (setq load-dir-recursive t)
  :config
  (load-dir-one my-init-dir)
  (req-package-finish)
  (funcall 'select-theme))
