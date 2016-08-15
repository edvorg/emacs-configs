(require 'req-package)

;; ruby mode for rakefile

(req-package ruby-mode
  :loader :built-in
  :mode (("Rakefile\\'" . ruby-mode)
		 ("rb\\'" . ruby-mode)))

(req-package rake :commands rake)

(provide 'init-ruby)
