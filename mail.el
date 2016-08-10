;;; mail.el --- Summary: Sam's Mail Config

;;; Commentary:
;; Mail config for Exchange / Office 365

;;; Code:

(setq gnus-ignored-newsgroups ""
      mail-host-address "squaredup.com"
      user-full-name "Sam Lord"
      user-mail-address "sam.lord@squaredup.com")

(setq gnus-select-method '(nnimap "squaredup"
				  (nnimap-address "127.0.0.1")
				  (nnimap-server-port 1143)
				  (nnimap-stream ssl)))

(setq mm-discouraged-alternatives '("text/html" "text/richtext"))

(require 'smtpmail)
(setq send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "127.0.0.1"
      smtpmail-stream-type 'ssl
      smtpmail-smtp-service 1025)

(provide 'mail)
;;; mail.el ends here
