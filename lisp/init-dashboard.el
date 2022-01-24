(require 'dashboard)
(dashboard-setup-startup-hook)

;; Set the title
(setq dashboard-banner-logo-title "Happy hacking, Justin - Emacs ♥ you!")
(setq dashboard-startup-banner "~/.emacs.d/img/logo.png")
;;(setq projects ["~/worksapce/solar/"])
(setq dashboard-items '((recents  . 5)
                        (projects . 5)))

(provide 'init-dashboard)
