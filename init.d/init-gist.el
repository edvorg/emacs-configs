(require 'req-package)

;; gist client

(req-package gist
  :ensure t
  :bind (("<f8>" . gist-list)))

(provide 'init-gist)
