(require-package 'exec-path-from-shell)

(setq exec-path-from-shell-check-startup-files nil)

(after-load 'exec-path-from-shell
  (dolist (var '("LANG" "LC_ALL" "PKG_CONFIG_PATH"))
    (add-to-list 'exec-path-from-shell-variables var)))

(exec-path-from-shell-copy-env "~/worksapce/solar/venv/bin/python")

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(add-hook 'python-mode-hook
          '(lambda ()
             ;; Use `ignore-errors' avoid LSP failed.
             (ignore-errors (lsp-python-enable()))
             ))  

(provide 'init-exec-path)
