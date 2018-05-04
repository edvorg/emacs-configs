(require 'req-package)

(req-package shift-number
  :ensure t
  :bind (("C-M-<up>" . shift-number-up)
         ("C-M-<down>" . shift-number-down)))

(req-package bool-flip
  :ensure t
  :bind (("C-M-^" . bool-flip-do-flip)))

(req-package twittering-mode
  :ensure t
  :commands twit
  :config
  (setq twittering-icon-mode t)
  (setq twittering-use-icon-storage t)
  (load "~/Dropbox/emacs/twittering-custom.el" t)
  (setq twittering-use-master-password t)
  (twittering-enable-unread-status-notifier))

(req-package mastodon
  :ensure t
  :commands mastodon
  :init (setq mastodon-instance-url "https://mastodon.social"))

(req-package multifiles
  :ensure t
  :bind ("C-!" . mf/mirror-region-in-multifile))

;; proced

(req-package proced
  :ensure t
  :commands proced
  :config (setq-default proced-filter 'all))

;; zoom frame

(req-package zoom-frm
  :ensure t
  :commands zoom-in/out
  :init (progn (define-key ctl-x-map [(control ?+)] 'zoom-in/out)
			   (define-key ctl-x-map [(control ?-)] 'zoom-in/out)
			   (define-key ctl-x-map [(control ?=)] 'zoom-in/out)
			   (define-key ctl-x-map [(control ?0)] 'zoom-in/out)))

;; process management

(req-package list-processes
  :bind ("<f2>" . list-processes+))

;; camcoder

(req-package camcorder
  :ensure t
  :commands camcorder-record)

;; edit server

(req-package edit-server
  :ensure t
  :config (edit-server-start))

;; emacs bugtracker

(req-package debbugs
  :ensure t
  :commands debbugs)

;; open recent files

(req-package recentf
  :ensure t
  :config (recentf-mode 1))

;; revertible delete other windows

(req-package zygospore
  :ensure t
  :chords ((";1" . zygospore-toggle-delete-other-windows)))

;; delete trailing whitespaces before saving some buffer

(add-hook-exec 'before-save 'delete-trailing-whitespace)

;; temp file

(req-package find-temp-file
  :ensure t
  :bind ("C-x C-t" . find-temp-file))

;; narrow region to other window

(req-package narrow-indirect
  :ensure t)

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

;; google tanslate

(req-package google-translate-smooth-ui
  :ensure google-translate
  :bind ("C-c t" . google-translate-smooth-translate))

(req-package define-word
  :ensure t
  :bind ("C-c d" . define-word-at-point))

;; swith off some warnings

(req-package warnings
  :ensure t
  :config (add-to-list 'warning-suppress-types '(undo discard-info)))

;; use fuzzy for M-x

(req-package smex
  :ensure t
  :bind ("M-x" . smex)
  :config (smex-initialize))

;; googling

(req-package google-this
  :commands google-this
  :ensure t)

;; string edit

(req-package string-edit
  :ensure t
  :bind ("C-c e" . string-edit-at-point))

;; paradox

(req-package paradox
  :ensure t
  :chords ((";p" . paradox-list-packages)))

;; multiple cursors

(req-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C-<" . mc/mark-previous-like-this)
         ("C->" . mc/mark-next-like-this)
         ("C-c ." . mc/mark-all-like-this)
         ("C-M->" . mc/skip-to-next-like-this)
         ("C-M-<" . mc/skip-to-previous-like-this)))

;; ant

(req-package ant
  :ensure t
  :commands ant)

;; sos

(req-package sos
  :ensure t
  :commands sos)

;; howdoi

(req-package howdoi
  :ensure t
  :commands howdoi-query)

;; swoop

(req-package swoop
  :ensure t
  :commands swoop)

;; save history

(req-package savehist
  :ensure t
  :config (savehist-mode 1))

;; sudo support

(req-package sudo-ext
  :ensure t)

;; scratch persist

(req-package hl-defined
  :ensure t)

(req-package scratch-ext
  :ensure t)

(req-package scratch-persist
  :ensure t
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
  :ensure t
  :chords ((";o" . ace-window))
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
  :config (progn (smartparens-global-mode t)
                 (add-hook-exec 'clojure-mode 'smartparens-strict-mode)
                 (add-hook-exec 'emacs-lisp-mode 'smartparens-strict-mode)
                 (add-hook-exec 'css-mode 'smartparens-strict-mode)
                 (add-hook-exec 'rust-mode 'smartparens-strict-mode)
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
  :ensure t
  :config (progn (setq global-auto-revert-non-file-buffers nil)
                 (setq auto-revert-interval 0.5)
                 (setq auto-revert-verbose nil)
                 (add-to-list 'auto-mode-alist '("\\.log\\'" . auto-revert-tail-mode))))

;; shrink/enlarge window

(global-set-key (kbd "C-M-{") (lambda () (interactive) (shrink-window 10 1)))
(global-set-key (kbd "C-M-}") (lambda () (interactive) (enlarge-window 10 1)))
(global-set-key (kbd "C-M-?") (lambda () (interactive) (shrink-window 5 nil)))
(global-set-key (kbd "C-M-\"") (lambda () (interactive) (enlarge-window 5 nil)))
(global-set-key (kbd "C-M-]") (lambda () (interactive) (other-window 1)))
(global-set-key (kbd "C-M-[") (lambda () (interactive) (other-window -1)))

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

(req-package prodigy
  :ensure t
  :commands prodigy)

(req-package fireplace
  :ensure t
  :commands fireplace)

(req-package neotree
  :ensure t
  :commands neotree)

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

;; (req-package easy-kill
;;   :config (global-set-key [remap kill-ring-save] 'easy-kill))

(req-package podcaster
  :commands podcaster
  :ensure t
  :config (setq podcaster-feeds-urls '("http://feeds.cognitect.com/cognicast/feed.rss")))

(req-package wotd
  :ensure t
  :commands wotd-all wotd-select)

(req-package neotree
  :bind ("C-c C-f C-d" . neotree-toggle))

(req-package protobuf-mode
  :ensure t
  :mode (("proto\\'" . protobuf-mode)))

(provide 'init-ext)
