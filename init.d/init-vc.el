(require 'req-package)

;; svn integration

;; in-project search

(defun find-upper-svn-root (from acc)
  (let* ((UPPER (expand-file-name (concat from "/..")))
		 (NEWACC (cond ((file-exists-p (concat from "/.svn")) from)
					   (t acc))))
	(if (equal from "/")
		NEWACC
	  (find-upper-svn-root UPPER NEWACC))))

(defun upper-svn-status ()
  (interactive)
  (svn-status (find-upper-svn-root default-directory default-directory)))

(req-package psvn
  :require key-chord
  :commands svn-status
  :init (key-chord-define-global ";s" 'upper-svn-status))

;; use timemachine

(req-package git-timemachine)

;; magit

(req-package magit
  :require key-chord
  :commands magit-status
  :init (progn (key-chord-define-global ";m" 'magit-status)
               (setq magit-last-seen-setup-instructions "1.4.0")
               (setq magit-auto-revert-mode t))
  :config (progn (key-chord-define magit-log-mode-map ";j" "n")
                 (key-chord-define magit-log-mode-map ";k" "p")))

;; git flow

(req-package magit-gitflow
  :require magit
  :commands turn-on-magit-gitflow
  :init (add-hook-exec 'magit-mode 'turn-on-magit-gitflow))

;; magit svn

(req-package magit-svn :require magit)

;; helm ls git

(req-package helm-ls-git
  :require helm
  :bind ("M-+" . helm-ls-git-ls))

;; git config mode

(req-package gitconfig-mode)

;; git ignore mode

(req-package gitignore-mode)

;; git message

(req-package git-messenger
  :bind ("C-x v p" . git-messenger:popup-message))

;; git blame

(req-package git-blame)

;; git attributes editing

(req-package gitattributes-mode)

;; tweak ediff

(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)
(setq-default ediff-ignore-similar-regions t)
(setq-default ediff-highlight-all-diffs nil)

(provide 'init-vc)
