;;; init.el --- Summary: Sam's init file

;;; Commentary:

;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("36d92f830c21797ce34896a4cf074ce25dbe0dabe77603876d1b42316530c99d" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "b04425cc726711a6c91e8ebc20cf5a3927160681941e06bc7900a5a5bfe1a77f" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "40f6a7af0dfad67c0d4df2a1dd86175436d79fc69ea61614d668a635c2cd94ab" default)))
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

(require 'helm-config)
(helm-mode 1)

;; change default prefix key
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

;; helm-M-x
(defvar helm-M-x-fuzzy-match)
(setq helm-M-x-fuzzy-match t)
(global-set-key (kbd "M-x") 'helm-M-x)

;; helm-kill-ring
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

;; helm-mini
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-mini)
(defvar helm-buffers-fuzzy-matching)
(defvar helm-recentf-fuzzy-match)
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


(require 'smart-mode-line)
(setq sml/theme 'light-powerline)
(sml/setup)

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
(defvar show-paren-delay)
(defvar show-paren-mode)
(defvar scheme-program-name)
(setq show-paren-delay 0)
(show-paren-mode 1)
(setq scheme-program-name "C:\\chicken-iup\\bin\\csi -:c")

(load-file "~/.emacs.d/cosmetic.el")
(load-file "~/.emacs.d/mail.el")

(provide 'init)
;;; init.el ends here



