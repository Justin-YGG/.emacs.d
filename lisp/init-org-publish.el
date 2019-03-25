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
         :html-head-include-scripts t ;the default javascript snippet
         :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"/css/worg.css\"/>\n<link rel=\"icon\" type=\"image/png\" href=\"/img/icons/heckert.png\">"
         :html-link-home "../index.html"
         :html-link-up "index.html"
         )

        ("blog-static"
         :base-directory "~/org/notes"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|mp4\\|ogg\\|swf"
         :publishing-directory "~/org/public_html/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        
        ("blog-rss"
         :base-directory "~/org/notes"
         :base-extension "org"
         :rss-image-url "https://www.mxtsing.com/img/icons/rss.png"
         :html-link-home "https://www.mxtsing.com"
         :html-link-use-abs-url t
         :rss-extension "xml"
         :publishing-directory "~/org/public_html/"
         :publishing-function (org-rss-publish-to-rss)
         :section-numbers nil
         :exclude ".*"            ;; To exclude all files...
         :include ("sitemap.org")   ;; ... except sitemap.org.
         :table-of-contents nil
         )

        ("blog" :components ("blog-notes" "blog-static"))
        ))

(setq org-html-head-include-default-style nil)
                                        ;(setq org-html-head-include-scripts nil)
(setq org-export-with-smart-quotes t)
(setq org-html-table-default-attributes
      '(:border "0" :cellspacing "0" :cellpadding "6" :rules "none" :frame "none"))
(setq org-image-actual-width nil)

;;MathJax CDN
(setq org-html-mathjax-options
      '((path "https://www.mxtsing.com/js/MathJax.js?config=TeX-AMS-MML_HTMLorMML,local/local")
        (scale "100")
        (align "center")
        (indent "2em")
        (mathml nil))

      )

(setq org-html-mathjax-template "<script type=\"text/javascript\" src=\"%PATH\"></script>")


(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (emacs-lisp . t)
   (org . t)
   (sh . t)
   (C . t)
   (python . t)
   ))

(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq-local org-html-htmlize-output-type 'inline-css)

(provide 'init-org-publish)
;;; org-publish.el ends here
