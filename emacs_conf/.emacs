;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(cua-mode t)
 '(custom-enabled-themes '(wombat))
 '(font-use-system-font t)
 '(org-safe-remote-resources
   '("\\`https://fniessen\\.github\\.io/org-html-themes/org/theme-bigblow\\.setup\\'"
     "\\`https://fniessen\\.github\\.io/org-html-themes/org/theme-readtheorg\\.setup\\'"))
 '(package-selected-packages '(emms))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Noto Sans" :foundry "GOOG" :slant normal :weight regular :height 120 :width normal)))))

;;Emacs_conf
(add-to-list 'load-path "~/.emacs.d/lisp")
(load-file "~/.emacs.d/lisp/bootstrap.el")
(load-file "~/.emacs.d/lisp/sys_com.el")
(load-file "~/.emacs.d/lisp/org-preview-html.el")
(load-file "~/.emacs.d/lisp/my.el")
(load-file "~/.emacs.d/lisp/help.el")
(load-file "~/.emacs.d/lisp/date.el")
(load-file "~/.emacs.d/lisp/cal.el")
(load-file "~/.emacs.d/lisp/latex.el")
(load-file "~/.emacs.d/lisp/md.el")
