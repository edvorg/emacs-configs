(require 'req-package)

(req-package rust-mode
  :mode (("rs\\'" . rust-mode))
  :init
  (add-to-list 'exec-path "~/.cargo/bin")
  :config
  (add-hook-exec 'rust-mode #'racer-mode)
  (setq rust-format-on-save t))

(req-package racer
  :commands (racer-mode)
  :config
  (add-hook-exec 'racer-mode #'eldoc-mode)
  (add-hook-exec 'racer-mode #'company-mode))
