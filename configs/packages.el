
;; index local packages
(add-to-list 'load-path (concat user-emacs-directory "pkg"))
(byte-recompile-directory (concat user-emacs-directory "pkg") 0)

;; package manager
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

;; garbage collector magic hack
;; via https://akrl.sdf.org
;; (use-package gcmh
  ;; :ensure nil)
;; (gcmh mode 0)

;; pdf-tools
(use-package pdf-tools)
(add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode))
    
;; consult for autocomplete (bc I want to be a cool kid)
;; (use-package consult)

;; and vertico
(use-package vertico
  :custom
  (vertico-count 20)
  :init
  (vertico-mode))

;; persist history over emacs restarts
(use-package savehist
  :init
  (savehist-mode))

;; general - TODO tf does this even do (other than keybindings ofc we <3 :prefix)
(use-package general)

;; hydra bc I cannot remember my own keybindings
(use-package hydra)

;; hl-TODO
(use-package hl-todo
  :init
  (global-hl-todo-mode))

;; perspectives (workspaces)
(use-package perspective
  :bind
  ("C-x C-b" . persp-list-buffers)         ; or use a nicer switcher, see below
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))  ; pick your own prefix key here
  :init
  (persp-mode))

;; vterm
(use-package vterm
  :custom
  (vterm-kill-buffer-on-exit t)
  (vterm-max-scrollback 5000))

(use-package vterm-toggle)

(add-hook 'vterm-mode-hook
	  (lambda ()
	    (setq mode-line-format nil)
	    (setq hscroll-margin 0)
	    (set-frame-parameter nil 'bottom-divider-width 1)
            (setq config-kill-processes nil)
            (add-to-list 'vterm-tramp-shells '("ssh" "/bin/zsh"))
            (add-to-list 'vterm-tramp-shells '("sudo" "/bin/zsh"))
            (add-to-list 'vterm-tramp-shells '("ssh" "/bin/zsh"))
            (add-to-list 'vterm-tramp-shells '("sudo" "/bin/zsh"))))

;; Enable Evil
(use-package evil
  :init
  ;; (setq evil-want-integration t)
  ;; (setq evil-want-keybinding nil)
  ;; (setq evil-want-C-i-jump t)
  (setq evil-undo-system 'undo-fu)
  :config
  (evil-mode 1))

;; undo-fu for undo persistance b/w sessions
(use-package undo-fu
  :config
  (global-unset-key (kbd "C-z"))
  (global-set-key (kbd "C-z")   'undo-fu-only-undo)
  (global-set-key (kbd "C-S-z") 'undo-fu-only-redo))

;; magit
(use-package magit)

