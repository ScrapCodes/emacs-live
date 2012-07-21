;; Shyam Colour Theme
;;
;;

(require 'color-theme)

;;;###autoload
(defun color-theme-shyam ()
  "Shyam"
  (interactive)
  (color-theme-install
   '(color-theme-shyam
     ((background-color . "#d9e2f1")
    ;  (background-mode . dark)
      (border-color . "black")
      (cursor-color . "#96CBFE")
      (foreground-color . "black")
      (mouse-color . "sienna1"))

     (default ((t (:background "#d9e2f1" :foreground "black"))))
     (blue ((t (:foreground "blue"))))
     (bold ((t (:bold t))))
     (bold-italic ((t (:bold t))))
     (border-glyph ((t (nil))))
     (buffers-tab ((t (:background "#0C1021" :foreground "#F8F8F8"))))

     (font-lock-builtin-face ((t (:foreground "#0c2946"))))
     (font-lock-comment-face ((t (:italic t :foreground "#8B8989"))))
     (font-lock-constant-face ((t (:foreground "#4c83ff"))))
     (font-lock-doc-string-face ((t (:foreground "DarkOrange"))))
     (font-lock-function-name-face ((t (:foreground "deep pink"))))
     (font-lock-keyword-face ((t (:foreground "#339966"))))
     (font-lock-preprocessor-face ((t (:foreground "gray57"))))
     (font-lock-reference-face ((t (:foreground "medium slate blue"))))
     (font-lock-reference-face ((t (:foreground "gray"))))
     (font-lock-regexp-grouping-backslash ((t (:foreground "#E9C062"))))
     (font-lock-regexp-grouping-construct ((t (:foreground "red"))))
     (font-lock-string-face ((t (:foreground "#471657"))))
     (font-lock-type-face ((t (:foreground "#123456"))))
     (font-lock-variable-name-face ((t (:foreground "#123456"))))
     (font-lock-warning-face ((t (:bold t :foreground "red4"))))

     (gui-element ((t (:background "#333333" :foreground "#96CBFE"))))
     (region ((t ( :background "#cac6ea"))))
     (mode-line ((t (:background "#344764" :foreground "white"))))
     (mode-line-inactive ((t (:background "grey" :foreground "gray30"))))
     (highlight ((t (:background "#c7688e"))))
     (isearch ((t (:background "deep pink" :foreground "black"))))
     (isearch-fail ((t (:background "red4"))))
     (lazy-highlight ((t (:background "deep pink" :foreground "black"))))
     (query-replace ((t (:background "#333333"))))

     (Highline-face ((t (:background "#7268c7" :foreground "black"))))
     (italic ((t (nil))))
     (left-margin ((t (nil))))
     (text-cursor ((t (:background "yellow" :foreground "black"))))
     (toolbar ((t (nil))))
     (underline ((nil (:underline nil))))
     (vertical-border ((t (:background "black" :foreground "#333333"))))
     (zmacs-region ((t (:background "snow" :foreground "ble"))))

     (diff-added ((t (:foreground "dark green"))))
     (diff-removed ((t (:foreground "red"))))

     (ido-first-match ((t (:foreground "deep pink"))))
     (ido-only-match ((t (:foreground "deep pink" ))))

     (eval-sexp-fu-flash ((t (:background "grey15" :foreground "DeepPink3"))))

     (ac-completion-face ((t (:foreground "darkgray" :underline t))))
     (ac-candidate-face ((t (:background "gray60" :foreground "black"))))
     (ac-selection-face ((t (:background "deep pink" :foreground "black"))))

     (popup-isearch-match ((t (:background "black" :foreground "deep pink"))))
     (popup-tip-face ((t (:background "#333333" :foreground "white"))))

     (popup-scroll-bar-foreground-face ((t (:background "#0A0A0A"))))
     (popup-scroll-bar-background-face ((t (:background "#333333"))))

     (window-number-face ((t (:background "grey10" :foreground "#4c83ff"))))

     (yas/field-highlight-face ((t (:background "deep pink" :foreground "black"))))

     (show-paren-match-face ((t (:background "deep pink" :foreground "black"))))

     (match ((t (:foreground "deep pink" :background "blackn"))))
     (minibuffer-prompt ((t (:foreground "black" :background "#d9e2f1"))))
     (grep-match-face ((t (:foreground "black" :background "deep pink"))))
     (grep-hit-face ((t (:foreground "black" :background "red"))))
     (grep-context-face ((t (:foreground "black" :background "deep pink"))))

     ;;rainbow-delimiters (
     (rainbow-delimiters-depth-1-face ((t (:foreground "dark red"))))
     (rainbow-delimiters-depth-2-face ((t (:foreground "dark green"))))
     (rainbow-delimiters-depth-3-face ((t (:foreground "deep pink"))))
     (rainbow-delimiters-depth-4-face ((t (:foreground "blue"))))
     (rainbow-delimiters-depth-5-face ((t (:foreground "slate blue"))))
     (rainbow-delimiters-depth-6-face ((t (:foreground "light blue"))))
     (rainbow-delimiters-depth-7-face ((t (:foreground "orange"))))
     (rainbow-delimiters-depth-8-face ((t (:foreground "slate blue"))))
     (rainbow-delimiters-depth-9-face ((t (:foreground "turquoise"))))
     (rainbow-delimiters-unmatched-face ((t (:foreground "red4"))))

     (vhl/default-face ((t (:background "#c9c9e8"))))
     (undo-tree-visualizer-active-branch-face ((t (:foreground "deep pink" :background "black"))))
     (hl-sexp-face ((t (:background "grey9")))))))



(custom-set-faces
;;nXhtml colours
 '(mumamo-background-chunk-submode1 ((((class color) (background dark)) (:background "black"))))
 '(mumamo-background-chunk-major ((((class color) (background dark)) (:background "black")))))
