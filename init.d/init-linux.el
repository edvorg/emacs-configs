(require 'req-package)

(when (eq system-type 'gnu/linux)
  (req-package browse-url
    :config (setq browse-url-browser-function
                  (lambda (url &rest args)
                    (call-process-shell-command "xdg-open" nil 0 nil url))))
  ;; FIXME install this fonts somehow first
  (set-default-font "SourceCodePro-9" t)
  ;; aur interface
  (req-package aurel :commands aurel-package-search))

(provide 'init-linux)
