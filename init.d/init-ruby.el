(require 'req-package)

;; ruby mode for rakefile

(req-package ruby-mode
  :ensure t
  :mode (("Rakefile\\'" . ruby-mode)
		 ("rb\\'" . ruby-mode)))

(req-package rake
  :ensure t :commands rake)

(provide 'init-ruby)
