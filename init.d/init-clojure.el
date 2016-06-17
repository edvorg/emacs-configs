(require 'req-package)

(req-package clojure-cheatsheet
  :require (helm clojure-mode cider)
  :commands clojure-cheatsheet
  :init (progn (define-key clojure-mode-map (kbd "C-h j") 'clojure-cheatsheet)
               (define-key cider-repl-mode-map (kbd "C-h j") 'clojure-cheatsheet)))

(req-package clojure-mode
  :mode (("clj\\'" . clojure-mode)
         ("cljs\\'" . clojurescript-mode)
         (".lein-env\\'" . clojure-mode)))

(req-package clojure-mode-extra-font-locking
  :require clojure-mode)

(req-package cider
  :require (clojure-mode eldoc)
  :commands cider-mode cider-jack-in-clojurescript
  :init
  (add-hook-exec 'clojure-mode #'cider-mode)
  (add-hook-exec 'cider-mode #'eldoc-mode)
  (setq cider-auto-jump-to-error 'errors-only)
  :config
  (setq nrepl-log-messages t)
  (define-key cider-mode-map (kbd "C-c M-J") 'cider-jack-in-clojurescript))

(req-package helm-cider
  :require cider helm
  :config (helm-cider-mode t))

(req-package slamhound
  :require cider
  :commands slamhound)

(req-package cider-profile
  :require cider
  :commands cider-profile-mode
  :init (progn (add-hook-exec 'cider-mode 'cider-profile-mode)
               (add-hook-exec 'cider-repl-mode 'cider-profile-mode)))

(req-package clj-refactor
  :require cider
  :commands clj-refactor-mode
  :init
  (add-hook-exec 'cider-mode #'clj-refactor-mode)
  (setq cljr-warn-on-eval nil))

(req-package cljr-helm
  :require clj-refactor
  :commands cljr-helm
  :init (define-key clojure-mode-map (kbd "M-RET") 'cljr-helm))

(req-package 4clojure
  :commands (4clojure-check-answers 4clojure-open-question))

(req-package typed-clojure-mode
  :require clojure-mode
  :commands typed-clojure-mode
  :init (add-hook-exec 'clojure-mode 'typed-clojure-mode))

(req-package flycheck-clojure
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
  :require (clojure-mode yasnippet)
  :config (clojure-snippets-initialize))

(req-package align-cljlet
  :require clojure-mode
  :config
  (define-key clojure-mode-map (kbd "C-M-<tab>") 'align-cljlet))

(req-package cljsbuild-mode
  :commands cljsbuild-start)

(req-package kibit-helper
  :commands kibit kibit-current-file
  :bind (("C-x C-`" . kibit-accept-proposed-change)))

(req-package sotclojure :disabled t)

(provide 'init-clojure)
