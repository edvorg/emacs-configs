(req-package org
  :config
  (progn (global-set-key "\C-cl" 'org-store-link)
         (global-set-key "\C-cc" 'org-capture)
         (global-set-key "\C-ca" 'org-agenda)
         (global-set-key "\C-cb" 'org-iswitchb)))

(req-package org-gcal
  :require org)

(provide 'init-org)
