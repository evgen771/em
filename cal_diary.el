;;calendar_diary | календарь_дневник
;;вид дневника
(setq diary-display-function 'diary-fancy-display)
;;(setq diary-display-function 'diary-simple-display)

;;Автозагрузка дневника
(add-hook 'after-init-hook 'diary)

;;Сохраните файл и перезапустите Emacs
;;чтобы применить изменения без перезагрузки
;;M-x eval-buffer RET




