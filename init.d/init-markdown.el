(require 'req-package)

;; md mode

(req-package markdown-mode
  :ensure t :mode "\\.md\\'")

(provide 'init-markdown)
