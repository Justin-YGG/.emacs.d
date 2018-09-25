
(defun chunyang-chrome-refresh ()
  "Refresh the current tab of Chrome."
  (do-applescript
   "tell application \"Chrome\" \
to tell the active tab of its first window to reload"))

(defun chunyang-chrome-url ()
  "Return the URL of the current tab of Chrome."
  (replace-regexp-in-string
   (rx (or (and string-start ?\")
           (and ?\" string-end)))
   ""
   (do-applescript
    "tell application \"Google Chrome\" to return URL of active tab of first window")))

(defun chunyang-markdown-preview-in-chrome ()
  "Export Markdown and preview the result in Chrome.
This function reuses the current tab of Chrome,
unlike `markdown-preview'."
  (interactive)
  (let ((output (markdown-export)))
    (if (string-match-p (regexp-quote output) (chunyang-chrome-url))
        (chunyang-chrome-refresh)
      (browse-url output))))

(define-minor-mode chunyang-markdown-preview-in-chrome-mode
  "Run `chunyang-markdown-preview-in-chrome' on save."
  :lighter " MD-Preview-in-Chrome"
  (unless (eq major-mode 'markdown-mode)
    (user-error "Error: %s is not Markdown Mode" major-mode))
  (if chunyang-markdown-preview-in-chrome-mode
      (add-hook 'after-save-hook #'chunyang-markdown-preview-in-chrome :append :local)
    (remove-hook 'after-save-hook #'chunyang-markdown-preview-in-chrome :local)))
