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
  (add-hook-exec 'dired-mode (lambda ()
                               (diff-hl-dired-mode 1)
                               (setq dired-dwim-target t))))

;; dired rainbow

(req-package dired-rainbow
  :ensure t
  :require dired)

;; dired open

(req-package dired-open
  :ensure t
  :require dired)

(req-package dired-launch
  :ensure t
  :require dired
  :init (dired-launch-enable))

(req-package dired-details
  :ensure t
  :init (setq-default dired-details-hidden-string "- ")
  :config (dired-details-install))

(provide 'init-dired)
