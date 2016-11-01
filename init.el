;;; init.el --- Summary: Sam's init file

;;; Commentary:

;;; Code:

;; Daemon
(require 'server)
(unless (server-running-p)
  (server-start))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "36d92f830c21797ce34896a4cf074ce25dbe0dabe77603876d1b42316530c99d" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "b04425cc726711a6c91e8ebc20cf5a3927160681941e06bc7900a5a5bfe1a77f" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "40f6a7af0dfad67c0d4df2a1dd86175436d79fc69ea61614d668a635c2cd94ab" default)))
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "localhost")
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
(add-hook 'prog-mode-hook 'flycheck-mode)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(require 'company)
(global-company-mode 1)
(setq company-idle-delay 0)

(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'prog-mode-hook 'electric-indent-mode)
(add-hook 'prog-mode-hoook 'prettify-symbols-mode)

(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

(require 'smart-mode-line)
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

;; C Mode
(defun set-c-indentation-style ()
  "Set my preferred C indentation style."
  (progn (setq c-default-style "java")
	 (setq c-basic-offset 4)))
(add-hook 'csharp-mode-hook 'set-c-indentation-style)

;; Web Mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.njk\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.sass\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.less\\'" . web-mode))
(defun my-web-mode-hook ()
  "Hooks for web mode."
  (progn  (setq web-mode-markup-indent-offset 2)
	  (setq web-mode-css-indent-offset 2)
	  (setq web-mode-code-indent-offset 2)
	  (setq web-mode-style-padding 2)
	  (setq web-mode-script-padding 2)))
(add-hook 'web-mode-hook 'my-web-mode-hook)

;; Rainbow o3o
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Line Numbers
(add-hook 'prog-mode-hook 'linum-mode)

(load-file "~/.emacs.d/cosmetic.el")
(load-file "~/.emacs.d/mail.el")

(provide 'init)
;;; init.el ends here
