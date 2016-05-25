(require 'req-package)

(req-package emr
  :commands
  emr-show-refactor-menu
  :init
  (progn (define-key emacs-lisp-mode-map (kbd "M-RET") 'emr-show-refactor-menu)
         (define-key lisp-interaction-mode-map (kbd "M-RET") 'emr-show-refactor-menu))
  :config
  (emr-initialize))

(req-package litable
  :commands litable-mode)

(req-package eldoc
  :commands eldoc-mode
  :init (progn (req-package-hooks-add-execute 'emacs-lisp-mode (lambda () (eldoc-mode 1)))
			   (req-package-hooks-add-execute 'lisp-interaction-mode (lambda () (eldoc-mode 1)))))

(req-package lisp-mode
  :require flycheck
  :commands lisp-mode
  :bind (("C-c C-k" . eval-buffer))
  :config (req-package-hooks-add-execute 'emacs-lisp-mode
            (lambda () (setq flycheck-disabled-checkers '(emacs-lisp-checkdoc)))))

(req-package elisp-slime-nav
  :commands elisp-slime-nav-mode
  :init (progn (req-package-hooks-add-execute 'emacs-lisp-mode 'elisp-slime-nav-mode)
               (req-package-hooks-add-execute 'lisp-interaction-mode 'elisp-slime-nav-mode)))

(req-package nameless
  :commands nameless-mode-from-hook
  :init (req-package-hooks-add-execute 'emacs-lisp-mode 'nameless-mode-from-hook))

(req-package ert-modeline
  :commands ert-modeline-mode
  :init (req-package-hooks-add-execute 'emacs-lisp-mode 'ert-modeline-mode))

(req-package overseer
  :require f
  :commands overseer-mode
  :init (req-package-hooks-add-execute 'emacs-lisp-mode 'overseer-mode))

(req-package el-mock
  :require lisp-mode)

(req-package ert-expectations
  :require lisp-mode)

(req-package undercover
  :require lisp-mode)

(provide 'init-elisp)
