(require 'req-package)

;; xt mosue

(req-package xt-mouse
  :ensure t
  :require mouse
  :config (progn (xterm-mouse-mode 1)
                 (defun track-mouse (e))))

(req-package mouse
  :config (progn (global-set-key (kbd "<C-down-mouse-1>") nil)
                 (global-set-key (kbd "<C-down-mouse-2>") nil)
                 (global-set-key (kbd "<C-down-mouse-3>") nil)
                 (global-set-key (kbd "<mouse-3>") nil)))

;; smooth mouse scroll

(req-package mwheel
  :config
  (progn (setq mouse-wheel-progressive-speed nil)
         (setq mouse-wheel-follow-mouse t)
         (global-set-key (kbd "<mouse-6>") (lambda () (interactive) nil))
         (global-set-key (kbd "<double-mouse-6>") (lambda () (interactive) nil))
         (global-set-key (kbd "<triple-mouse-6>") (lambda () (interactive) nil))
         (global-set-key (kbd "<mouse-7>") (lambda () (interactive) nil))
         (global-set-key (kbd "<double-mouse-7>") (lambda () (interactive) nil))
         (global-set-key (kbd "<triple-mouse-7>") (lambda () (interactive) nil))
         (global-set-key (kbd "<triple-wheel-left>") (lambda () (interactive) nil))
         (global-set-key (kbd "<double-wheel-left>") (lambda () (interactive) nil))
         (global-set-key (kbd "<wheel-left>") (lambda () (interactive) nil))
         (global-set-key (kbd "<triple-wheel-right>") (lambda () (interactive) nil))
         (global-set-key (kbd "<double-wheel-right>") (lambda () (interactive) nil))
         (global-set-key (kbd "<wheel-right>") (lambda () (interactive) nil))
         (setq scroll-step 2)
         (setq auto-window-vscroll nil)
         (setq scroll-preserve-screen-position t)
         (setq isearch-allow-scroll t)))

;; focus follows mouse

(setq mouse-autoselect-window t)

(provide 'init-mouse)
