(require 'req-package)

(req-package shift-number
  :bind (("C-M-<up>" . shift-number-up)
         ("C-M-<down>" . shift-number-down)))

(req-package twittering-mode
  :commands twit
  :config
  (setq twittering-icon-mode t)
  (setq twittering-use-icon-storage t)
  (load "~/Dropbox/emacs/twittering-custom.el" t)
  (setq twittering-use-master-password t)
  (twittering-enable-unread-status-notifier))

(req-package multifiles
  :bind ("C-!" . mf/mirror-region-in-multifile))

;; proced

(req-package proced
  :commands proced
  :config (setq-default proced-filter 'all))

;; zoom frame

(req-package zoom-frm
  :commands zoom-in/out
  :init (progn (define-key ctl-x-map [(control ?+)] 'zoom-in/out)
			   (define-key ctl-x-map [(control ?-)] 'zoom-in/out)
			   (define-key ctl-x-map [(control ?=)] 'zoom-in/out)
			   (define-key ctl-x-map [(control ?0)] 'zoom-in/out)))

;; process management

(req-package list-processes+
  :bind ("<f2>" . list-processes+))

;; camcoder

(req-package camcorder :commands camcorder-record)

;; edit server

(req-package edit-server
  :config (edit-server-start))

;; emacs bugtracker

(req-package debbugs :commands debbugs)

;; open recent files

(req-package recentf
  :config (recentf-mode 1))

;; revertible delete other windows

(req-package zygospore
  :chords ((";1" . zygospore-toggle-delete-other-windows)))

;; delete trailing whitespaces before saving some buffer

(add-hook-exec 'before-save 'delete-trailing-whitespace)

;; temp file

(req-package find-temp-file
  :bind ("C-x C-t" . find-temp-file))

;; narrow region to other window

(req-package narrow-indirect)

;; shit text left/right

(req-package smart-shift
  :bind (("C-{" . smart-shift-left)
         ("C-}" . smart-shift-right)))

;; save kill ring to disk

(req-package savekill
  :config (progn (setq savekill-max-saved-items nil)
                 (load save-kill-file-name t)))

;; google tanslate

(req-package google-translate
  :init (require 'google-translate-smooth-ui)
  :bind ("C-c t" . google-translate-smooth-translate))

(req-package define-word
  :bind ("C-c d" . define-word-at-point))

;; swith off some warnings

(req-package warnings
  :config (add-to-list 'warning-suppress-types '(undo discard-info)))

;; use fuzzy for M-x

(req-package smex
  :bind ("M-x" . smex)
  :config (smex-initialize))

;; googling

(req-package google-this)

;; string edit

(req-package string-edit
  :config (global-set-key (kbd "C-c e") 'string-edit-at-point))

;; paradox

(req-package paradox
  :chords ((";p" . paradox-list-packages)))

;; multiple cursors

(req-package multiple-cursors
  :init
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-c C-.") 'mc/mark-all-like-this))

;; ant

(req-package ant)

;; sos

(req-package sos :commands sos)

;; howdoi

(req-package howdoi)

;; swoop

(req-package swoop :commands swoop)

;; save history

(req-package savehist
  :config (savehist-mode 1))

;; sudo support

(req-package sudo-ext)

;; scratch persist

(req-package scratch-persist
  :require (eldoc hl-defined scratch-ext)
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
  :chords ((";o" . ace-window))
  :bind (("C-x o" . ace-window)))

;; ace jump mode

(req-package ace-jump-mode
  :bind (("M-/" . ace-jump-word-mode)
         ("M-'" . ace-jump-char-mode)
         ("M-g M-g" . ace-jump-line-mode)))

;; quickly jump to links

(req-package ace-link :config (ace-link-setup-default))

;; ace jump buffer

(req-package ace-jump-buffer
  :require (shell)
  :bind ("M-?" . ace-jump-buffer))

;; move text

(req-package move-text
  :config (progn (global-set-key (kbd "M-n") 'move-text-down)
                 (global-set-key (kbd "M-p") 'move-text-up)))

;; duplicate thing

(req-package duplicate-thing
  :config (progn (global-set-key (kbd "M-c") 'duplicate-thing)))

;; smart parenthesis

(req-package smartparens-config
  :require smartparens
  :config (progn (smartparens-global-mode t)
                 (smartparens-global-strict-mode t)
                 (show-smartparens-global-mode t)
                 (global-set-key (kbd "C-M-a") 'sp-beginning-of-sexp)
                 (global-set-key (kbd "C-M-e") 'sp-end-of-sexp)
                 (global-set-key (kbd "C-M-k") 'sp-kill-sexp)
                 (global-set-key (kbd "C-M-k") 'sp-kill-sexp)
                 (global-set-key (kbd "C-M-n") 'sp-forward-sexp)
                 (global-set-key (kbd "C-M-p") 'sp-backward-sexp)
                 (global-set-key (kbd "C-M-b") 'sp-up-sexp)
                 (global-set-key (kbd "C-M-f") 'sp-down-sexp)))

;; auto reverting

(req-package autorevert
  :config (progn (setq global-auto-revert-non-file-buffers t)
                 (setq auto-revert-interval 0.5)
                 (setq auto-revert-verbose nil)
                 (add-to-list 'auto-mode-alist '("\\.log\\'" . auto-revert-tail-mode))))

;; shrink/enlarge window

(global-set-key (kbd "s-{") (lambda () (interactive) (shrink-window 10 1)))
(global-set-key (kbd "s-}") (lambda () (interactive) (enlarge-window 10 1)))
(global-set-key (kbd "s-?") (lambda () (interactive) (shrink-window 5 nil)))
(global-set-key (kbd "s-\"") (lambda () (interactive) (enlarge-window 5 nil)))
(global-set-key (kbd "s-]") (lambda () (interactive) (other-window 1)))
(global-set-key (kbd "s-[") (lambda () (interactive) (other-window -1)))

;; expand region

(req-package expand-region
  :bind ("M-=" . er/expand-region)
  :init (eval-after-load 'dired '(define-key dired-mode-map (kbd "M-=") 'er/expand-region)))

;; desc unbound keys

(req-package unbound)

;; rotate

(req-package rotate
  :config
  (global-set-key (kbd "s-P") 'rotate-layout))

;; rectangles

(req-package rectangle-utils
  :bind ("C-x r e" . extend-rectangle-to-end))

(req-package prodigy
  :commands prodigy)

(req-package symon
  :disabled t
  :config (symon-mode 1))

(req-package fireplace
  :commands fireplace)

(req-package keyfreq
  :config
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))

(req-package neotree
  :commands neotree)

(req-package idle-highlight-mode
  :config
  (setq idle-highlight-idle-time 1.0)
  (set-face-attribute 'idle-highlight nil :inherit 'underline)
  (add-hook-exec 'emacs-lisp-mode 'idle-highlight-mode))

(req-package idle-highlight-mode
  :require clojure-mode
  :config (add-hook-exec 'clojure-mode 'idle-highlight-mode))

(req-package idle-highlight-mode
  :require sgml-mode
  :config (add-hook-exec 'sgml-mode 'idle-highlight-mode))

(req-package guide-key
  :config
  (setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x v" "C-x C-a" "C-c" "C-x" "C-c C-v"))
  (guide-key-mode 1))

(req-package elfeed
  :commands elfeed
  :config
  (setf url-queue-timeout 60)
  (load "~/Dropbox/emacs/elfeed-feeds.el" t)
  (setq elfeed-db-directory "~/Dropbox/emacs/elfeed")
  (setq elfeed-enclosure-default-dir "~/Dropbox/emacs")
  (setq elfeed-search-filter "@1-months-ago +unread"))

(provide 'init-ext)
