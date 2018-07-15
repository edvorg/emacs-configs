(require 'req-package)

(req-package sgml-mode
  :mode ("\\.html\\'" . sgml-mode))

(req-package emmet-mode
  :ensure t
  :require (css-mode sgml-mode)
  :commands emmet-mode
  :init (progn (add-hook-exec 'sgml-mode 'emmet-mode)
               (add-hook-exec 'css-mode 'emmet-mode)))

(req-package scss-mode
  :ensure t
  :mode ("\\.scss\\'" . scss-mode))

(req-package css-mode
  :config (setq css-indent-offset 2))

(req-package django-mode
  :ensure t
  :mode ("\\.djhtml\\'" . django-html-mode))

(provide 'init-web)
