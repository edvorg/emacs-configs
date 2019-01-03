(require 'req-package)

(defun setup-linux-font (frame)
  (condition-case-unless-debug e
      (progn
        (add-to-list 'default-frame-alist '(font . "SauceCodePro Nerd Font Mono Semi-Bold 9"))
        (set-default-font "SauceCodePro Nerd Font Mono Semi-Bold 9" t))
    (error (message "can not load SourceCodePro font : %s" e))))

(when (eq system-type 'gnu/linux)
  (req-package browse-url
    :ensure t
    :config (setq browse-url-browser-function
                  (lambda (url &rest args)
                    (call-process-shell-command "xdg-open" nil 0 nil url))))
  (setup-linux-font nil)
  (add-to-list 'after-make-frame-functions 'setup-linux-font))

(provide 'init-linux)
