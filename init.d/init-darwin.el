(if (eq system-type 'darwin)
	(progn   (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))

			 (req-package exec-path-from-shell
               :config
               (exec-path-from-shell-initialize))))

(provide 'init-darwin)
