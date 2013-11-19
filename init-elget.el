;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;configuration for el-get;
;;;;;;;;;;;;;;;;;;;;;;;;;;

;;define the el-get root directory
(setq el-get-root-dir
      (expand-file-name "el-get"
		        user-emacs-directory))

;;define the default recipes directory
(setq el-get-recipes-path
      (expand-file-name "el-get/recipes"
			el-get-root-dir))

;;define core path of el-get
(setq el-get-core-path
      (expand-file-name "el-get"
			el-get-root-dir))

;;add el-get core path to load-path
(add-to-list 'load-path el-get-core-path)

;;settiing the $HOME/.emacs.d as the el-get user package
(setq el-get-user-package-directory user-emacs-directory)

;;initial el-get package
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

;;add default el-get recipes path
(add-to-list 'el-get-recipe-path el-get-recipes-path)

(setq el-get-sources
      '(
	(:name org-jekyll-mode
	       :type github
	       :pkgname "jsuper/org-jekyll-mode"
	       :branch "master"
	       :description "Publish org-mode files to jekyll blog post"
	       :load-path ("."))
	(:name web-mode
	       :type github
	       :pkgname "fxbois/web-mode"
	       :description "Emacs major mode for editing html templates"
	       :load-path ".")
    (:name solarized-emacs
           :type github
           :pkgname "bbatsov/solarized-emacs"
           :description "Solarized themes for Emacs"
           :prepare (add-to-list 'custom-theme-load-path default-directory))
	(:name enhanced-editor
	       :type github
	       :pkgname "jsuper/enhanced-editor"
	       :branch "master"
	       :description "Enhanced emacs editor for programmer"
	       :load-path (".")
	       :autoloads "enhanced-editor-setup")))

(setq my-packages
      (append
       '(el-get auto-complete yasnippet paredit 
		multiple-cursors solarized-emacs jedi 
		org-jekyll-mode org-mode enhanced-editor
		go-mode go-autocomplete expand-region
		zencoding-mode js2-mode web-mode
		)))

(defun --require (pkgname)
  (el-get-init pkgname))

;;sync packages
(el-get 'sync my-packages)

(provide 'init-elget)
