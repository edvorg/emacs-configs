(require 'req-package)

;; xt mosue

(req-package xt-mouse
  :ensure t
  :require mouse
  :config
  (xterm-mouse-mode 1)
  (defun track-mouse (e)))

(req-package mouse)

;; smooth mouse scroll

(req-package mwheel
  :config
  (setq mouse-wheel-progressive-speed nil)
  (setq mouse-wheel-follow-mouse t)
  (setq scroll-step 2)
  (setq auto-window-vscroll nil)
  (setq scroll-preserve-screen-position t)
  (setq isearch-allow-scroll t))

;; focus follows mouse

(setq mouse-autoselect-window t)

(provide 'init-mouse)
