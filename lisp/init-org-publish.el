;;; org-publish.el --- publish related org-mode files as a website

(require 'ox-publish)
(setq org-publish-project-alist
      '(("blog-notes"
         :base-directory "~/org/notes"
         :base-extension "org"
         :publishing-directory "~/org/public_html/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4             ; Just the default for this project.
         :auto-preamble t
         :section-numbers nil
         :author "Justin"
         :email "jiatsing@icloud.com"
         :html-postamble nil
         :auto-sitemap t                ; Generate sitemap.org automagically...
         :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
         :sitemap-title "Sitemap"         ; ... with title 'Sitemap'.
         :sitemap-sort-files anti-chronologically
         :sitemap-file-entry-format "%d %t"
         :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"/css/worg.css\"/>"
         )

        ("blog-static"
         :base-directory "~/org/notes"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/org/public_html/"
         :recursive t
         :publishing-function org-publish-attachment
         )

        ("blog" :components ("blog-notes" "blog-static"))
        ))

(setq org-html-head-include-default-style nil)
(setq org-html-head-include-scripts nil)
(setq org-export-with-smart-quotes t)
(setq org-html-table-default-attributes
      '(:border "0" :cellspacing "0" :cellpadding "6" :rules "none" :frame "none"))
(provide 'init-org-publish)
;;; org-publish.el ends here
