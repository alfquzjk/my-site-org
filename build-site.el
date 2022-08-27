;; Set the package installation directory so that packages aren't stored in the
;; ~/.emacs.d/elpa path.
(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(package-install 'htmlize)

;; load the publishing system
(require 'ox-publish)
;; code block highlight
(require 'htmlize)
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

(setq org-confirm-babel-evaluate nil
      org-src-fontify-natively t
      org-src-tab-acts-natively t)


;; Customize the HTML output
(setq org-html-validation-link nil ;; Don't show validation link
      org-html-head-include-scripts nil ;; Use own scripts
      org-html-head-include-default-style nil ;; Use own styles
      org-html-head "<link rel=\"stylesheet\" href=\"./css/simple.css\" />\n<link rel=\"icon\" href=\"./images/favicon.ico\" type=\"image/x-icon\" />")
(org-publish-all t)
(message "Build complete!")
