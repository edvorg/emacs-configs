(require 'req-package)

;; single dired

(req-package dired
  :commands dired
  :require (key-chord autorevert diff-hl)
  :config (progn (define-key dired-mode-map (kbd "M-i") 'helm-swoop)
				 (define-key dired-mode-map (kbd "M-RET") 'dired-find-file-other-window)
				 (key-chord-define dired-mode-map "qq" 'dired-up-directory)
				 (add-hook-exec 'dired-mode (lambda () (auto-revert-mode 1)))
				 (add-hook-exec 'dired-mode (lambda () (diff-hl-dired-mode 1)))))

;; sunrise commander

(req-package sunrise-commander :commands sunrise-cd)

(req-package sunrise-x-loop :require sunrise-commander)

;; dired rainbow

(req-package dired-rainbow :require dired)

;; dired open

(req-package dired-open :require dired)

(provide 'init-dired)
