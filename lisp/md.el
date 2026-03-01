;;Через встроенный пакетный менеджер:
;;M-x package-install RET markdown-mode RET

(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))

