(require 'req-package)

;; yaml

(req-package yaml-mode
  :ensure t
  :mode "\\.yml\\'")

(provide 'init-yaml)
