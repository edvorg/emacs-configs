;; clang format

(req-package clang-format)

;; completion with clang

(defconst cc-style
  '("bsd"
    (c-offsets-alist . ((innamespace . [0])))))

(req-package cc-mode
  :require key-chord
  :mode ("\\.cpp\\'" . c++-mode)
  :config (progn (key-chord-define c++-mode-map ";;"  "\C-e;")
				 (key-chord-define c++-mode-map "//"  "\C-e //")
				 (key-chord-define c++-mode-map "{}"  "{\n\n}\C-p\t")
				 (key-chord-define c++-mode-map "(}"  "() {\n\n}\C-p\t")))

(req-package auto-complete-clang
  :require
  (auto-complete cc-mode async)
  :config
  (progn (add-hook 'c++-mode-hook 'cc-mode-clang-hook)
         (add-hook 'c-mode-hook 'cc-mode-clang-hook)
         (c-add-style "cc-style" cc-style)
         (setq-default c-basic-offset 4)
         (setq-default c-default-style "cc-style")))

;; headers completion

(req-package auto-complete-c-headers
  :require
  auto-complete-clang)

;; detect mode for .h file

(req-package dummy-h-mode
  :require
  cc-mode
  :config
  (progn (add-to-list 'auto-mode-alist '("\\.h$" . dummy-h-mode))
         (add-hook 'dummy-h-mode-hook
                   (lambda ()
                     (setq dummy-h-mode-default-major-mode 'c++-mode)))
         (add-hook 'dummy-h-mode-hook
                   (lambda ()
                     (setq dummy-h-mode-search-limit 60000)))))

;; gdb

(req-package gdb-mi
  :require
  cc-mode
  :config
  (progn (setq gdb-many-windows t)
         (setq gdb-show-main t)))

;; rtags

(req-package rtags :require cc-mode)

;; some utils

(defun find-makefile-dir (cur)
  (if (file-exists-p (concat cur "Makefile"))
      cur
    (if (string-equal (expand-file-name cur) "/")
        nil
      (find-makefile-dir (expand-file-name (concat cur "../"))))))

(defun expand-include-flag (a)
  (if (string-prefix-p "-I" a)
      (concat "-I" (expand-file-name (concat (find-makefile-dir "./") (substring a 2))))
    a))

(defun cc-mode-clang-hook ()
  (add-to-list 'ac-sources 'ac-source-clang)
  (add-to-list 'ac-sources 'ac-source-c-headers)

  (setq ac-clang-flags nil)
  
  (async-start
   (lambda () (split-string (shell-command-to-string
                        "bash ~/.emacs.d/clang-include-paths.scala")))  
   (lambda (result)
     (setq ac-clang-flags
           (append ac-clang-flags
                   (mapcar (lambda (item) (concat "-I" item)) result)))
     (setq cc-search-directories result)))

  (setq ac-clang-flags
        (append ac-clang-flags
                (mapcar 'expand-include-flag
                        (split-string
                         (shell-command-to-string
                          (concat (concat "make -C " (find-makefile-dir "./"))
                                  " -s print-cflags")))))))

(provide 'init-cc)
