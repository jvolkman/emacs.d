
;; Packages to auto-install
; Add in your own as you wish:
(defvar my-packages '(
    starter-kit 
    starter-kit-lisp 
    starter-kit-bindings
  )
  "A list of packages to ensure are installed at launch.")

;; Add Marmalade package source
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; Auto-install missing packages
(when (not package-archive-contents)
  (package-refresh-contents))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


(provide 'jv-packages)
