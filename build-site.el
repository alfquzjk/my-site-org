;; load the publishing system
(require 'ox-publish)
;; define the publishing project   
(setq org-publish-project-alist
      (list
       (list "my-org-site"
	     :recursive t
	     :base-directory "./content"
	     :publishing-directory "./public"
	     :publishing-function 'org-html-publish-to-html
	     :with-author nil ;; Dont't include author name
	     :with-creator t ;; Include emacs and org version in footer
	     :with-toc nil ;;Include a table of contens
	     :section-numbers nil ;; Don't include section numbers
	     :time-stamp-file nil ))) ;; Don't include time stamp in file
;; generate the site output
(setq org-html-validation-link nil)

;; Customize the HTML output
(setq org-html-validation-link nil ;; Don't show validation link
      org-html-head-include-scripts nil ;; Use our own scripts
      org-html-head-include-default-style nil ;; Use our own styles
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" /"
      )
(org-publish-all t)
(message "Build complete!")
