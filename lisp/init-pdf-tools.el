;;; Require
(require 'pdf-tools)

;; open pdfs scaled to fit page
(setq-default pdf-view-display-size 'fit-page)
;; automatically annotate highlights
(setq pdf-annot-activate-created-annotations t)
;; use normal isearch
(define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)

(defun nolinum ()
  (interactive)
  (message "Deactivated linum mode")
  (linum-mode 0)
)
(add-hook 'pdf-view-mode-hook 'nolinum)

(add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode))

;; midnite mode hook
(add-hook 'pdf-view-mode-hook (lambda ()
                                (pdf-view-midnight-minor-mode))) ; on midnight-mode for pdfs

(setq pdf-view-midnight-colors '("#00B800" . "#292B2E" )) ; set the green profile as default (see below)

(provide 'init-pdf-tools)
