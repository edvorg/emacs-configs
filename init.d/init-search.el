(require 'req-package)

;; use igrep

(req-package igrep :commands igrep)

;; use wgrep

(req-package wgrep :commands wgrep)

;; in-project search

(defun find-upper-vcs-root (from acc)
  (let* ((UPPER (expand-file-name (concat from "/..")))
		 (NEWACC (cond ((file-exists-p (concat from "/.svn")) from)
					   ((file-exists-p (concat from "/.git")) from)
					   (t acc))))
	(if (equal from "/")
		NEWACC
	  (find-upper-vcs-root UPPER NEWACC))))

(req-package projectile
  :bind (("C-x f" . projectile-find-file)
         ("C-x d" . projectile-find-dir))
  :chords  (("xf" . projectile-find-file)
            ("xd" . projectile-find-dir))
  :config (projectile-global-mode))

;; visual regexp

(req-package visual-regexp
  :require multiple-cursors visual-regexp-steroids
  :bind (("C-c r" . vr/replace)
         ("C-c q" . vr/query-replace)
         ("C-c m" . vr/mc-mark)
         ;; :map esc-map
         ("C-M-r" . vr/isearch-backward)
         ("C-M-s" . vr/isearch-forward)))

;; ignored folders

(req-package grep
  :defer 1
  :config (progn
            (add-to-list 'grep-find-ignored-directories "auto")
            (add-to-list 'grep-find-ignored-directories "elpa")
            (add-to-list 'grep-find-ignored-directories ".git")
            (add-to-list 'grep-find-ignored-directories ".svn")
            (add-hook-exec 'grep-mode (lambda () (toggle-truncate-lines 1)))))

(provide 'init-search)
