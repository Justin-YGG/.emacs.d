(require 'org-bullets)

(setq org-bullets-bullet-list '("◉" "○" "✸" "✿"))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Activation: This will make sure org gets loaded, and some basic global key combinations are defined.
;;(require 'ox)
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files (file-expand-wildcards "~/org/gtd/*.org"))
;; 设置 org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)


(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(setq org-log-done t)
(setq org-fast-tag-selection-single-key t)
(setq org-use-fast-todo-selection t)
(setq org-startup-truncated nil)
(setq org-startup-indented t)

(setq org-directory (expand-file-name "~/org"))
;(setq org-default-notes-file (concat org-directory "~/org/gtd/inbox.org"))

;;; Capturing
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-capture-templates
      `(("t" "todo" entry (file "~/org/gtd/inbox.org")
         "* NEXT %?\n%U\n" :clock-resume t)
        ("n" "note" entry (file "")
         "* %? :NOTE:\n%U\n%a\n" :clock-resume t)
        ))

(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change t)
(global-set-key (kbd "<f9> c") 'calendar)
(global-set-key (kbd "<f9> I") 'bh/punch-in)

;;(setq org-agenda-ndays 7)
;;(setq org-agenda-show-all-dates t)
;;(setq org-agenda-skip-deadline-if-done t)
;;(setq org-agenda-skip-scheduled-if-done t)
;;(setq org-agenda-start-on-weekday nil)
;;(setq org-deadline-warning-days 14)

(setq org-todo-keywords
      '(
        (sequence "IDEA(i)" "☛ TODO(t)" "STARTED(s)" "NEXT(n)" "⚑ WAITING(w)" "|" "✓ DONE(d)")
        (sequence "|" "✘ CANCELED(c)" "DELEGATED(l)" "SOMEDAY(f)")
        ))

(setq org-todo-keyword-faces
      '(("IDEA" . (:foreground "GoldenRod" :weight bold))
        ("NEXT" . (:foreground "IndianRed1" :weight bold))
        ("STARTED" . (:foreground "OrangeRed" :weight bold))
        ("WAITING" . (:foreground "coral" :weight bold))
        ("CANCELED" . (:foreground "LimeGreen" :weight bold))
        ("DELEGATED" . (:foreground "LimeGreen" :weight bold))
        ("SOMEDAY" . (:foreground "LimeGreen" :weight bold))
        ))

(setq org-tag-persistent-alist
      '((:startgroup . nil)
        ("HOME" . ?h)
        ("RESEARCH" . ?r)
        ("TEACHING" . ?t)
        (:endgroup . nil)
        (:startgroup . nil)
        ("OS" . ?o)
        ("DEV" . ?d)
        ("WWW" . ?w)
        (:endgroup . nil)
        (:startgroup . nil)
        ("EASY" . ?e)
        ("MEDIUM" . ?m)
        ("HARD" . ?a)
        (:endgroup . nil)
        ("URGENT" . ?u)
        ("KEY" . ?k)
        ("BONUS" . ?b)
        ("noexport" . ?x)
        )
      )

(setq org-tag-faces
      '(
        ("HOME" . (:foreground "GoldenRod" :weight bold))
        ("RESEARCH" . (:foreground "GoldenRod" :weight bold))
        ("TEACHING" . (:foreground "GoldenRod" :weight bold))
        ("OS" . (:foreground "IndianRed1" :weight bold))
        ("DEV" . (:foreground "IndianRed1" :weight bold))
        ("WWW" . (:foreground "IndianRed1" :weight bold))
        ("URGENT" . (:foreground "Red" :weight bold))
        ("KEY" . (:foreground "Red" :weight bold))
        ("EASY" . (:foreground "OrangeRed" :weight bold))
        ("MEDIUM" . (:foreground "OrangeRed" :weight bold))
        ("HARD" . (:foreground "OrangeRed" :weight bold))
        ("BONUS" . (:foreground "GoldenRod" :weight bold))
        ("noexport" . (:foreground "LimeGreen" :weight bold))
        )
      )

(setq org-enable-priority-commands nil)
(global-set-key (kbd "<f12>") 'org-agenda)
;; (setq org-agenda-span 'day)

;; Do not dim blocked tasks
;;(setq org-agenda-dim-blocked-tasks nil)

;; Compact the block agenda view
;;(setq org-agenda-compact-blocks t)

;;(add-hook 'org-mode-hook (lambda () (linum-mode 0)))
(defun nolinum ()
  (interactive)
  (message "Deactivated linum mode")
  (linum-mode 0)
  )

;; notify
(defun notify-osx (title message)
  (call-process "terminal-notifier"		 
                nil 0 nil		 
                "-group" "Emacs"		 
                "-title" title		 
                "-sender" "org.gnu.Emacs"		 
                "-message" message		 
                "-activate" "org.gnu.Emacs")
  )

(add-hook 'org-pomodoro-finished-hook
          (lambda ()
            (notify-osx "Pomodoro completed!" "Time for a break.")))
(add-hook 'org-pomodoro-break-finished-hook
          (lambda ()
            (notify-osx "Pomodoro Short Break Finished" "Ready for Another?")))
(add-hook 'org-pomodoro-long-break-finished-hook
          (lambda ()
            (notify-osx "Pomodoro Long Break Finished" "Ready for Another?")))
(add-hook 'org-pomodoro-killed-hook    
          (lambda ()
            (notify-osx "Pomodoro Killed" "One does not simply kill a pomodoro!")))

(add-hook 'org-mode-hook 'nolinum)

(provide 'init-org-mode)
;;; init ord
