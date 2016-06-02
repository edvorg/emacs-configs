(require 'req-package)

(req-package bash-completion
  :require shell
  :commands bash-completion-dynamic-complete
  :init
  (setq explicit-shell-file-name "bash")
  (setq comint-process-echoes t)
  (add-hook-exec 'shell-mode 'shell-dynamic-complete-functions
    'bash-completion-dynamic-complete)
  (add-hook-exec 'shell-mode 'shell-command-complete-functions
    'bash-completion-dynamic-complete))

(req-package shell-pop
  :bind ("M-\"" . shell-pop))

(provide 'init-bash)
