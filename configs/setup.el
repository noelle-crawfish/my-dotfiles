
(setq inhibit-startup-message t)
(setq auto-revert-verbose nil)
(setq ring-bell-function 'ignore)

(scroll-bar-mode -1) ;; no scrollbar
(tool-bar-mode -1) ;; no toolbar
(tooltip-mode -1) ;; no tooltips

(menu-bar-mode -1) ;; no menu bar

;; line numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; whoami
(setq user-full-name "Noelle Crawford"
      user-mail-address "noellecrawfish@gmail.com")

;; org mode
(setq org-directory "~/org/")


;; theme-dir and theme 
(add-to-list 'custom-theme-load-path "~/.config/emacs/themes/")
(load-theme 'crawfish-mono :no-confirm)

;; turn off blinking cursor
(setq blink-cursor-mode nil)

;; tree-sitter grammars
(setq treesit-language-source-alist
      '((bash     . ("https://github.com/tree-sitter/tree-sitter-bash"))
        (c        . ("https://github.com/tree-sitter/tree-sitter-c"))
        (cpp      . ("https://github.com/tree-sitter/tree-sitter-cpp"))
        (python   . ("https://github.com/tree-sitter/tree-sitter-python"))
        (rust     . ("https://github.com/tree-sitter/tree-sitter-rust"))
        (tcl      . ("https://github.com/tree-sitter-grammars/tree-sitter-tcl"))
        (verilog  . ("https://github.com/gmlarumbe/tree-sitter-systemverilog"))))

(dolist (lang treesit-language-source-alist)
  (when (not (treesit-language-available-p (car lang)))
    (treesit-install-language-grammar (car lang))))

;; TODO let's see if I even need this??
(let ((new-major-mode-remap-alist
       '((bash-mode       . bash-ts-mode)
         (c-mode          . c-ts-mode)
         (c++-mode        . c++-ts-mode)
         (python-mode     . python-ts-mode)
         (rust-mode       . rust-ts-mode)
         (tcl-mode        . tcl-ts-mode)
         (verilog-mode    . verilog-ts-mode))))
  (dolist (mode new-major-mode-remap-alist)
    (add-to-list 'major-mode-remap-alist mode)))

