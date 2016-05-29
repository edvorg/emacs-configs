(require 'req-package)

;; haskell mode

(req-package haskell-mode
  :mode (("\\.hs$" . haskell-mode)
         (".xmobarrc$" . haskell-mode)
         ("\\.cabal$" . haskell-cabal-mode))
  :config
  (setq haskell-tags-on-save t)
  (setq haskell-process-type 'cabal-repl)
  (req-package-hooks-add-execute 'haskell-mode 'turn-on-haskell-doc-mode)
  (req-package-hooks-add-execute 'haskell-mode 'turn-on-haskell-indentation)
  (req-package-hooks-add-execute 'haskell-mode (lambda () (ghc-init))))

(req-package company-ghc
  :require haskell-mode company
  :config
  (add-to-list 'company-backends 'company-ghc))

(req-package hindent
  :require haskell-mode
  :commands hindent-mode
  :init (req-package-hooks-add-execute 'haskell-mode 'hindent-mode))

(req-package haskell-snippets
  :require haskell-mode yasnippet)

(provide 'init-haskell)
