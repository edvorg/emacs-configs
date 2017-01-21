(require 'req-package)

(req-package slime
  :config (let* ((sbcl (shell-command-to-string "which sbcl | xargs echo -n")))
            (setq inferior-lisp-program sbcl)))

(provide 'init-slime)
