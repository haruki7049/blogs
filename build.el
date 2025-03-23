(require 'ox-publish)

(setq org-publish-project-alist
      '(("Haruki7049's blogs"
         :base-directory "src"
         :publishing-function org-html-publish-to-html
         :publishing-directory "dist"
         :language "ja"
         :section-numbers t
         :with-title nil
         :with-date nil
         :html-head-include-default-style nil)))

(org-publish-all t)
