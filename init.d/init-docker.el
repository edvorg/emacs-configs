(require 'req-package)

(req-package dockerfile-mode
  :mode ("Dockerfile\\'" . dockerfile-mode))

(req-package docker
  :commands docker-ps docker-start docker-stop)

(req-package docker-tramp)

(provide 'init-docker)
