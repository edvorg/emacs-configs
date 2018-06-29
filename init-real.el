;; start emacs server

(require 'server)
(unless (server-running-p)
  (server-start))

;; elpa

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")))

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

;; el-get

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require-package 'el-get)
(require 'el-get)
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/el-get/recipes")
(el-get 'sync)

;; :el-get keyword for use-package

(use-package use-package-el-get
  :ensure t
  :config (use-package-el-get-setup))

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

(req-package key-chord
  :force t
  :ensure t
  :chords (("qw" . kill-this-buffer)
           ("qq" . kill-this-buffer)
           (";2" . split-window-below)
           (";3" . split-window-right)
           (";4" . kill-buffer-and-window)
           (";0" . delete-window)
           (";n" . scroll-up-command)
           (";h" . scroll-down-command)
           (";/" . undo)
           (";u" . "\C-u")
           (";j" . "\C-n")
           (";k" . "\C-p")
           (";g" . "\C-g")
           ("1e" . "\C-a")
           ("2e" . "\C-a\t")
           ("3e" . "\C-e")
           ("4e" . "\C-e ")
           (";1" . zygospore-toggle-delete-other-windows)
           ("xf" . projectile-find-file)
           ("xd" . projectile-find-dir)
           (";l" . helm-bookmarks)
           (";m" . magit-status)
           ("xb" . ido-switch-buffer)
           (";1" . zygospore-toggle-delete-other-windows)
           (";p" . paradox-list-packages)
           (";o" . ace-window))
  :config (key-chord-mode 1))
