(require 'req-package)

(req-package rust-mode
  :mode (("rs\\'" . rust-mode))
  :init
  (add-to-list 'exec-path "~/.cargo/bin")
  :config
  (add-hook-exec 'rust-mode #'racer-mode))

(req-package racer
  :commands (racer-mode)
  :config
  (add-hook-exec 'racer-mode #'eldoc-mode)
  (add-hook-exec 'racer-mode #'company-mode)
  (add-hook-exec 'racer-mode #'cargo-minor-mode))

(req-package cargo
  :commands cargo-minor-mode)

(req-package flycheck-rust
  :require flycheck
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(req-package toml-mode
  :mode (("toml\\'" . toml-mode)))
