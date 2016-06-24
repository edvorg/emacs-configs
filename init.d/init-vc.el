(require 'req-package)

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
  :commands svn-status
  :chords ((";s" . upper-svn-status)))

(req-package git-timemachine
  :bind (("C-x v t" . git-timemachine)))

(req-package magit
  :chords ((";m" . magit-status))
  :init
  (setq magit-last-seen-setup-instructions "1.4.0")
  (setq magit-auto-revert-mode t)())

(req-package magit-gitflow
  :require magit
  :commands turn-on-magit-gitflow
  :init (add-hook-exec 'magit-mode 'turn-on-magit-gitflow))

(req-package magit-gh-pulls
  :require magit
  :config (add-hook-exec 'magit-mode 'turn-on-magit-gh-pulls))

(req-package magit-svn :require magit)

(req-package helm-ls-git
  :require helm
  :bind ("M-+" . helm-ls-git-ls))

(req-package gitconfig-mode)

(req-package gitignore-mode)

(req-package git-messenger
  :bind ("C-x v p" . git-messenger:popup-message))

(req-package git-blame)

(req-package gitattributes-mode)

(req-package ztree
  :bind ("<f9>" . ztree-diff))

(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)
(setq-default ediff-ignore-similar-regions t)
(setq-default ediff-highlight-all-diffs nil)

(provide 'init-vc)
