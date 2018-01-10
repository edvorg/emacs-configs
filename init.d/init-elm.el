(require 'req-package)

(req-package elm-mode
  :ensure t
  :mode (("elm\\'" . elm-mode)))

(req-package elm-yasnippets
  :ensure t
  :require yasnippet elm-mode)

(provide 'init-elm)
