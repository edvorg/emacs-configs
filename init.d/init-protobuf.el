(require 'req-package)

(req-package protobuf-mode
  :require (flycheck flycheck-protobuf)
  :mode(("proto\\'" . protobuf-mode))
  :config (add-hook-exec 'protobuf-mode
            (lambda () (flycheck-select-checker 'protobuf-protoc-reporter))))

(provide 'init-protobuf)
