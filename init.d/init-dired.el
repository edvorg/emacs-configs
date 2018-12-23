(require 'req-package)

;; single dired

(req-package dired
  :commands dired
  :require autorevert diff-hl
  :bind (:map dired-mode-map
              ("M-i" . helm-swoop)
              ("M-RET" . dired-find-file-other-window))
  :init
  (setq dired-recursive-deletes 'always)
  :config
  (add-hook-exec 'dired-mode (lambda ()
                               (diff-hl-dired-mode 1)
                               (setq dired-dwim-target t))))

(provide 'init-dired)
