(require 'req-package)

;; clang format

(req-package clang-format
  :commands clang-format-region)

;; completion with clang

(defconst cc-style
  '("bsd"
    (c-offsets-alist . ((innamespace . [0])))))

(req-package cc-mode
  :require key-chord
  :mode (("\\.cpp\\'" . c++-mode)
         ("\\.hpp\\'" . c++-mode)
         ("\\.h\\'" . c++-mode))
  :config (progn (c-add-style "cc-style" cc-style)
                 (setq-default c-basic-offset 4)
                 (setq-default c-default-style "cc-style")))

;; detect mode for .h file

(req-package dummy-h-mode
  :commands dummy-h-mode
  :init (add-to-list 'auto-mode-alist '("\\.h$" . dummy-h-mode))
  :config (progn
            (req-package-hooks-add-execute 'dummy-h-mode
              (lambda ()
                (setq dummy-h-mode-default-major-mode 'c++-mode)))
            (req-package-hooks-add-execute 'dummy-h-mode
              (lambda ()
                (setq dummy-h-mode-search-limit 60000)))))

;; gdb

(req-package gdb-mi
  :require
  cc-mode
  :config
  (progn (setq gdb-many-windows t)
         (setq gdb-show-main t)))

(provide 'init-cc)
