;;(require 'neotree)
;;(global-set-key [f2] 'neotree-toggle)
;;(setq neo-theme 'arrow)
;;(setq neo-autorefresh t)
(require 'direx)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)
(provide 'init-neo-tree)

