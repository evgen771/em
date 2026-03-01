;;LaTeX
(setenv "PATH" (concat "/usr/local/texlive/2025/bin/amd64-freebsd:" (getenv "PATH")))
(setq exec-path (cons "/usr/local/texlive/2025/bin/amd64-freebsd" exec-path))
(require 'org)
(require 'ox-latex)

;; Добавляем пакеты в преамбулу LaTeX при экспорте
(setq org-latex-packages-alist
      '(("" "inputenc" t)
        ("T2A" "fontenc" t)
        ("english,russian" "babel" t)))

;; Указываем кодировку по умолчанию
(setq org-latex-input-encodings '("utf8"))

;; Опционально: задать класс документа (например, article)
(setq org-latex-default-class "article")
