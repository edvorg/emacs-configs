(require 'req-package)

;; single dired

(req-package dired
  :commands dired
  :require autorevert diff-hl
  :chords (:map dired-mode-map
                ("qq" . dired-up-directory))
  :bind (:map dired-mode-map
              ("M-i" . helm-swoop)
              ("M-RET" . dired-find-file-other-window))
  :config
  (add-hook-exec 'dired-mode (lambda () (auto-revert-mode 1)))
  (add-hook-exec 'dired-mode (lambda () (diff-hl-dired-mode 1))))

;; sunrise commander

(req-package sunrise-commander :commands sunrise-cd)

(req-package sunrise-x-loop :require sunrise-commander)

;; dired rainbow

(req-package dired-rainbow :require dired)

;; dired open

(req-package dired-open :require dired)

(provide 'init-dired)
