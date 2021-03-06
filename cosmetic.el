;;; cosmetic.el --- Makes things look pretty

;;; Commentary:
;; Part of Sam's init, does all the prettifying
;; See init.el for theme loading

;;; Code:

(setq visible-bell 1)

(global-font-lock-mode 1)
(setq font-lock-maximum-decoration t)

(tool-bar-mode -1)
(scroll-bar-mode -1)

(add-to-list 'default-frame-alist '(font . "Hack-9"))

(load-theme 'zenburn t)

(set-face-attribute 'default nil
		    :font "Hack-9")

(set-face-attribute 'mode-line nil
		    :box nil
		    :overline nil
		    :underline nil
		    :font "Hack-9")

(set-face-attribute 'mode-line-inactive nil
		    :box nil
		    :overline nil
		    :underline nil)

(set-default 'cursor-type 'bar)

(provide 'cosmetic)
;;; cosmetic.el ends here
