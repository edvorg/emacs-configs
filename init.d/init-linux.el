(require 'req-package)

(defun setup-linux-font (frame)
  (condition-case-unless-debug e
      (progn
        (add-to-list 'default-frame-alist '(font . "Source Code Pro Semibold 11"))
        (set-default-font "Source Code Pro Semibold 11" t))
    (error (message "can not load SourceCodePro font : %s" e))))

(when (eq system-type 'gnu/linux)
  (req-package browse-url
    :config (setq browse-url-browser-function
                  (lambda (url &rest args)
                    (call-process-shell-command "xdg-open" nil 0 nil url))))
  (req-package aurel :commands aurel-package-search)
  (req-package helm-systemd
    :require helm
    :commands helm-systemd)
  (setup-linux-font nil)
  (add-to-list 'after-make-frame-functions 'setup-linux-font))

(provide 'init-linux)
