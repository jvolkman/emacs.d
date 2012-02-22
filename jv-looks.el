;; Color themes and such

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/vendor/emacs-color-theme-solarized/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/vendor/zenburn-emacs/")

;;(load-theme 'solarized-light t)
(load-theme 'zenburn t)

;; Provide a function to maximize the window, and exec it by default
(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
)
(toggle-fullscreen)

(provide 'jv-looks)
