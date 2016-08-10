;;; init.el --- Summary: Sam's init file

;;; Commentary:

;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "127.0.0.1")
 '(smtpmail-smtp-service 1025))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(load-file "~/.emacs.d/cosmetic.el")
(load-file "~/.emacs.d/mail.el")

(require 'helm-config)
(helm-mode 1)

;; change default prefix key
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

;; helm-M-x
(setq helm-M-x-fuzzy-match t)
(global-set-key (kbd "M-x") 'helm-M-x)

;; helm-kill-ring
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

;; helm-mini
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-mini)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t)

;; helm-find-files
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(require 'projectile)
(projectile-global-mode)

(require 'flycheck)
(global-flycheck-mode 1)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(require 'company)
(global-company-mode 1)
(setq company-idle-delay 0)

(electric-pair-mode 1)
(electric-indent-mode 1)

(prettify-symbols-mode 1)

(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; Backup files
(setq
   backup-by-copying t
   backup-directory-alist
    '(("." . "~/.saves"))
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)

;; Lisp
(setq show-paren-delay 0)
(show-paren-mode 1)
(setq scheme-program-name "C:\\chicken-iup\\bin\\csi -:c")

(provide 'init)
;;; init.el ends here
