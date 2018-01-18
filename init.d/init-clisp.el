(require 'req-package)

(req-package slime
  :config
  (setq inferior-lisp-program (shell-command-to-string "which sbcl | xargs echo -n"))
  (setq slime-contribs '(slime-fancy)))

(req-package slime-company
  :ensure t
  :require slime
  :config
  (slime-setup '(slime-fancy slime-company))
  (add-hook 'slime-connected-hook #'slime-company-maybe-enable))

(provide 'init-clisp)
