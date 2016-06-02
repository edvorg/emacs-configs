(require 'req-package)

;; helm

(req-package helm
  :chords ((";l" . helm-bookmarks))
  :bind (("C-x C-b" . helm-buffers-list)
         ("C-c y" . helm-show-kill-ring)
         ("C-x C-r" . helm-recentf)
         ("C-x r l" . helm-bookmarks))
  :config (require 'helm-config))

;; ace jump to helm item

(req-package ace-jump-helm-line
  :commands ace-jump-helm-line
  :require helm
  :init (define-key helm-map (kbd "C-;") 'ace-jump-helm-line))

;; helm google

(req-package helm-google :commands helm-google)

;; helm proc

(req-package helm-proc
  :commands helm-proc
  :require helm)

;; helm .gitignore

(req-package helm-gitignore :commands helm-gitignore)

;; helm company

(req-package helm-company
  :require company
  :commands helm-company
  :config (progn (define-key company-mode-map (kbd "C-:") 'helm-company)
                 (define-key company-active-map (kbd "C-:") 'helm-company)))

;; helm helm commands

(req-package helm-helm-commands
  :commands helm-helm-commands
  :require helm)

;; helm swoop

(req-package helm-swoop
  :commands helm-swoop-from-isearch
  :require helm
  :init (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch))

;; helm desc binds

(req-package helm-descbinds
  :commands helm-descbinds
  :require helm)

;; helm open github

(req-package helm-open-github
  :require helm
  :bind (("C-c o f" . helm-open-github-from-file)
         ("C-c o c" . helm-open-github-from-commit)
         ("C-c o i" . helm-open-github-from-issues)
         ("C-c o p" . helm-open-github-from-pull-requests)))

;; helm package

(req-package helm-package
  :commands helm-package
  :require helm)

;; helm make

(req-package helm-make
  :commands helm-make
  :require makefile-runner)

;; helm wgrep

(req-package wgrep-helm
  :require (helm wgrep grep))

;; helm github stars

(req-package helm-github-stars
  :commands helm-github-stars
  :require helm
  :config (setq helm-github-stars-username (getenv "USER")))

;; helm themes

(req-package helm-themes
  :commands helm-themes
  :require helm)

;; org rifle

(req-package helm-org-rifle)

(provide 'init-helm)
