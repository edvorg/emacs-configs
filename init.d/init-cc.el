(require 'req-package)

;; clang format

(req-package clang-format
  :commands clang-format-region)

;; completion with clang

(defconst cc-style
  '("bsd"
    (c-offsets-alist . ((innamespace . [0])))))

(req-package cc-mode
  :mode (("\\.cpp\\'" . c++-mode)
         ("\\.hpp\\'" . c++-mode)
         ("\\.h\\'" . c++-mode))
  :config
  (c-add-style "cc-style" cc-style)
  (setq-default c-basic-offset 4)
  (setq-default c-default-style "cc-style"))

;; detect mode for .h file

(req-package dummy-h-mode
  :commands dummy-h-mode
  :init (add-to-list 'auto-mode-alist '("\\.h$" . dummy-h-mode))
  :config (progn
            (add-hook-exec 'dummy-h-mode
              (lambda ()
                (setq dummy-h-mode-default-major-mode 'c++-mode)))
            (add-hook-exec 'dummy-h-mode
              (lambda ()
                (setq dummy-h-mode-search-limit 60000)))))

;; gdb

(req-package gdb-mi
  :loader :built-in
  :require cc-mode
  :config
  (setq gdb-many-windows t)
  (setq gdb-show-main t))

;; irony

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

(req-package irony
  :require cc-mode
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'my-irony-mode-hook))

(req-package company-irony
  :require irony company
  :init (add-to-list 'company-backends 'company-irony))

(provide 'init-cc)
