(require 'req-package)

(req-package git-timemachine
  :ensure t
  :bind (("C-x v t" . git-timemachine)))

(req-package magit
  :ensure t
  :commands (magit-status)
  :init
  (setq magit-last-seen-setup-instructions "1.4.0"))

(req-package magit-gitflow
  :ensure t
  :require magit
  :commands turn-on-magit-gitflow
  :init (add-hook-exec 'magit-mode 'turn-on-magit-gitflow))

;; (req-package gitconfig-mode
;;   :ensure t)

;; (req-package gitignore-mode
;;   :ensure t)

(req-package git-messenger
  :ensure t
  :bind ("C-x v p" . git-messenger:popup-message))

;; (req-package gitattributes-mode
;;   :ensure t)

(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)
(setq-default ediff-ignore-similar-regions t)
(setq-default ediff-highlight-all-diffs nil)

(provide 'init-vc)
