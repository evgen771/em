;; Загрузка EXWM
(require 'exwm)
(require 'exwm-config)
(exwm-config-example) ; для загрузки настроек по умолчанию

;;горячие клавиши 
(require 'exwm)
(require 'exwm-config)
(exwm-enable)

;; Горячие клавиши
(setq exwm-input-global-keys
      `(
        (,(kbd "s-&") . (lambda () (interactive) (start-process-shell-command "firefox" nil "firefox")))
        (,(kbd "s-t") . (lambda () (interactive) (start-process-shell-command "alacritty" nil "alacritty"))))

 
;;Для включения системного трея
(require 'exwm-systemtray)
(exwm-systemtray-mode 1)
;; Настройка высоты
(setq exwm-systemtray-height 24)

;;Неинформативные имена буферов
(add-hook 'exwm-update-class-hook
           (lambda ()
             (exwm-workspace-rename-buffer exwm-class-name)))
