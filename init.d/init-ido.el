(require 'req-package)

(req-package flx-ido
  :require flx
  :bind (("C-x C-f" . ido-find-file))
  :chords (("xb" . ido-switch-buffer))
  :config (progn (ido-mode 1)
                 (ido-everywhere 1)
                 (flx-ido-mode 1)
                 ;; disable ido faces to see flx highlights.
                 (setq ido-enable-flex-matching t)
                 (setq ido-use-faces nil)))

(req-package ido-at-point
  :require ido
  :config (ido-at-point-mode 1))

(provide 'init-ido)
