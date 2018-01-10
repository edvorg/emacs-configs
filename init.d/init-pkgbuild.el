(require 'req-package)

;; pkgbuild mode

(req-package pkgbuild-mode
  :ensure t :mode "\\PKGBUILD\\'")

(provide 'init-pkgbuild)
