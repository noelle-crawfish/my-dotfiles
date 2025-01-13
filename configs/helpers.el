
(defun refresh-theme ()
  "Refresh crawfish-mono theme."
  (interactive)
  (load-theme 'crawfish-mono :no-confirm))

(defun load-config ()
  "Load config file from anywhere"
  (interactive)
  (load-file user-init-file))

;; stolen from doom emacs (hlissner ily)
(defun window-swap (direction)
  "Move current window to the next window in DIRECTION.
If there are no windows there and there is only one window, split in that
direction and place this window there. If there are no windows and this isn't
the only window, use evil-window-move-* (e.g. `evil-window-move-far-left')."
  (when (window-dedicated-p)
    (user-error "Cannot swap a dedicated window"))
  (let* ((this-window (selected-window))
	       (this-buffer (current-buffer))
	       (that-window (windmove-find-other-window direction nil this-window))
	       (that-buffer (window-buffer that-window)))
    (when (or (minibufferp that-buffer)
	            (window-dedicated-p this-window))
      (setq that-buffer nil that-window nil))
    (if (not (or that-window (one-window-p t)))
	      (funcall (pcase direction
		               ('left  #'evil-window-move-far-left)
		               ('right #'evil-window-move-far-right)
		               ('up    #'evil-window-move-very-top)
		               ('down  #'evil-window-move-very-bottom)))
      (unless that-window
	      (setq that-window
	            (split-window this-window nil
			                      (pcase direction
			                        ('up 'above)
			                        ('down 'below)
			                        (_ direction))))
	      (with-selected-window that-window
	        (switch-to-buffer (doom-fallback-buffer)))
	      (setq that-buffer (window-buffer that-window)))
      (window-swap-states this-window that-window)
      (select-window that-window))))

(defun window-move-left ()
  "Swap windows to the left."
  (interactive) (window-swap 'left))
(defun window-move-right ()
  "Swap windows to the right"
  (interactive) (window-swap 'right))
(defun window-move-up ()
  "Swap windows upward."
  (interactive) (window-swap 'up))
(defun window-move-down ()
  "Swap windows downward."
  (interactive) (window-swap 'down))

;; vterm-toggle force to create a new buffer + popup at bottom
(setq vterm-toggle-fullscreen-p nil)
(add-to-list 'display-buffer-alist
             '((lambda (buffer-or-name _)
                   (let ((buffer (get-buffer buffer-or-name)))
                     (with-current-buffer buffer
                       (or (equal major-mode 'vterm-mode)
                           (string-prefix-p vterm-buffer-name (buffer-name buffer))))))
                (display-buffer-reuse-window display-buffer-at-bottom)
                ;;(display-buffer-reuse-window display-buffer-in-direction)
                ;;display-buffer-in-direction/direction/dedicated is added in emacs27
                ;;(direction . bottom)
                ;;(dedicated . t) ;dedicated is supported in emacs27
                (reusable-frames . visible)
                (window-height . 0.3)))
