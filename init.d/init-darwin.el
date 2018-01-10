(require 'req-package)

(if (eq system-type 'darwin)
    (progn (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
		   (setenv "LANG" "en_US.UTF-8")
		   (setenv "LC_ALL" "en_US.UTF-8")
		   (setenv "LC_ALL" "en_US.UTF-8")
		   (setenv "ANDROID_SDK" "/usr/local/opt/android-sdk")
		   (setenv "ANDROID_HOME" "/usr/local/opt/android-sdk")
		   (setenv "ANDROID_NDK" "/usr/local/opt/android-ndk")
           (add-to-list 'exec-path "/usr/local/bin")
           (req-package exec-path-from-shell
             :ensure t
             :require dash
             :init (let* ((variables (shell-command-to-string "cat ~/.bash_profile | grep -e '^export' | sed -e 's/^export \\([A-Za-z0-9_]*\\)=.*$/\\1/g'"))
                          (variables (split-string variables "\n"))
                          (variables (-drop-last 1 variables)))
                     (setq exec-path-from-shell-variables variables))
             :config (exec-path-from-shell-initialize))

           ;; (set-default-font "Hack-12" t)
           ;; (set-default-font "Liberation Mono-12" t)
           ;; (set-default-font "Oxygen Mono-12" t)
           ;; (set-default-font "Anonymous-12" t)
           (condition-case-unless-debug e
               (set-default-font "Source Code Pro Semibold 12" t)
             (error (message "can not load SourceCodePro font : %s" e)))))

(provide 'init-darwin)
