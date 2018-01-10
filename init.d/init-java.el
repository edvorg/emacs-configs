(require 'req-package)

(req-package ant
  :ensure t :commands ant)

(req-package emacs-eclim
  :ensure t :disabled t)

(req-package malabar-mode
  :ensure t :disabled t)

(provide 'init-java)
