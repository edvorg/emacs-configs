(require 'req-package)

;; cursor configuration

(setq-default cursor-type 'box)
(blink-cursor-mode 1)

;; use timeclock

(req-package timeclock
  :config (progn (display-time-mode 1)))

;; highlight number in code

(req-package highlight-numbers
  :config (add-hook-exec 'find-file (lambda () (highlight-numbers-mode 1))))

;; some very useful extension

(req-package nyan-mode
  :config (progn (setq nyan-animation-frame-interval 0.1)
                 (setq nyan-bar-length 8)
                 (setq nyan-wavy-trail t)
                 (nyan-mode)
                 (nyan-start-animation)))

;; beacon

(req-package beacon
  :config (beacon-mode))

;; customizations

(req-package menu-bar
  :config
  (menu-bar-mode -1))

;; main line

(req-package smart-mode-line
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
         (sml/setup)))

;; theme

(defvar my-random-themes nil)
(defvar my-theme-customizations (make-hash-table :test 'equal))

(defun add-theme (theme &optional custom-fn)
  (add-to-list 'my-random-themes theme)
  (when custom-fn
    (puthash theme custom-fn my-theme-customizations)))

(defun normalize-faces (faces)
  (dolist (face faces)
    (progn
      (set-face-attribute face nil :family "menlo")
      (set-face-attribute face nil :underline nil)
      (set-face-attribute face nil :box nil)
      (set-face-attribute face nil :height 1.0)
      (set-face-attribute face nil :width 'normal)
      (set-face-attribute face nil :weight 'normal))))

(defun normalize-common-faces ()
  (eval-after-load 'smartparens
    (normalize-faces '(show-paren-match)))
  (eval-after-load 'org-faces
    (normalize-faces '(org-level-1
                       org-level-2
                       org-level-3
                       org-level-4
                       org-level-5
                       org-level-6
                       org-level-7
                       org-level-8
                       org-todo
                       org-done
                       org-document-title))))

(req-package soothe-theme
  :require smart-mode-line
  :defer t
  :init
  (add-theme 'soothe))

(req-package gotham-theme
  :require smart-mode-line
  :defer t
  :init
  (add-theme 'gotham))

(req-package gruvbox-theme
  :require smart-mode-line
  :defer t
  :init
  (add-theme 'gruvbox))

(req-package firebelly-theme
  :require smart-mode-line
  :defer t
  :init
  (add-theme 'firebelly))

(req-package darktooth-theme
  :require smart-mode-line
  :defer t
  :init
  (add-theme 'darktooth))

(req-package hc-zenburn-theme
  :require smart-mode-line
  :defer t
  :init
  (add-theme 'hc-zenburn))

(req-package dracula-theme
  :require smart-mode-line
  :defer t
  :init
  (add-theme 'dracula))

(req-package reykjavik-theme
  :require smart-mode-line
  :defer t
  :init
  (add-theme 'reykjavik))

(req-package jazz-theme
  :require smart-mode-line
  :defer t
  :init
  (add-theme 'jazz))

(req-package cyberpunk-theme
  :require smart-mode-line
  :defer t
  :init
  (add-theme 'cyberpunk
             (lambda ()
               (normalize-common-faces))))

(req-package mbo70s-theme
  :require smart-mode-line
  :defer t
  :init
  (add-theme 'mbo70s))

(req-package yoshi-theme
  :require smart-mode-line
  :defer t
  :init
  (add-theme 'yoshi))

(req-package suscolors-theme
  :require smart-mode-line
  :defer t
  :init
  (add-theme 'suscolors))

(req-package danneskjold-theme
  :require smart-mode-line
  :defer t
  :init
  (add-theme 'danneskjold))

(req-package plan9-theme
  :require smart-mode-line
  :defer t
  :init
  (add-theme 'plan9
             (lambda ()
               (normalize-common-faces))))

(req-package sublime-themes
  :require smart-mode-line
  :defer t
  :init
  (add-theme 'spolsky)
  (add-theme 'graham)
  (add-theme 'odersky)
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

;; anzu

(req-package anzu
  :require
  smart-mode-line
  :config
  (global-anzu-mode 1))

;; mode line tweaks

(req-package simple
  :config
  (column-number-mode 1))

;; toolbar

(req-package tool-bar
  :config
  (tool-bar-mode -1))

;; scroll bar

(req-package scroll-bar
  :config
  (scroll-bar-mode -1))

;; miscaleous tweeks

(setq make-pointer-invisible nil)

;; todo, fixme highlighting

(req-package fic-mode
  :config
  (add-hook-exec 'prog-mode (lambda () (fic-mode 1))))

(req-package rainbow-delimiters
  :require clojure-mode
  :commands rainbow-delimiters-mode
  :init (progn (custom-set-variables '(rainbow-delimiters-max-face-count 8))
               (custom-set-faces '(rainbow-delimiters-depth-1-face ((t (:inherit org-level-1)))))
               (custom-set-faces '(rainbow-delimiters-depth-2-face ((t (:inherit org-level-2)))))
               (custom-set-faces '(rainbow-delimiters-depth-3-face ((t (:inherit org-level-3)))))
               (custom-set-faces '(rainbow-delimiters-depth-4-face ((t (:inherit org-level-4)))))
               (custom-set-faces '(rainbow-delimiters-depth-5-face ((t (:inherit org-level-5)))))
               (custom-set-faces '(rainbow-delimiters-depth-6-face ((t (:inherit org-level-6)))))
               (custom-set-faces '(rainbow-delimiters-depth-7-face ((t (:inherit org-level-7)))))
               (custom-set-faces '(rainbow-delimiters-depth-8-face ((t (:inherit org-level-8)))))
               (add-hook-exec 'emacs-lisp-mode (lambda () (rainbow-delimiters-mode 1)))
               (add-hook-exec 'clojure-mode (lambda () (rainbow-delimiters-mode 1)))))

;; diff highlight

(req-package diff-hl
  :require smartrep
  :config
  (global-diff-hl-mode 1)
  (global-set-key (kbd "C-x v R") 'diff-hl-revert-hunk))

(provide 'init-look-and-feel)
