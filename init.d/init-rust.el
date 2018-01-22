(require 'req-package)

(req-package rust-mode
  :ensure t
  :pin melpa-stable
  :mode (("rs\\'" . rust-mode))
  :init
  (add-to-list 'exec-path "~/.cargo/bin")
  :config
  (add-hook-exec 'rust-mode #'racer-mode))

(req-package racer
  :ensure t
  :pin melpa-stable
  :commands (racer-mode)
  :init
  (setq racer-rust-src-path (shell-command-to-string "echo -n $(rustc --print sysroot)/lib/rustlib/src/rust/src"))
  :config
  (add-hook-exec 'racer-mode #'eldoc-mode)
  (add-hook-exec 'racer-mode #'company-mode)
  (add-hook-exec 'racer-mode #'cargo-minor-mode))

(req-package cargo
  :ensure t
  :pin melpa-stable
  :commands cargo-minor-mode)

(req-package flycheck-rust
  :ensure t
  :require flycheck
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(req-package toml-mode
  :ensure t
  :mode (("toml\\'" . toml-mode)))
