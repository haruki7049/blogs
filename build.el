(require 'ox-publish)

(setq org-publish-project-alist
      '(("Haruki7049's blogs"
         :base-directory "src"
         :publishing-function org-html-publish-to-html
         :publishing-directory "dist"
         :language "ja"
         :section-numbers t
         :with-title t
         :with-date nil
         :html-head-include-default-style nil
         :auto-sitemap t
         :sitemap-filename "index.org"
         :sitemap-title "Sitemap for Haruki7049's blogs")))

(org-publish-all t)
