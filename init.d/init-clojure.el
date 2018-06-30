(require 'req-package)

(defun clojure-write-tags ()
  (when (or (eq 'clojure-mode major-mode)
            (eq 'clojurescript-mode major-mode)
            (eq 'clojurec-mode major-mode))
    (when-let ((project-dir (clojure-project-dir)))
      (let ((default-directory project-dir))
        (shell-command "find src/ test/ -type f | xargs etags --regex='/[ \\t\\(]*def[a-z\\-]* \\([a-z-!]+\\)/\\1/' --regex='/[ \\t\\(]*ns \\([a-z.]+\\)/\\1/'")))))

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

(req-package cider
  :ensure t
  :require (clojure-mode eldoc)
  :commands cider-mode cider-jack-in-clojurescript clojure-tags-navigate
  :init
  (add-hook-exec 'clojure-mode #'cider-mode)
  (add-hook-exec 'cider-mode #'eldoc-mode)
  (setq cider-auto-jump-to-error 'errors-only)
  :config
  (setq nrepl-log-messages t)
  (setq nrepl-sync-request-timeout 60)
  (define-key cider-mode-map (kbd "C-c M-J") 'cider-jack-in-clojurescript)
  (define-key cider-mode-map (kbd "C-x c e") 'clojure-tags-navigate))

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

(req-package clojure-snippets
  :ensure t
  :require (clojure-mode yasnippet)
  :config (clojure-snippets-initialize))

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

(defun clojure-sort-map ()
  (interactive)
  (let* ((s (thread-last (buffer-substring (mark) (point))
              (format "
(->> '%s
     (clojure.walk/postwalk (fn [node]
                                (cond
                                 (map? node) (into (sorted-map) node)
                                 :default node))))
"))))
    (cider--pprint-eval-form s)))

(provide 'init-clojure)
