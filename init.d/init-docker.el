(require 'req-package)

(req-package dockerfile-mode
  :ensure t
  :mode ("Dockerfile\\'" . dockerfile-mode))

(req-package docker
  :ensure t
  :commands docker-ps docker-start docker-stop)

(req-package docker-tramp
  :ensure t)

(provide 'init-docker)
