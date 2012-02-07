;;(add-to-list 'load-path "~/.emacs.d/el-get/el-get") 
;;(unless (require 'el-get nil t) 
;;  (with-current-buffer (url-retrieve-synchronously "https://raw.github.com/dimitri/el-get/master/el-get-install.el") (end-of-buffer) (eval-print-last-sexp))) (el-get 'sync)

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

(let ((old-pwd default-directory))

;Add all top-level subdirectories of .emacs.d to the load path
  (progn (cd "~/.emacs.d")
         (normal-top-level-add-subdirs-to-load-path))
;I like to keep third party libraries seperate in ~/.emacs.d/vendor
  (add-to-list 'load-path "~/.emacs.d/vendor")
  (progn (cd "~/.emacs.d/vendor")
         (normal-top-level-add-subdirs-to-load-path))
  (cd old-pwd))

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
