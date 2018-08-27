(require 'req-package)

(req-package recentf
  :ensure t
  :config (recentf-mode 1))

;; revertible delete other windows

(req-package zygospore
  :ensure t
  :commands (zygospore-toggle-delete-other-windows))

;; delete trailing whitespaces before saving some buffer

(add-hook-exec 'before-save 'delete-trailing-whitespace)

;; temp file

(req-package find-temp-file
  :ensure t
  :bind ("C-x C-t" . find-temp-file))

;; shit text left/right

(req-package smart-shift
  :ensure t
  :bind (("C-{" . smart-shift-left)
         ("C-}" . smart-shift-right)))

;; save kill ring to disk

(req-package savekill
  :ensure t
  :config (progn (setq savekill-max-saved-items nil)
                 (load save-kill-file-name t)))

(req-package google-translate-smooth-ui
  :ensure google-translate
  :bind ("C-c t" . google-translate-smooth-translate))

(req-package define-word
  :ensure t
  :bind ("C-c d" . define-word-at-point))

(req-package warnings
  :ensure t
  :config (add-to-list 'warning-suppress-types '(undo discard-info)))

;; use fuzzy for M-x

(req-package smex
  :ensure t
  :bind ("M-x" . smex)
  :config (smex-initialize))

;; unescaped string edit

(req-package string-edit
  :ensure t
  :bind ("C-c e" . string-edit-at-point))

;; paradox

(req-package paradox
  :ensure t
  :commands paradox-list-packages)

;; multiple cursors

(req-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C-<" . mc/mark-previous-like-this)
         ("C->" . mc/mark-next-like-this)
         ("C-c ." . mc/mark-all-like-this)
         ("C-M->" . mc/skip-to-next-like-this)
         ("C-M-<" . mc/skip-to-previous-like-this)))

;; save history

(req-package savehist
  :ensure t
  :config (savehist-mode 1))

;; sudo support

(req-package sudo-ext
  :ensure t)

(req-package scratch-ext
  :ensure t)

(req-package scratch-persist
  :ensure t
  :require (eldoc scratch-ext)
  :init (setq scratch-persist-file "~/Dropbox/emacs/scratch.el"))

;; indentation

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(add-hook-exec 'find-file (lambda () (setq indent-tabs-mode nil)))
(electric-indent-mode 1)

;; show keystrockes early

(setq echo-keystrokes 0.2)

;; mark ring tweaks

(setq set-mark-command-repeat-pop t)

;; save bookmarks on emacs exit

(setq-default bookmark-save-flag 1)

;; do not use dialog boxes

(setq use-dialog-box nil)

;; enable upcase and downcase region commands

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; enable narrowing

(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

;; default mode for text editing

(setq-default major-mode 'text-mode)

;; disable defining variables in files

(setq enable-local-variables nil)

;; simplify yes or no

(defalias 'yes-or-no-p 'y-or-n-p)

;; switch window

(req-package ace-window
  :ensure t
  :commands (ace-window)
  :bind (("C-x o" . ace-window)))

;; ace jump mode

(req-package ace-jump-mode
  :ensure t
  :bind (("M-/" . ace-jump-word-mode)
         ("M-'" . ace-jump-char-mode)
         ("M-g M-g" . ace-jump-line-mode)))

;; quickly jump to links

(req-package ace-link
  :ensure t
  :bind ("M-/" . ace-jump-word-mode)
  :config (ace-link-setup-default))

;; ace jump buffer

(req-package ace-jump-buffer
  :ensure t
  :require (shell)
  :bind ("M-?" . ace-jump-buffer))

;; move text

(req-package move-text
  :ensure t
  :bind (("M-n" . move-text-down)
         ("M-p" . move-text-up)))

;; duplicate thing

(req-package duplicate-thing
  :ensure t
  :bind ("M-c" . duplicate-thing))

;; smart parenthesis

(req-package smartparens-config
  :ensure smartparens
  :config
  (smartparens-global-mode t)
  (add-hook-exec 'fennel-mode 'smartparens-strict-mode)
  (add-hook-exec 'clojure-mode 'smartparens-strict-mode)
  (add-hook-exec 'emacs-lisp-mode 'smartparens-strict-mode)
  (add-hook-exec 'lisp-interaction-mode 'smartparens-strict-mode)
  (add-hook-exec 'css-mode 'smartparens-strict-mode)
  (add-hook-exec 'rust-mode 'smartparens-strict-mode)
  (show-smartparens-global-mode t))

;; auto reverting

(req-package autorevert
  :ensure t
  :config (progn (setq global-auto-revert-non-file-buffers nil)
                 (setq auto-revert-interval 0.5)
                 (setq auto-revert-verbose nil)
                 (add-to-list 'auto-mode-alist '("\\.log\\'" . auto-revert-tail-mode))))

;; expand region

(req-package expand-region
  :ensure t
  :bind ("M-=" . er/expand-region)
  :init (eval-after-load 'dired '(define-key dired-mode-map (kbd "M-=") 'er/expand-region)))

;; desc unbound keys

(req-package unbound
  :ensure t
  :commands describe-unbound-keys)

;; rotate

(req-package rotate
  :ensure t
  :bind ("C-M-s-<return>" . rotate-layout))

;; rectangles

(req-package rectangle-utils
  :ensure t
  :bind ("C-x r e" . rectangle-utils-extend-rectangle-to-end))

(req-package idle-highlight-mode
  :ensure t
  :require org-faces
  :config
  (setq idle-highlight-idle-time 0.5)
  (set-face-attribute 'idle-highlight nil :inherit 'org-todo)
  (add-hook-exec 'emacs-lisp-mode 'idle-highlight-mode))

(req-package idle-highlight-mode
  :ensure t
  :require clojure-mode
  :config (add-hook-exec 'clojure-mode 'idle-highlight-mode))

(req-package idle-highlight-mode
  :ensure t
  :require sgml-mode
  :config (add-hook-exec 'sgml-mode 'idle-highlight-mode))

(req-package guide-key
  :ensure t
  :config
  (setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x v" "C-x C-a" "C-c" "C-x" "C-c C-v" "C-c C-t" "C-c C-m" "C-x c"))
  (guide-key-mode 1))

(req-package protobuf-mode
  :ensure t
  :mode (("proto\\'" . protobuf-mode)))

(setq visible-bell t)

(provide 'init-ext)
