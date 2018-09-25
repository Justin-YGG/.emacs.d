(require 'projectile)
(add-hook 'after-init-hook 'projectile-mode)

(projectile-global-mode)
(setq projectile-completion-system 'ivy)
(setq projectile-project-search-path '("~/org/gtd/"))

(setq projectile-globally-ignored-directories
      (append '(
        ".git"
        "venv"
        "fe"
        )
          projectile-globally-ignored-directories))
(setq projectile-globally-ignored-files
      (append '(
        ".DS_Store"
        "*.pyc"
        )
          projectile-globally-ignored-files))

(define-key projectile-mode-map [?\s-d] 'projectile-find-dir)
(define-key projectile-mode-map [?\s-p] 'projectile-switch-project)
(define-key projectile-mode-map [?\s-f] 'projectile-find-file)
;;(global-set-key [f5] 'projectile-find-file)
(define-key projectile-mode-map [?\s-g] 'projectile-grep)

(provide 'init-projectile)
