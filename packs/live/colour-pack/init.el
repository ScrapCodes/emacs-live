(live-add-pack-lib "color-theme")
(require 'color-theme)

(global-hl-line-mode 1)
(set-face-background 'hl-line "#c6d4ea")

;; use blackbored colour theme
(load-file (concat (live-pack-lib-dir) "cyberpunk.el"))
(load-file (concat (live-pack-lib-dir) "gandalf.el"))
(load-file (concat (live-pack-lib-dir) "shyam.el"))


(color-theme-shyam)
;;(color-theme-gandalf)
