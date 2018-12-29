(require-package 'exec-path-from-shell)

(exec-path-from-shell-copy-env "/usr/local/bin")

(provide 'init-exec-path)
