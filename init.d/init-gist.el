(require 'req-package)

;; gist client

(req-package gist
  :bind (("<f8>" . gist-list)))

(provide 'init-gist)
