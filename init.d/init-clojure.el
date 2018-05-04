(require 'req-package)

(req-package clojure-cheatsheet
  :ensure t
  :require (helm clojure-mode cider)
  :commands clojure-cheatsheet
  :init (progn (define-key clojure-mode-map (kbd "C-h j") 'clojure-cheatsheet)
               (define-key cider-repl-mode-map (kbd "C-h j") 'clojure-cheatsheet)))

(defun clojure-write-tags ()
  (when (or (eq 'clojure-mode major-mode)
            (eq 'clojurescript-mode major-mode)
            (eq 'clojurec-mode major-mode))
    (when-let ((project-dir (clojure-project-dir)))
      (let ((default-directory project-dir))
        (shell-command "find src/ -type f | xargs etags --regex='/[ \\t\\(]*def[a-z\\-]* \\([a-z-!]+\\)/\\1/' --regex='/[ \\t\\(]*ns \\([a-z.]+\\)/\\1/'")))))

(defun clojure-tags-navigate ()
  (interactive)
  (require 'helm-tags)
  (when (not (helm-etags-get-tag-file))
    (clojure-write-tags))
  (helm-etags-select '(4)))

(req-package clojure-mode
  :ensure t
  :mode (("clj\\'" . clojure-mode)
         ("cljs\\'" . clojurescript-mode)
         ("cljc\\'" . clojurec-mode)
         (".lein-env\\'" . clojure-mode))
  :config
  (add-hook 'after-save-hook 'clojure-write-tags)
  (setq tags-revert-without-query t)
  (setq tags-add-tables nil)
  (setq clojure-indent-style :align-arguments)
  (put-clojure-indent 'ch/modify-column 1)
  (put-clojure-indent 's/fdef 1)
  (put-clojure-indent 'ch/add-columns 1)
  (put-clojure-indent 'ch/add-foreign-key-constraint 1)
  (put-clojure-indent 'ch/create-index 1)
  (put-clojure-indent 'ch/create-table 1)
  (put-clojure-indent 'ch/insert-data 1)
  (put-clojure-indent 'ch/update-data 1)
  (put-clojure-indent 'ch/add-unique-constraint 1)
  (put-clojure-indent 'ch/add-foreign-key-constraint 1)
  (define-key clojure-mode-map (kbd "<f5>")
    (lambda (&rest args)
      (interactive)
      (let* ((project-dir (projectile-project-root))
             (file-path (buffer-file-name))
             (file-local-path (s-replace project-dir "" file-path)))
        (if (not (s-starts-with? "src/" file-local-path))
            (message "Couldn't find test file")
          (let* ((file-path (thread-last (s-replace "src/" "test/" file-local-path)
                              (s-replace ".clj" "_test.clj")
                              (s-concat project-dir))))
            (find-file file-path)))))))

(req-package clojure-mode-extra-font-locking
  :ensure t
  :require clojure-mode)

(req-package cider
  :ensure t
  :require (clojure-mode eldoc)
  :commands cider-mode cider-jack-in-clojurescript
  :init
  (add-hook-exec 'clojure-mode #'cider-mode)
  (add-hook-exec 'cider-mode #'eldoc-mode)
  (setq cider-auto-jump-to-error 'errors-only)
  :config
  (setq nrepl-log-messages t)
  (setq nrepl-sync-request-timeout 60)
  (define-key cider-mode-map (kbd "C-c M-J") 'cider-jack-in-clojurescript)
  (define-key cider-mode-map (kbd "C-x c e") 'clojure-tags-navigate))

(req-package helm-cider
  :ensure t
  :require cider helm
  :config (helm-cider-mode t))

(req-package slamhound
  :ensure t
  :require cider
  :commands slamhound)

(req-package clj-refactor
  :ensure t
  :require cider
  :commands clj-refactor-mode
  :init
  (add-hook-exec 'cider-mode #'clj-refactor-mode)
  (setq cljr-warn-on-eval nil)
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(req-package cljr-helm
  :ensure t
  :require clj-refactor
  :commands cljr-helm
  :init (define-key clojure-mode-map (kbd "M-RET") 'cljr-helm))

(req-package 4clojure
  :ensure t
  :commands (4clojure-check-answers 4clojure-open-question))

(req-package typed-clojure-mode
  :ensure t
  :require clojure-mode
  :commands typed-clojure-mode
  :init (add-hook-exec 'clojure-mode 'typed-clojure-mode))

(req-package flycheck-clojure
  :ensure t
  :disabled t
  :require (clojure-mode flycheck)
  :config
  (add-hook-exec 'clojure-mode
    (lambda ()
      ;; currently not working with cljs
      (add-to-list 'flycheck-disabled-checkers 'clojure-cider-typed)
      (add-to-list 'flycheck-disabled-checkers 'clojure-cider-kibit)
      (add-to-list 'flycheck-disabled-checkers 'clojure-cider-eastwood)))
  (flycheck-clojure-setup))

(req-package clojure-snippets
  :ensure t
  :require (clojure-mode yasnippet)
  :config (clojure-snippets-initialize))

(req-package align-cljlet
  :ensure t
  :require clojure-mode
  :config
  (define-key clojure-mode-map (kbd "C-M-<tab>") 'align-cljlet))

(req-package cljsbuild-mode
  :ensure t
  :commands cljsbuild-start)

(req-package kibit-helper
  :ensure t
  :commands kibit kibit-current-file
  :bind (("C-x C-`" . kibit-accept-proposed-change)))

(req-package sotclojure
  :ensure t :disabled t)

(defun reverse-destructure-form ()
  (interactive)
  (let* ((s (thread-last (buffer-substring (mark) (point))
                         (format "
(let [f (fn f [form]
     (cond
       (map? form)  (->> form
                         seq
                         (reduce (fn [m [destructure-value destructure-key]]
                                   (cond
                                     (= :or destructure-value)   m
                                     (= :keys destructure-value) (->> destructure-key
                                                                      (map (fn [k]
                                                                             [(keyword k) k]))
                                                                      (into m))
                                     :default                    (assoc m destructure-key (-> destructure-value
                                                                                              f))))
                                 {}))
       (coll? form) (mapv f form)
       :default     form))]
   (f '%s))
"))))
                         (cider--pprint-eval-form s)))

(provide 'init-clojure)
