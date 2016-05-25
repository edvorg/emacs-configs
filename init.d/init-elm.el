(require 'req-package)

(req-package elm-mode
  :mode (("elm\\'" . elm-mode)))

(req-package elm-yasnippets
  :require yasnippet elm-mode)

(provide 'init-elm)
