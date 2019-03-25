;; 开启括号自动匹配
(electric-pair-mode 1)
;; 开启括号高亮
(show-paren-mode 1)

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 更改光标的样式
(setq-default cursor-type 'bar)
;; 显示行号
(global-linum-mode 1)

;; The value is in 1/10pt, so 100 will give you 10pt, etc.
                                        ;(set-face-attribute 'default nil :height 180)

(setq cnfonts--custom-set-fontnames
      '(("PragmataPro" "Ubuntu Mono" "DejaVu Sans Mono")
        ("文泉驿等宽微米黑" "Ubuntu Mono" "隶书" "新宋体")
        ("HanaMinB" "SimSun-ExtB" "MingLiU-ExtB")))

(set-default-font "Monaco")


;; 禁掉~ 为后 缀的文件为自动生成的备份文件
(setq make-backup-files nil)
;; 高亮当前行
(global-hl-line-mode 1)
;; 特殊符号，光标定位到右边时显示原始
(global-prettify-symbols-mode 1)
(setq prettify-symbols-unprettify-at-point 'right-edge)

(provide 'init-ui)
