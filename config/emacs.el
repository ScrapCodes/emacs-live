;;My old emacs configuration. Replace it with yours!
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(ecb-options-version "2.40")
 '(inhibit-startup-screen t)
 '(org-directory "/home/prashant/work" t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;;Works only if emacs is ./configure --with-x-toolkit --with-xft
;;And http://www.emacswiki.org/cgi-bin/wiki/XftGnuEmacs for further instructions.
(set-default-font "DejaVu Sans Mono-9")

;;Added by Apurba
 ;; (setq default-frame-alist
 ;;       '((width . 160) (height . 100)
;;         (cursor-color . "black")
;;         (cursor-type . box)
;;         (foreground-color . "black")
;;         (background-color . "white")))
;;          (font . "-*-courier-normal-r-*--13-*-*-*-c-*-iso8859-1")))
;; (font . "-*-*-ariel-r-extended--*-*-*-*-p-60-iso8859-1")))



;(setq initial-frame-alist '((top . 10) (left . 30)))

;Terminal character set fix for linux
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(autoload 'dirtree "dirtree" "Add directory to tree view" t)
;;http://nullprogram.com/blog/2012/08/01/
(add-to-list 'file-name-handler-alist '("\\.class$" . javap-handler))

(defun javap-handler (op &rest args)
  "Handle .class files by putting the output of javap in the buffer."
  (cond
   ((eq op 'get-file-buffer)
    (let ((file (car args)))
      (with-current-buffer (create-file-buffer file)
        (call-process "javap" nil (current-buffer) nil "-verbose"
                      "-classpath" (file-name-directory file)
                      (file-name-sans-extension
                       (file-name-nondirectory file)))
        (setq buffer-file-name file)
        (setq buffer-read-only t)
        (set-buffer-modified-p nil)
        (goto-char (point-min))
        (java-mode)
        (current-buffer))))
   ((javap-handler-real op args))))

(defun javap-handler-real (operation args)
  "Run the real handler without the javap handler installed."
  (let ((inhibit-file-name-handlers
         (cons 'javap-handler
               (and (eq inhibit-file-name-operation operation)
                    inhibit-file-name-handlers)))
        (inhibit-file-name-operation operation))
    (apply operation args)))

(setq inhibit-startup-message   t)   ; Don't want any startup message
(setq make-backup-files         nil) ; Don't want any backup files
(setq auto-save-list-file-name  nil) ; Don't want any .saves files
(setq auto-save-default         nil) ; Don't want any auto saving

(setq search-highlight           t) ; Highlight search object
(setq query-replace-highlight    t) ; Highlight query object
(setq mouse-sel-retain-highlight t) ; Keep mouse high-lightening
(setq font-use-system-font t)       ;trying the system font

(global-set-key (kbd "C-z") 'undo)

(defvar LIMIT 1)
(defvar time 0)
(defvar mylist nil)

(defun time-now ()
   (car (cdr (current-time))))
;;list buffers
(defun bubble-buffer ()
   (interactive)
   (if (or (> (- (time-now) time) LIMIT) (null mylist))
       (progn (setq mylist (copy-alist (buffer-list)))
          (delq (get-buffer " *Minibuf-0*") mylist)
          (delq (get-buffer " *Minibuf-1*") mylist)))
   (bury-buffer (car mylist))
   (setq mylist (cdr mylist))
   (setq newtop (car mylist))
   (switch-to-buffer (car mylist))
   (setq rest (cdr (copy-alist mylist)))
   (while rest
     (bury-buffer (car rest))
     (setq rest (cdr rest)))
   (setq time (time-now)))

(global-set-key [f4] 'bubble-buffer)


(defun geosoft-kill-buffer ()
   ;; Kill default buffer without the extra emacs questions
   (interactive)
   (kill-buffer (buffer-name))
   (set-name))

(global-set-key [C-delete] 'geosoft-kill-buffer)

;;key for going to line
(global-set-key "\C-l" 'goto-line) ; [Ctrl]-[L]

;; makes the tool bar disappear
(tool-bar-mode 0)

;; Added to make indent 4 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)


;; Added to remove the menu bar
;; (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; make emacs use the clipboard
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)


(defun kill-all-dired-buffers()
      "Kill all dired buffers."
      (interactive)
      (save-excursion
        (let((count 0))
          (dolist(buffer (buffer-list))
            (set-buffer buffer)
            (when (equal major-mode 'dired-mode)
              (setq count (1+ count))
              (kill-buffer buffer)))
          (message "Killed %i dired buffer(s)." count ))))

(global-set-key (kbd "C-S-d") 'kill-all-dired-buffers)

;; Get the current filename
(defun show-current-filename()
  "Shows the current filename from buffer-file-truename added by AN"
  (interactive)
  (message "Filename is %s" buffer-file-truename)
)

(global-set-key "\M-\r" 'show-current-filename)

;; added for the nasty autosave and bakcup litter
;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

;; Reload file
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer t t)
  (ecb-rebuild-methods-buffer)
)
(global-set-key [f5] 'revert-buffer-no-confirm)


;; delete line no kill
(defun delete-line()
  (interactive)
  (delete-region (line-beginning-position) (line-end-position))
)
(global-set-key [C-S-delete] 'delete-line)

;; unbound c-/ from undo and bind it to comment-region
(global-unset-key (kbd "C-/"))

(global-set-key (kbd "C-/") 'comment-or-uncomment-region)

;; unbound c-t and bind it to eclipse like find type
;; (global-unset-key (kbd "C-t"))
;;(global-set-key (kbd "C-t") 'find-name-dired)
(setq project-directory "/home/prashant/work")

(defun custom-find-name-dired (pattern)
  "Open from specific dir"
  (interactive "s Pattern: ")
  ;;(message "directory is : %s " project-directory)
  (find-name-dired default-directory pattern)
)
(global-set-key (kbd "C-S-r") 'custom-find-name-dired)

;; goto last edited http://emacsworld.blogspot.com/2010/04/remembering-last-edited-location-in.html
(defun goto-last-edit-point ()
"Go to the last point where editing occurred."
(interactive)
(let ((undos buffer-undo-list))
(when (listp undos)
(while (and undos
(let ((pos (or (cdr-safe (car undos))
(car undos))))
(not (and (integerp pos)
(goto-char (abs pos))))))
(setq undos (cdr undos))))))

(global-set-key (kbd "C-q") 'goto-last-edit-point)

;; Added for org mode
(add-to-list 'auto-mode-alist '("\\.aporg\\'" . org-mode))
(global-set-key "\C-ca" 'org-agenda)
(setq org-log-done 'time)
(setq org-directory "/home/prashant/work")
(setq org-default-notes-file (concat org-directory "/Plan.aporg"))
(global-set-key "\C-cc" 'org-capture)
(setq org-agenda-files (concat org-directory "/agendafiles"))

;; Faster window switching
(global-set-key [M-left] 'windmove-left)          ; move to left windnow
(global-set-key [M-right] 'windmove-right)        ; move to right window
(global-set-key [M-up] 'windmove-up)              ; move to upper window
(global-set-key [M-down] 'windmove-down)          ; move to downer window

;; c-delete closes current file
;; Activating delete selection mode so delete would delete regions
(delete-selection-mode 1)
;; Start in full screen mode
(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))

;;(toggle-fullscreen)

;; Quicker way to get around perspective issues
(global-set-key [f8] 'frame-configuration-to-register)
(global-set-key [f9] 'jump-to-register)


(global-set-key "\C-o" 'ecb-goto-window-methods)

;;http://www.emacswiki.org/TextMate
(defun ido-find-file-in-tag-files ()
      (interactive)
      (save-excursion
        (let ((enable-recursive-minibuffers t)) (visit-tags-table-buffer))
        (find-file (expand-file-name
                    (ido-completing-read "Project file: "
                                         (tags-table-files) nil t)))))

;; AN adding class search
(defun custom-find-java-class(pattern)
    "Open class file"
    (interactive "s className ")
    ;; (find-tag-regexp (concat "class " pattern))
    (find-tag-regexp (concat (concat "\\(class\\|interface\\).*\\b" pattern) "\\b"  )  ))

(defun custom-find-scala-class(pattern)
    "Open class file"
    (interactive "s className ")
    ;; (find-tag-regexp (concat "class " pattern))
    (find-tag-regexp (concat (concat "\\(class\\|object\\|\\trait\\).*\\b" pattern) "\\b"  ) ))


(global-set-key (kbd "C-S-t") 'ido-find-file-in-tag-files)

(global-set-key [f6] 'ecb-minor-mode)

(server-start)

(global-set-key [M-left] 'windmove-left)          ; move to left windnow
(global-set-key [M-right] 'windmove-right)        ; move to right window
(global-set-key [M-up] 'windmove-up)              ; move to upper window
(global-set-key [M-down] 'windmove-down)          ; move to downer window

(setq exec-path (append exec-path (list "/home/prashant/sbt/bin" )))
