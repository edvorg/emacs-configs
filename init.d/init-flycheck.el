(require 'req-package)

(req-package flycheck
  :ensure t
  :pin melpa-stable
  :config (progn (global-flycheck-mode 1)
                 (set-face-attribute 'flycheck-warning nil
                                     :inherit 'warning
                                     :underline nil)
                 (set-face-attribute 'flycheck-error nil
                                     :inherit 'error
                                     :underline nil)))

(req-package flycheck-pos-tip
  :ensure t
  :pin melpa-stable
  :commands flycheck-pos-tip-error-messages
  :require flycheck
  :init (setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))

(provide 'init-flycheck)
