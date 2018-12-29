;;; package --- summary or add python emacs mode: elpy

;; automatical complete: company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode); global enable
(setq company-show-numbers t)           ; display serial number
(setq company-idle-delay 0.2); menu delay
(setq company-minimum-prefix-length 1); start completelyness number

;; elpy-- main actor
(require 'elpy)
(elpy-enable)
;; enable elpy jedi backend
(setq elpy-rpc-backend "jedi")
(setq jedi:use-shortcuts t)

;; Fixing a key binding bug in elpy
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
;; Fixing another key binding bug in iedit mode
(define-key global-map (kbd "C-c o") 'iedit-mode)

;; grammal check: flycheck
(add-hook 'after-init-hook #'global-flycheck-mode);global enable
                                        ; close flymake,  start flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules(delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; virutal environment:  virtualenvwrapper
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)
(setq venv-location "~/.virtualenvs"); setup virtual environment folder
;; if there multiple folder:
;; (setq venv-location '("~/myvenv-1/"
;;                       "~/myvenv-2/"))
;; M-x venv-workon open virtual environment
;; 自动完成
(require 'company)
(global-company-mode t); 全局开启

(setq company-idle-delay 0.2;菜单延迟
      company-minimum-prefix-length 1; 开始补全字数
      company-require-match nil
                                        ;company-dabbrev-ignore-case nil
                                        ;company-dabbrev-downcase nil
      company-show-numbers t; 显示序号
      company-transformers '(company-sort-by-backend-importance)
      company-continue-commands '(not helm-dabbrev)
      company-selection-wrap-around t
      company-tooltip-align-annotations t
                                        ;company-transformers '(company-sort-by-occurrence)
      )
                                        ; 补全后端使用anaconda
(add-to-list 'company-backends '(company-anaconda :with company-yasnippet))
                                        ; 补全快捷键
(global-set-key (kbd "<C-tab>") 'company-complete)
                                        ; 补全菜单选项快捷键
(define-key company-active-map (kbd "M-n") nil)
(define-key company-active-map (kbd "M-p") nil)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)


(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;; 在python模式中自动启用
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))

(provide 'init-python-mode)
