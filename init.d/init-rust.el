(require 'req-package)

(req-package rust-mode
  :ensure t
  :mode (("rs\\'" . rust-mode))
  :init
  (add-to-list 'exec-path "~/.cargo/bin"))

(req-package cargo
  :ensure t
  :commands cargo-minor-mode)
