(live-add-pack-lib "scala-mode2")


(require 'scala-mode2)


(add-hook 'scala-mode-hook
          '(lambda ()
             (yas/minor-mode-on)))

