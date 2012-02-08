;; Color themes and such
(require 'color-theme)

(require 'color-theme-solarized)
(color-theme-solarized-light)

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
