(require 'req-package)

(when (eq system-type 'gnu/linux)
  (req-package browse-url
    :config (setq browse-url-browser-function
                  (lambda (url &rest args)
                    (call-process-shell-command "xdg-open" nil 0 nil url))))
  (condition-case-unless-debug e
      (set-default-font "SourceCodePro Semi-Bold 11" t)
    (error (message "can not load SourceCodePro font : %s" e)))
  ;; aur interface
  (req-package aurel :commands aurel-package-search)

  (req-package helm-systemd
    :require helm
    :commands helm-systemd))

(provide 'init-linux)
