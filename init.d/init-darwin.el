(require 'req-package)

(defun setup-darwin-font (frame)
  (condition-case-unless-debug e
      (progn
        (add-to-list 'default-frame-alist '(font . "Source Code Pro Semibold 9"))
        (set-default-font "Source Code Pro Semibold 9" t))
    (error (message "can not load SourceCodePro font : %s" e))))

(when (eq system-type 'darwin)
  (req-package browse-url
    :ensure t
    :config (setq browse-url-browser-function
                  (lambda (url &rest args)
                    (call-process-shell-command "open" nil 0 nil url))))

  (thread-last (getenv "PATH")
    (concat "/usr/local/bin:")
    (setenv "PATH")))

(provide 'init-darwin)
