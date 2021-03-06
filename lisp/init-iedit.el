(require 'iedit)
(setq-default iedit-toggle-key-default (kbd "C-;"))
(autoload 'iedit-mode-from-isearch "iedit" "enable iedit-mode when in isearch mode")
(define-key global-map iedit-toggle-key-default 'iedit-mode)
(define-key global-map (kbd "C-[ [ a f") 'iedit-mode) ;iterm map C-; to this
(define-key isearch-mode-map iedit-toggle-key-default 'iedit-mode-from-isearch)

(provide 'init-iedit)
