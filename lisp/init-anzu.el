(require 'anzu)
(global-anzu-mode +1)

(set-face-attribute 'anzu-mode-line t
                    :foreground "yellow" :weight 'bold)

(custom-set-variables
 '(anzu-mode-lighter "")
 '(anzu-deactivate-region t)
 '(anzu-search-threshold 1000)
 '(anzu-replace-threshold 50)
 '(anzu-replace-to-string-separator " => "))

(provide 'init-anzu)
