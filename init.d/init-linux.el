(require 'req-package)

(defun setup-linux-font (frame)
  (condition-case-unless-debug e
      (progn
        (add-to-list 'default-frame-alist '(font . "Source Code Pro Semibold 9"))
        (set-default-font "Source Code Pro Semibold 9" t))
    (error (message "can not load SourceCodePro font : %s" e))))

(when (eq system-type 'gnu/linux)
  (req-package browse-url
    :ensure t
    :config (setq browse-url-browser-function
                  (lambda (url &rest args)
                    (call-process-shell-command "xdg-open" nil 0 nil url))))
  (req-package aurel
    :ensure t :commands aurel-package-search)
  (setup-linux-font nil)
  (add-to-list 'after-make-frame-functions 'setup-linux-font))

(provide 'init-linux)
