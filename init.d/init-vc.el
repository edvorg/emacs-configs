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
  :ensure t
  :commands svn-status
  :chords ((";s" . upper-svn-status)))

(req-package git-timemachine
  :ensure t
  :bind (("C-x v t" . git-timemachine)))

(req-package magit
  :ensure t
  :chords ((";m" . magit-status))
  :init
  (setq magit-last-seen-setup-instructions "1.4.0"))

(req-package magit-gitflow
  :ensure t
  :require magit
  :commands turn-on-magit-gitflow
  :init (add-hook-exec 'magit-mode 'turn-on-magit-gitflow))

(req-package magit-svn
  :ensure t :require magit)

(req-package helm-ls-git
  :ensure t
  :require helm
  :bind ("M-+" . helm-ls-git-ls))

(req-package gitconfig-mode
  :ensure t)

(req-package gitignore-mode
  :ensure t)

(req-package git-messenger
  :ensure t
  :bind ("C-x v p" . git-messenger:popup-message))

(req-package gitattributes-mode
  :ensure t)

(req-package ztree
  :ensure t
  :bind ("<f9>" . ztree-diff))

(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)
(setq-default ediff-ignore-similar-regions t)
(setq-default ediff-highlight-all-diffs nil)

(provide 'init-vc)
