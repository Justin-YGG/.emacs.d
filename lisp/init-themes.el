(require-package 'spacemacs-theme)
(require-package 'srcery-theme)
                                        ;(require-package 'tao-theme)
;; If you don't customize it, this is the theme you get.

(setq-default custom-enabled-themes '(search srcery spacemacs-dark))
                                        ;(load-theme 'spacemacs-dark t)
(load-theme 'srcery t)

                                        ;(load-theme 'tao-yang t)
;;(load-theme 'dracula t)

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)


;;------------------------------------------------------------------------------
;; Toggle between light and dark
;;------------------------------------------------------------------------------
(defun light ()
  "Activate a light color theme."
  (interactive)
  (setq custom-enabled-themes '(spacemacs-light))
  (reapply-themes))

(defun dark ()
  "Activate a dark color theme."
  (interactive)
  (setq custom-enabled-themes '(spacemacs-dark))
  (reapply-themes))


(when (maybe-require-package 'dimmer)
  (setq-default dimmer-fraction 0.15)
  (add-hook 'after-init-hook 'dimmer-mode))


(provide 'init-themes)
