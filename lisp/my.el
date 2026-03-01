;; предварительный просмотр org->html рядом | M-x org-preview-html-mode | M-x org-preview-html-refresh
(require 'org-preview-html)
;;Горячая клавиша только в Org-mode - C-c C-p h
(with-eval-after-load 'org
  (define-key org-mode-map
	(kbd "C-c C-p h")
    #'org-preview-html-mode))

;;M-x org-export-to-markdown RET | → создаст файл .md в той же директории.
(defun org-export-to-markdown ()
  "Экспортирует текущий Org-файл в Markdown."
  (interactive)
  (require 'ox-md)
  (org-md-export-to-markdown))
