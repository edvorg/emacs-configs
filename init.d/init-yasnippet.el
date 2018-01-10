(require 'req-package)

(req-package yasnippet
  :ensure t
  :config (progn (yas-global-mode 1)
                 (define-key yas-minor-mode-map (kbd "C-M-y") 'yas-expand)))

(provide 'init-yasnippet)
