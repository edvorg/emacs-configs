(req-package ensime
  :ensure t)

(req-package scala-mode
  :ensure t
  :mode ("\\.scala$" . scala-mode))

(provide 'init-scala)
