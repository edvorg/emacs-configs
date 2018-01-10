(require 'req-package)

;; glsl

(req-package glsl-mode
  :ensure t
  :mode (("\\.vs\\'" . glsl-mode)
         ("\\.fs\\'" . glsl-mode)
         ("\\.gs\\'" . glsl-mode))
  :config (setq glsl-other-file-alist '(("\\.fs$" (".vs"))
                                        ("\\.vs$" (".fs")))))

(provide 'init-glsl)
