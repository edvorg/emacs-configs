(require 'req-package)

(req-package scala-mode
  :config (progn (setq scala-indent:align-parameters t))
  :mode (("\\.scala\\'" . scala-mode)
         ("\\.sc\\'" . scala-mode)))

(req-package sbt-mode
  :commands sbt-start)

(req-package ensime
  :require scala-mode
  :config (add-hook-exec 'scala-mode 'ensime-scala-mode-hook))

(provide 'init-scala)
