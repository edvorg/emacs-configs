(require 'req-package)

(load "~/Dropbox/emacs/circe-custom.el" t)

(req-package circe
  :commands circe)

(req-package helm-circe
  :require helm circe
  :bind (("<f7>" . helm-circe)))

(provide 'init-irc)
