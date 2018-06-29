(require 'req-package)

(req-package ido
  :ensure t
  :bind (("C-x C-f" . ido-find-file))
  :commands (ido-switch-buffer)
  :config
  (ido-mode 1)
  (ido-everywhere 1))

(req-package flx
  :ensure t)

(req-package flx-ido
  :ensure t
  :require flx ido
  :config
  (flx-ido-mode 1)
  (setq ido-enable-flex-matching t)
  (setq ido-use-faces nil))

(req-package ido-at-point
  :ensure t
  :require ido
  :config (ido-at-point-mode 1))

(provide 'init-ido)
