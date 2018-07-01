(require 'req-package)

(req-package rust-mode
  :ensure t
  :mode (("rs\\'" . rust-mode))
  :init
  (add-to-list 'exec-path "~/.cargo/bin")
  :config
  (add-hook-exec 'rust-mode #'lsp-rust-enable))

(req-package cargo
  :ensure t
  :commands cargo-minor-mode)

(req-package lsp-rust
  :commands lsp-rust-enable)

(req-package toml-mode
  :ensure t
  :mode (("toml\\'" . toml-mode)))
