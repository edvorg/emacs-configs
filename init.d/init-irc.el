(require 'req-package)

(req-package circe
  :config
  (add-hook-exec 'circe-mode (lambda () (tracking-mode -1)))
  (load "~/Dropbox/emacs/circe-custom.el" t))

(req-package helm-circe
  :require helm circe
  :bind (("<f7>" . helm-circe)))

(provide 'init-irc)
