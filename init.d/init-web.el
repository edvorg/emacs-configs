(require 'req-package)

;; http repl

(req-package httprepl
  :ensure t
  :require (s dash)
  :commands httprepl)

;; restclient

(req-package restclient
  :ensure t
  :mode ("\\.rest\\'" . restclient-mode))

(req-package company-restclient
  :ensure t
  :require (restclient company)
  :config (add-to-list 'company-backends 'company-restclient))

;; elnode

(req-package elnode
  :ensure t
  :commands (elnode-stop elnode-start))

;; pick mode

(req-package peek-mode
  :ensure t
  :commands peek-mode
  :require elnode
  :config (elnode-start 'peek-mode-dispatcher-handler :port 8008 :host "localhost"))

;; xml generation dsl

(req-package xmlgen
  :ensure t
  :commands xmlgen)

;; html templates editing

(req-package sgml-mode
  :mode ("\\.html\\'" . sgml-mode))

(req-package emmet-mode
  :ensure t
  :require (css-mode sgml-mode)
  :commands emmet-mode
  :init (progn (add-hook-exec 'sgml-mode 'emmet-mode)
               (add-hook-exec 'css-mode 'emmet-mode)))

(req-package web-mode
  :ensure t
  :commands web-mode)

(req-package scss-mode
  :ensure t
  :mode ("\\.scss\\'" . scss-mode))

(req-package css-mode
  :config (setq css-indent-offset 2))

(req-package django-mode
  :ensure t
  :mode ("\\.djhtml\\'" . django-html-mode))

(provide 'init-web)
