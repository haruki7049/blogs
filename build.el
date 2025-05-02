(require 'ox-publish)

(setq org-publish-project-alist
      '(("Haruki7049's blogs"
         :base-directory "src"
         :publishing-function org-html-publish-to-html
         :publishing-directory "dist"
         :html-head-include-default-style nil

         ;; Sitemap generator
         :auto-sitemap t
         :sitemap-filename "index.org"
         :sitemap-title "Sitemap for Haruki7049's blogs"

         ;; CSS loader from HTTP
         :html-head "<link href=\"https://thomasf.github.io/solarized-css/solarized-dark.css\" rel=\"stylesheet\"></link>
         <link href=\"favicon.ico\" rel=\"icon\"></link>")))

(org-publish-all t)
