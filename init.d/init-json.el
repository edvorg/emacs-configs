(require 'req-package)

(req-package json-reformat
  :ensure t
  :commands json-reformat-region
  :init (progn (setq json-reformat:indent-width 4)
			   (setq json-reformat:pretty-string? t)))

(req-package json-mode
  :ensure t
  :mode ("\\.json$" . json-mode)
  :init (add-hook-exec 'json-mode
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 4))))

(provide 'init-json)
