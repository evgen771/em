;;config_emacs
(set-language-environment 'utf-8)
(setq slime-net-coding-system 'utf-8-unix)
(setq lisp-lambda-list-keyword-parameter-alignment t)
(setq lisp-lambda-list-keyword-alignment t)
(setq common-lisp-style-default 'wombat)
(cua-mode t) ;;озволяет использовать стандартные сочетания клавиш для копирования (C-c) и вставки (C-v), как в других программах. Чтобы включить режим, нужно:использовать команду-M-x cua-mode RET
(setq x-select-enable-clipboard t) ;;Общий с ОС буфер обмена:
(tooltip-mode -1)
;;(menu-bar-mode -1) ;; отключаем графическое меню
(tool-bar-mode -1) ;; отключаем tool-bar
(scroll-bar-mode -1) ;; отключаем полосу прокрутки
(blink-cursor-mode -1) ;; курсор не мигает
(setq use-dialog-box nil) ;; никаких графических диалогов и окон - все через минибуфер
(setq redisplay-dont-pause t) ;; лучшая отрисовка буфера
(setq ring-bell-function 'ignore) ;; отключить звуковой сигнал
(delete-selection-mode t) ;; возможность удалить выделенный текст при вводе поверх
(electric-pair-mode 1) ;; автозакрытие {},[],() с переводом курсора внутрь скобок
(electric-indent-mode -1) ;; отключить индентацию electric-indent-mod'ом
(setq inhibit-startup-message t) ;; отключает стартовый экран emacs,логотип
;;(setq inhibit-startup-screen t)  ;; отключает стартовый экран emacs,логотип
;; Установить сообщение в *scratch*
(setq initial-scratch-message "")
(fset 'yes-or-no-p 'y-or-n-p)
(setq default-tab-width 4)
(setq make-backup-files nil)
;;шрифт
(set-face-attribute 'default nil
                   :family "DejaVu Sans Mono"
                   :height 130
                   :weight 'normal
                   :width 'normal)

;;(global-display-line-numbers-mode) ;; Чтобы номера строк отображались во всех буферах и сохранялись постоянно
;;(add-hook 'prog-mode-hook 'display-line-numbers-mode) ;; Чтобы номера строк отображались во всех буферах и сохранялись постоянно

(set-cursor-color "yellow") ;; изменить цвет курсора
;;(if (display-graphic-p) (set-face-attribute 'region nil :background "light yellow")) ;; изменить цвет выделения текста
;;(if (display-graphic-p) (set-face-attribute 'region nil :background "dark gray")) ;; изменить цвет выделения текста

(setq echo-keystrokes .1) ;; чтобы нажатия клавиш отображались в строке состояния

;;Сохранение сессии, открытых буферов
;;(desktop-save-mode 1)

 ;; Global_keywords
(global-set-key (kbd "M-m") 'speedbar)
;;показать/спрятать табы
(global-set-key (kbd "<f11>") 'global-tab-line-mode)
;; Add F12 to toggle line wrap - перенос строк
(global-set-key (kbd "<f12>") 'toggle-truncate-lines)
;;Terminal
(global-set-key (kbd "C-x t") 'shell)
(global-set-key (kbd "M-t") 'shell) ;; xterm
;;Other
(global-set-key (kbd "C-c o") 'my-open-file-externally) ;;открыть файл внешней программой
(global-set-key (kbd "C-c d") 'ежедневник)
(global-set-key (kbd "C-c s") 'справочник)
(global-set-key (kbd "C-c h") 'помощь)
;;EMMS install: M-x list-packages | emms
;;M-x emms — открыть плеер
;;i — добавить файл/папку
;;P — play/pause
;;n/p — следующий/предыдущий трек
;;q — остановить

;;русские буквы автоматически транслируются в соответствующие английские.
(defun reverse-input-method (input-method)
"Build the reverse mapping of single letters from INPUT-METHOD."
(interactive
(list (read-input-method-name "Use input method (default current): ")))
(if (and input-method (symbolp input-method))
(setq input-method (symbol-name input-method)))
(let ((current current-input-method)
(modifiers '(nil (control) (super) (meta) (control meta))))
(when input-method
(activate-input-method input-method))
(when (and current-input-method quail-keyboard-layout)
(dolist (map (cdr (quail-map)))
(let* ((to (car map))
(from (quail-get-translation
(cadr map) (char-to-string to) 1)))
(when (and (characterp from) (characterp to))
(dolist (mod modifiers)
(define-key local-function-key-map
(vector (append mod (list from)))
(vector (append mod (list to)))))))))
(when input-method
(activate-input-method current))))
(reverse-input-method 'russian-computer)

;;speedbar-показать все директории
;;(setq speedbar-directory-unshown-regexp "^$")
(setq speedbar-directory-unshown-regexp "^\\(CVS\\|RCS\\|SCCS\\|\\.\\.*$\\)\\'")

;; перенос строк - disable line wrap
(setq default-truncate-lines t)
;; make side by side buffers function the same as the main window
(setq truncate-partial-width-windows nil)
;; Включить перенос строк везде, где это уместно
(global-visual-line-mode 1)
;; Альтернатива: включить только в определённых режимах
(add-hook 'text-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'markdown-mode-hook 'visual-line-mode)
(add-hook 'latex-mode-hook 'visual-line-mode)

;; Сохранять только размер и положение окна
(defvar my-frame-geometry-file "~/.emacs.d/frame-geometry.el"
  "Файл для сохранения размера и положения окна.")
(defun my-save-frame-geometry ()
  "Сохранить размер и положение окна"
  (when (not (frame-parameter nil 'minimized))
    (let ((frame (selected-frame)))
      (with-temp-file my-frame-geometry-file
        (prin1
         (list :width  (frame-width frame)
               :height (frame-height frame)
               :left   (frame-parameter frame 'left)
               :top    (frame-parameter frame 'top))
         (current-buffer))))))
(defun my-restore-frame-geometry ()
  "Восстановить размер и положение окна"
  (when (file-exists-p my-frame-geometry-file)
    (let* ((data (with-temp-buffer
                   (insert-file-contents my-frame-geometry-file)
                   (read (current-buffer))))
           (width  (plist-get data :width))
           (height (plist-get data :height))
           (left   (plist-get data :left))
           (top    (plist-get data :top)))
      (modify-frame-parameters
       nil
       (list (cons 'width  width)
             (cons 'height height)
             (cons 'left   left)
             (cons 'top    top))))))    
;; Восстановить при старте
(my-restore-frame-geometry)
;; Сохранить при выходе
(add-hook 'kill-emacs-hook 'my-save-frame-geometry)


;;;Надёжная настройка для FreeBSD.Смена расширения в строке состояния.Цвет значка.
;; === Цвета расширений ===
(defvar my-file-ext-colors
  '(("el"   . "#9d4edd")
    ("py"   . "#e6af2e")
    ("sh"   . "#f97316")
    ("js"   . "#84cc16")
    ("org"  . "#4ade80")
    ("md"   . "#60a5fa")
    ("txt"  . "#9ca3af")
    ("conf" . "#22d3ee")
    ("xml"  . "#ec4899")
    ("json" . "#0ea5e9"))
  "Расширение → цвет")
(defun my-get-ext-color (ext)
  "Вернуть цвет для расширения"
  (let ((color (assoc-string ext my-file-ext-colors t)))
    (if color (cdr color) "#f3f4f6")))
;; === Функция смены расширения ===
(defun my-rename-file-extension (pos)
  "Изменить расширение файла"
  (interactive "@e")
  (unless buffer-file-name
    (message "Этот буфер не связан с файлом")
    (user-error "Нет файла"))
  (let* ((old-path buffer-file-name)
         (name-without-ext (file-name-sans-extension old-path))
         (current-ext (file-name-extension old-path))
         (new-ext (read-string
                   (format "Новое расширение (без точки, текущее: %s): " (or current-ext "нет"))
                   nil nil nil current-ext)))
    (setq new-ext (replace-regexp-in-string "^\\." "" new-ext))
    (unless (string-empty-p new-ext)
      (let ((new-path (concat name-without-ext "." new-ext)))
        (if (file-exists-p new-path)
            (message "Файл %s уже существует!" new-path)
          (progn
            (rename-file old-path new-path t)
            (set-visited-file-name new-path)
            (save-buffer)
            (message "Файл переименован: %s → %s" old-path new-path)))))))
;; === Отображение в строке состояния ===
(defun my-mode-line-file-extension ()
  "Показать расширение с цветом"
  (when (and buffer-file-name (file-exists-p buffer-file-name))
    (let* ((ext (file-name-extension buffer-file-name))
           (color (if ext (my-get-ext-color (downcase ext)) "gray"))
           (text (if ext (upcase ext) "NOEXT")))
      (propertize
       (concat " " text " ")
       'face (list :background color :foreground "black" :weight 'bold)
       'help-echo "ЛКМ: изменить расширение файла"
       'mouse-face 'mode-line-highlight
       'local-map (let ((map (make-sparse-keymap)))
                    (define-key map [mode-line mouse-1] 'my-rename-file-extension)
                    map)))))
;; Добавить в строку состояния
(setq-default mode-line-format
              (append mode-line-format
                      '(" [" (:eval (my-mode-line-file-extension)) "] ")))
(message "Конфиг загружен. Открой файл, чтобы увидеть расширение в строке состояния.")

;;открыть файл внешней программой
  (defun my-open-file-externally ()
  "Открыть файл с помощью xdg-open"
  (interactive)
  (unless buffer-file-name
    (user-error "Буфер не связан с файлом"))
  (let ((file buffer-file-name))
    (if (executable-find "xdg-open")
        (progn
          (shell-command (format "xdg-open '%s'" file) "&")
          (message " Открыто через xdg-open: %s" file))
      (message " Не найден xdg-open. Установи: pkg install xdg-utils"))))
      
;; melpa
(require 'package)  
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)  
(package-initialize)
 
;; EMMS
(require 'emms-setup)
(emms-all)
(setq emms-player-list '(emms-player-mpv))
(setq emms-source-file-default-directory "~/Music")
;;EMMS install: M-x list-packages | emms
;;M-x emms — открыть плеер
;;i — добавить файл/папку
;;P — play/pause
;;n/p — следующий/предыдущий трек
;;q — остановить

;; закладки
;;Автосохранение закладок после каждого изменения
(setq bookmark-save-flag 1)
;;Сортировка закладок по времени последнего использования
(setq bookmark-sort-criterion 'last-visited)
;;Отображение полных путей в списке
(setq bookmark-display-full-names t)
;;Отображение полных путей в списке:
(setq bookmark-display-full-names t)
;; Показать аннотации
(setq bookmark-show-annotation t)
;; Путь к файлу закладок
;;(setq bookmark-default-file "~/.emacs.d/my-bookmarks")
;; Автозагрузка закладок при старте
(require 'bookmark)
;;Горячие клавиши для быстрого доступа
(global-set-key (kbd "C-c b l") 'bookmark-bmenu-list)
(global-set-key (kbd "C-c b s") 'bookmark-set)
(global-set-key (kbd "C-c b j") 'bookmark-jump)
(global-set-key (kbd "C-c b d") 'bookmark-delete)

