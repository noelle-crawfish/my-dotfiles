(deftheme crawfish-mono
  "My custom theme for emacs.")

(defconst crawfish-mono-colors-alist
  '(
    ("black" . "#000000")
    ("white" . "#ffffff")

    ("gray-0" . "#212529")
    ("gray-1" . "#343a40")
    ("gray-3" . "#495057")
    ("gray-4" . "#6c757d")
    ("gray-5" . "#adb5db")
    ("gray-6" . "#ced4da")

    ("blue" . "#0000ff")
    ("green" . "#00ff00")
    ("pink" . "#ffc0cb")
    ("red" . "#ff0000")
  ;; "Custom colors for crawfish-mono theme."
  ))

(defmacro crawfish-mono-with-color-variables (&rest body)
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
	 ,@(mapcar (lambda (cons)
		     (list (intern (car cons)) (cdr cons)))
		   crawfish-mono-colors-alist))
     ,@body))

(crawfish-mono-with-color-variables
    (custom-theme-set-faces
    'crawfish-mono
    `(default ((t (:foreground ,white :background ,black))))

    ;; `(button ((t (:foreground ,blue :underline nil :weight normal))))
    ;; `(comint-highlight-input ((t (:foreground nil :background nil))))
    ;; `(comint-highlight-prompt ((t (:foreground nil :background nil))))
    ;; `(compilation-column-number ((t (:foreground nil :background nil))))
    ;; `(compilation-error ((t (:foreground nil :background nil))))
    ;; `(compilation-info ((t (:foreground nil :background nil))))
    ;; `(compilation-line-number ((t (:foreground nil :background nil))))
    ;; `(compilation-mode-line-exit ((t (:inherit mode-line))))
    ;; `(compilation-mode-line-fail ((t (:inherit mode-line))))
    ;; `(compilation-mode-line-run ((t (:inherit mode-line))))
    ;; `(compilation-warning ((t (:foreground nil :background nil))))
    `(cursor ((t (:foreground ,black :background ,white))))
    ;; `(default ((t (:foreground ,black :background ,white))))
    ;; `(fringe ((t (:foreground ,gray6 :background ,white))))
    ;; `(header-line ((t (:inherit mode-line))))
    ;; `(hi-yellow ((t (:foreground ,red :background ,nil))))
    ;; `(isearch ((t (:foreground nil :background ,gray6))))
    ;; `(isearch-fail ((t (:foreground nil :background ,orange))))
    ;; `(italic ((t (:foreground nil :background nil :underline nil))))
    ;; `(lazy-highlight ((t (:foreground nil :background ,gray6))))
    `(link ((t (:foreground nil :background nil :underline t :weight bold))))
    `(link-visited ((t (:foreground ,pink :background nil :underline t :weight bold))))
    ;; `(linum  ((t (:foreground ,gray5 :background ,white))))
    ;; `(match ((t (:foreground nil :background ,gray6))))
    ;; `(minibuffer-prompt ((t (:foreground ,red :background nil))))
    `(mode-line ((t (:foreground ,black :background ,gray-6 :box nil))))
    ;; `(mode-line-buffer-id ((t (:weight normal))))
    `(mode-line-inactive ((t (:foreground ,gray-5 :background ,gray-3 :box nil))))
    `(region ((t (:foreground ,black :background ,green)))) ;; highlighted region
    ;; `(secondary-selection ((t (:foreground nil :background ,gray6))))
    ;; `(trailing-whitespace ((t (:foreground nil :background ,red))))
    ;; `(underline ((t (:foreground nil :background nil :underline nil))))

    ;; font-lock faces (syntax highlighting)
    ;;`(font-lock-builtin-face ((t :foreground nil :background nil)))
    `(font-lock-comment-delimiter-face ((t (:foreground ,gray-4))))
    `(font-lock-comment-face ((t (:foreground ,gray-4))))
    `(font-lock-constant-face ((t :foreground ,red :background nil)))
    `(font-lock-doc-face ((t :foreground ,gray-4 :background nil )))
    `(font-lock-function-name-face ((t :foreground nil :background nil :weight bold))) ;; I think want to bold this
    `(font-lock-keyword-face ((t :foreground ,gray-6 :background nil)))
    ;; `(font-lock-negation-char-face ((t :foreground nil :background nil)))
    ;; `(font-lock-preprocessor-face ((t :foreground nil :background nil)))
    `(font-lock-regexp-grouping-backslash ((t :foreground nil :background ,pink)))
    `(font-lock-regexp-grouping-construct ((t :foreground nil :background ,red)))
    `(font-lock-string-face ((t :foreground ,pink :background nil)))
    `(font-lock-type-face ((t :foreground ,white :background ,gray-1))) ;; TODO figure out how to make italic
    `(font-lock-variable-name-face ((t :foreground ,green :background nil)))
    `(font-lock-warning-face ((t :foreground nil :background ,red)))

    ;; will add more as necessary

    )

    (setq hl-todo-keyword-faces
	  `(("TODO"   . ,green)
	    ("FIXME"  . ,blue)
	    ("DEBUG"  . ,pink)
	    ("GOTCHA" . ,green)
	    ("STUB"   . ,blue))
    )
)


(provide-theme 'crawfish-mono)
