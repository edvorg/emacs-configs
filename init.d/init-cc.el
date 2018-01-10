(require 'req-package)

;; clang format

(req-package clang-format
  :ensure t
  :commands clang-format-region)

;; completion with clang

(defconst cc-style
  '("bsd"
    (c-offsets-alist . ((innamespace . [0])))))

(req-package cc-mode
  :ensure t
  :mode (("\\.cpp\\'" . c++-mode)
         ("\\.hpp\\'" . c++-mode)
         ("\\.h\\'" . c++-mode))
  :config
  (c-add-style "cc-style" cc-style)
  (setq-default c-basic-offset 4)
  (setq-default c-default-style "cc-style"))

;; detect mode for .h file

(req-package dummy-h-mode
  :ensure t
  :commands dummy-h-mode
  :init (add-to-list 'auto-mode-alist '("\\.h$" . dummy-h-mode))
  :config (progn
            (add-hook-exec 'dummy-h-mode
              (lambda ()
                (setq dummy-h-mode-default-major-mode 'c++-mode)))
            (add-hook-exec 'dummy-h-mode
              (lambda ()
                (setq dummy-h-mode-search-limit 60000)))))

(provide 'init-cc)
