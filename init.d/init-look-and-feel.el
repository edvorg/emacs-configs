(require 'req-package)

;; cursor configuration

(setq-default cursor-type 'box)
(blink-cursor-mode 1)

;; use timeclock

(req-package timeclock
  :ensure t
  :config (progn (display-time-mode 1)))

;; some very useful extension

(req-package nyan-mode
  :ensure t
  :config (progn (setq nyan-animation-frame-interval 0.1)
                 (setq nyan-bar-length 8)
                 (setq nyan-wavy-trail t)
                 (nyan-mode)
                 (nyan-start-animation)))

;; customizations

(req-package menu-bar
  :config
  (menu-bar-mode -1))

;; main line

(req-package smart-mode-line
  :ensure t
  :config
  (progn (setq sml/shorten-modes t)
         (setq sml/shorten-directory t)
         (setq sml/name-width 20)
         (setq sml/mode-width 'full)
         (setq sml/hidden-modes nil)
		 (setq sml/theme nil)
         (add-to-list 'sml/hidden-modes " Anzu")
         (add-to-list 'sml/hidden-modes " AC")
         (add-to-list 'sml/hidden-modes " yas")
         (add-to-list 'sml/hidden-modes " pair")
         (add-to-list 'sml/hidden-modes " FIC")
         (add-to-list 'sml/hidden-modes " Abbrev")
         (add-to-list 'sml/hidden-modes " ARev")
         (add-to-list 'sml/hidden-modes " SliNav")
         (add-to-list 'sml/hidden-modes " ElDoc")
         (add-to-list 'sml/hidden-modes " company")
         (add-to-list 'sml/hidden-modes " overseer")
         (add-to-list 'sml/hidden-modes " Guide")
         (sml/setup)))

;; theme

(defvar my-random-themes nil)
(defvar my-theme-customizations (make-hash-table :test 'equal))

(defun add-theme (theme &optional custom-fn)
  (add-to-list 'my-random-themes theme)
  (when custom-fn
    (puthash theme custom-fn my-theme-customizations)))

;; (normalize-faces (face-list))

(req-package soothe-theme
  :ensure t
  :require smart-mode-line
  :defer t
  :init
  (add-theme 'soothe))

(req-package gotham-theme
  :ensure t
  :require smart-mode-line
  :defer t
  :init
  (add-theme 'gotham))

(req-package kaolin-themes
  :ensure t
  :require smart-mode-line
  :defer t
  :init
  (add-theme 'kaolin-dark)
  (add-theme 'kaolin-ocean)
  (add-theme 'kaolin-eclipse))

(req-package gruvbox-theme
  :ensure t
  :require smart-mode-line
  :defer t
  :init
  (add-theme 'gruvbox))

(req-package darktooth-theme
  :ensure t
  :require smart-mode-line
  :defer t
  :init
  (add-theme 'darktooth))

(req-package jazz-theme
  :ensure t
  :require smart-mode-line
  :defer t
  :init
  (add-theme 'jazz))

(req-package yoshi-theme
  :ensure t
  :require smart-mode-line
  :defer t
  :init
  (add-theme 'yoshi))

(req-package plan9-theme
  :ensure t
  :require smart-mode-line
  :defer t
  :init
  (add-theme 'plan9))

(req-package sublime-themes
  :ensure t
  :require smart-mode-line
  :defer t
  :init
  (add-theme 'junio)
  (add-theme 'wilson))

(defun select-theme (&optional theme)
  (interactive)
    (let* ((themes-vec (vconcat my-random-themes))
           (len        (length themes-vec))
           (selection  (or (and (-contains? my-random-themes theme)
                                theme)
                           (aref themes-vec (random len)))))
      (dolist (theme custom-enabled-themes)
        (disable-theme theme))
      (message "selected theme %s" selection)
      (load-theme selection t)))

(defun load-theme-advice (theme &optional no-confirm no-enable)
  (let* ((f (gethash theme my-theme-customizations)))
    (when f
      (funcall f))))

(advice-add 'load-theme :after #'load-theme-advice)

(req-package anzu
  :ensure t
  :require
  smart-mode-line
  :config
  (global-anzu-mode 1))

(req-package simple
  :config
  (column-number-mode 1))

(req-package tool-bar
  :config
  (tool-bar-mode -1))

(req-package scroll-bar
  :config
  (scroll-bar-mode -1))

(setq make-pointer-invisible nil)

(req-package fic-mode
  :ensure t
  :config
  (add-hook-exec 'prog-mode (lambda () (fic-mode 1))))

(req-package rainbow-delimiters
  :ensure t
  :commands rainbow-delimiters-mode
  :init
  (custom-set-variables '(rainbow-delimiters-max-face-count 8))
  (add-hook-exec 'emacs-lisp-mode (lambda () (rainbow-delimiters-mode 1))))

(req-package rainbow-delimiters
  :ensure t
  :require clojure-mode
  :commands rainbow-delimiters-mode
  :init
  (add-hook-exec 'clojure-mode (lambda () (rainbow-delimiters-mode 1))))

(req-package smartrep
  :ensure t)

(req-package diff-hl
  :ensure t
  :require smartrep
  :config
  (global-diff-hl-mode 1)
  )

(req-package nameless
  :ensure t
  :config (add-hook-exec 'emacs-lisp-mode #'nameless-mode))

(req-package dash
  :ensure t
  :config
  (dash-enable-font-lock))

(provide 'init-look-and-feel)
