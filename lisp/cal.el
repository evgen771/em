(defun ежедневник ()
  "Открывает или создаёт файл дневника на сегодня.
Буфер защищён от случайного закрытия."
  (interactive)
  (let* ((директория "~/Дневник/")
         (файл (expand-file-name (format-time-string "%Y-%m-%d.org") директория))
         (папка-существует (file-exists-p директория)))
;; Создать папку, если нет
    (unless папка-существует
      (make-directory директория t))
;; Открыть файл
    (find-file файл)
;; Добавить защиту от закрытия ТОЛЬКО для этого буфера
    (unless (eq (local-variable-p 'kill-buffer-query-function) t)
      (set (make-local-variable 'kill-buffer-query-function)
           (lambda ()
             (if (string= (buffer-name)
                          (format-time-string "%Y-%m-%d.org"))
                 (yes-or-no-p "Это ваш дневник на сегодня. Точно закрыть? ")
               t))))))
