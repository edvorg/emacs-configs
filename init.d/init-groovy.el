(require 'req-package)

(req-package groovy-mode
  :ensure t
  :mode (("groovy\\'" . groovy-mode)))

(provide 'init-grooovy)
