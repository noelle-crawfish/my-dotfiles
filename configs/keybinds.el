
;; vim-like cancellation
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; text zooooooom
(general-define-key
 "C--" 'text-scale-decrease
 "C-=" 'text-scale-increase)

;; window management
(defhydra win-map (:exit t :idle 5 :timeout 5 :hint nil)
  "
  ^_k_^     _c_lose     _=_ inc height   _\__ set height
_h_   _l_   _n_ew       _-_ dec height   _\|_  set width
  ^_j_^     _v_split    _>_ inc width
^^^^        ^ ^         _<_ dec height
"
  ("h" evil-window-left)
  ("j" evil-window-down)
  ("k" evil-window-up)
  ("l" evil-window-right)
  ("c" evil-window-delete)
  ("n" evil-window-split)
  ("v" evil-window-vsplit)
  ("H" window-move-left)
  ("J" window-move-down)
  ("K" window-move-up)
  ("L" window-move-right)
  (">" evil-window-increase-width  :exit nil)
  ("<" evil-window-decrease-width  :exit nil)
  ("=" evil-window-increase-height :exit nil)
  ("-" evil-window-decrease-height :exit nil)
  ("?" (setq hydra-is-helpful t)   :exit nil)
  ("_" evil-window-set-height)
  ("|" evil-window-set-width))

;; perspectives
(defhydra persp-map (:exit t :idle 5 :timeout 5 :hint nil)
  "And who cares? Divine intervention. I wanna be praised from a new perspective..."
  ("s" persp-switch)
  ("k" persp-kill)
  ("r" persp-rename)
  ("n" persp-next)
  ("p" persp-prev))

(defun open-config-dir ()
  "Open config directory"
  (interactive)
  (find-file "~/.config/emacs/configs/"))

(defun open-theme-dir ()
  "Open theme directory"
  (interactive)
  (find-file "~/.config/emacs/themes/"))

;; config file and help
(defhydra help-center (:exit t :idle 5 :timeout 5 :hint nil)
  ;; "THIS IS THE HELP CENTER -> I want a sane default"
  ("rr" load-config) ;; hrr hrr hrr :)
  ("rt" refresh-theme)
  ("fp" open-config-dir)
  ("ft" open-theme-dir)
  ("?" (setq hydra-is-helpful t) :exit nil))

;; magit commands
(defhydra magit-map (:exit t :idle 5 :timeout 5 :hint nil)
  ("g" magit-status :which-key "magit")
  ("b" magit-blame :which-key "whodunnit")
  ("i" vc-annotate :whick-key "investigate"))

;; search functionality
;; (defhydra search-map (:exit t :idle 5 :timeout 5 :hint nil)
;;   ;; something something search
;;   ("SPC" project-search)
;;   )

;; SPC is the ultimate leader-key
(general-create-definer leader-keys
  :states '(insert visual emacs normal)
  :keymaps 'override
  :prefix "SPC"
  :global-prefix "C-SPC")

(leader-keys
  ;; shortcuts for commonly used
  "f" '(project-search :which-key "project search")

  ;; magit
  "g" '(magit-map/body :which-key "magit")

  ;; help center + quick access to config files 
  "h" '(help-center/body :which-key "help and configs")

  ;; windowing and perspectives
  "w" '(win-map/body :which-key "window management")
  "TAB" '(persp-map/body :which-key "perspectives")

  ;; open -> TODO add agenda, org mode stuff, idk what else?
  "ot" '(vterm-toggle :which-key "term")
  "or" '(revert-buffer-quick :which-key "reload-buf")
)
