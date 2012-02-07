;;(add-to-list 'load-path "~/.emacs.d/el-get/el-get") 
;;(unless (require 'el-get nil t) 
;;  (with-current-buffer (url-retrieve-synchronously "https://raw.github.com/dimitri/el-get/master/el-get-install.el") (end-of-buffer) (eval-print-last-sexp))) (el-get 'sync)

;; Packages to auto-install
; Add in your own as you wish:
(defvar my-packages '(
    starter-kit 
    starter-kit-lisp 
    starter-kit-bindings
  )
  "A list of packages to ensure are installed at launch.")

;; Library Paths
;; Note: I like to keep every emacs library underneath
;;   ~/.emacs.d and I shun loading them from the system
;;   paths. This makes it easier to use this config on
;;   multiple systems.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
(add-to-list 'load-path "~/.emacs.d")
(message "Loading configuration from ~/.emacs.d/init.el")

;Add all top-level subdirectories of .emacs.d to the load path
  (let ((default-directory "~/.emacs.d/"))
    (normal-top-level-add-subdirs-to-load-path))

;Add vendor directory and subdirectories to load path
;;  (let ((default-directory "~/.emacs.d/vendor/"))
;;    (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'load-path "~/.emacs.d/vendor/emacs-color-theme-solarized")

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

;; Profiling function
(defun profile-load-library (lib)
  "times how long the load-library takes and logs it to the message buffer"
  (message "================================================================================\n == Loading %s" lib)
  (let ((t1 (float-time (current-time))))
    (load-library lib)
    (message " == Loaded %s: %0.3f seconds" lib (- (float-time (current-time)) t1)))
  (message "================================================================================"))


(require 'custom-keyboard)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(x-select-enable-clipboard t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
