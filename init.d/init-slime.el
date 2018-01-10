(require 'req-package)

(req-package slime
  :ensure t
  :config (let* ((sbcl (shell-command-to-string "which sbcl | xargs echo -n")))
            (setq inferior-lisp-program sbcl))
  :commands slime)

(provide 'init-slime)
