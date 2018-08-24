(require 'req-package)

(req-package org
  :ensure t
  :mode ("\\.org$" . org-mode)
  :bind (("C-c l" . org-store-link)
         ("C-c c" . org-capture)
         ("C-c a" . org-agenda)
         ("C-'" . org-cycle-agenda-files)
         ("C-c b" . org-iswitchb))
  :config (progn (setq org-default-notes-file (concat org-directory "/notes.org"))
                 (setq org-tags-column -110)
                 (setq org-capture-bookmark t)
                 (setq org-refile-use-outline-path 'file)
                 (setq org-startup-folded 'showeverything)
                 (setq org-log-done 'note)
                 (define-key org-mode-map (kbd "C-M-\\") 'org-indent-region)))

(req-package org-pomodoro
  :ensure t
  :commands org-pomodoro
  :config
  (add-hook
   'org-pomodoro-finished-hook
   (lambda ()
     (shell-command "xdg-open 'https://duckduckgo.com/?q=cats&iax=images&ia=images'")
     (shell-command "play ~/.emacs.d/pomodoro-stop.mp3")))
  (add-hook
   'org-pomodoro-break-finished-hook
   (lambda ()
     (async-shell-command "emacsclient -n ~/Work")
     (shell-command "play ~/.emacs.d/pomodoro-start.mp3")))
  :bind (("C-c p" . org-pomodoro)))

(provide 'init-org)
