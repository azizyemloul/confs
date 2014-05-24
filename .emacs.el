;; * ENCODING
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; * P@THS & REQUIRES
(require 'ffap)
(require 'cl)
(require 'calc)
(require 'desktop)
(require 'saveplace)
;; (require 'multi-term)

(add-to-list 'load-path "~/.emacs.d/uniq/")
(require 'mplayer-mode)
(require 'gnus-notify)
(require 'edit-server)
(require 'sunrise-commander)
(require 'outlined-zall-mode)

(package-initialize)
(require 'outlined-elisp-mode)
(require 'langtool)
(require 'w3m)
(require 'w3m-session)
(require 'sr-speedbar)
(require 'dired-details+)
(require 'dired+)
(require 'calfw-gcal)
(require 'calfw)
(require 'fold-this)
(require 'hide-lines)
(require 'file-props)
(require 'helm-config)

(file-props-dired-activate-display)
(file-props-dired-setup-keybindings)

(load-library	"savehist")
(load-library	"iso-transl")
(load-library	"org-clock")
(autoload	'volume "volume" "Tweak your sound card volume." t)

(fset 'yes-or-no-p 'y-or-n-p)
(icomplete-mode)
(ffap-bindings)
(edit-server-start)


(helm-mode		1)
(recentf-mode		1)
(delete-selection-mode	1)
(tool-bar-mode		0)
(menu-bar-mode		0)
(savehist-mode		1)
(desktop-save-mode      1)

(server-mode)
(if (not (server-running-p))  (server-start))
(eshell)

;; * VARIABLES

(add-to-list 'auto-mode-alist		'("\\.docx$"	. docx2txt))
(add-to-list 'auto-mode-alist		'("\\.org$"	. org-mode))

(setq blink-cursor-mode			t)
(setq calendar-date-display-form	'(dayname " " day " " monthname " " year))
(setq column-number-mode		t)
(setq completion-auto-help		'lazy)
(setq custom-file			"~/.emacs-custom.el")
(setq default-buffer-file-coding-system 'utf-8)
(setq default-file-name-coding-system	'utf-8)
(setq default-major-mode		'org-mode)
(setq dired-recursive-copies		'always)
(setq dired-recursive-deletes		'always)
(setq display-time-format		"%a %d %b %H:%M")
(setq edit-server-default-major-mode	'org-mode)
(setq enable-recursive-minibuffers	t)
(setq gc-cons-threshold			3500000)
(setq langtool-language-tool-jar	"~/bin/langtool/languagetool-commandline.jar")
(setq langtool-mother-tongue		"fr")
(setq message-default-headers		"Bcc: azizyemloul@gmail.com\n")
(setq org-agenda-include-diary		nil)
(setq org-agenda-start-with-follow-mode nil)
(setq org-agenda-window-setup		'current-window)
(setq org-completion-use-iswitchb	t)
(setq org-link-mailto-program		(quote (compose-mail "%a" "%s")))
(setq org-log-done			t)
(setq org-mime-library			'mml)
(setq org-return-follows-link		t)
(setq org-src-fontify-natively		t)
(setq org-tab-follows-link		t)
(setq package-enable-at-startup		t)
(setq password-cache-expiry		nil)
(setq read-file-name-completion-ignore-case t)
(setq size-indication-mode		t)
(setq time-stamp-active			t)
(setq tramp-default-method		"ssh")
(setq use-dialog-box			nil)
(setq view-read-only			t)
(setq w3m-default-save-directory	"~/.w3m")
(setq w3m-session-file			"~/.emacs.d/w3m-session")
(setq w3m-session-save-always		t)
(setq w3m-session-load-always		nil)
(setq w3m-session-show-titles		t)
(setq w3m-session-duplicate-tabs	'never)
(setq ffap-url-fetcher			'w3m-browse-url)
(setq dired-dwim-target			t)
(setq gmail-credential-file		"~/.emacs.d/credential.el")

(setq-default
	dired-omit-mode			t
	dired-omit-files			"^\\.?#\\|^\\.$\\|^\\.\\.$\\|^\\."
	frame-title-format		'(buffer-file-name "%b (%f)" "%b")
	indicate-empty-lines		t
	)

(load custom-file)
(load gmail-credential-file)
;(load "~/.emacs-aziz.el")

(setq org-publish-project-alist
      '(
        ("memoire"
         :base-directory "~/org/"
         :base-extention "org"
         :publishing-directory "~/public_html/"
         :recursive t
         :publishing-function org-html-publish-to-html
	 :exclude "^archive.org\\|^ateliers\\|^audio\\|^backup\\|^clients.org\\|^configurations.org\\|^diary.org\\|^facturation\\|^francais.org\\|^livraison\\|^notes.org\\|^projet.org\\|^retrans.org\\|^utils.org"
	 )
        ("pieces"
         :base-directory "~/org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|html\\|php\\|pdf\\|mp4"
	 :exclude "^archive.org\\|^ateliers\\|^audio\\|^backup\\|^clients.org\\|^configurations.org\\|^diary.org\\|^facturation\\|^francais.org\\|^livraison\\|^notes.org\\|^projet.org\\|^retrans.org\\|^utils.org"
         :publishing-directory "~/public_html/"
         :recursive t
         :publishing-function org-publish-attachment)
        ("a" :components ("memoire" "pieces"))
        ))

(setq backup-by-copying       t
      backup-directory-alist  '(("." . "~/.saves"))
      delete-old-versions     t
      kept-new-versions       6
      kept-old-versions       2
      version-control         t)


(setq view-diary-entries-initially	t
      mark-diary-entries-in-calendar	t
      number-of-diary-entries		7)

(setq org-todo-keyword-faces
      '(
	("TODO" . (:foreground "yellow" :background "red" :weight bold))
	("PROC" . (:foreground "yellow" :background "blue" :weight bold))
	("DONE" . (:foreground "yellow" :background "green" :weight bold))
	("CLOS" . (:foreground "yellow" :background "black" :weight bold))))



(put 'dired-find-alternate-file 'disabled nil)
;; * HOOKS

(add-hook 'message-mode-hook			'(lambda () (local-set-key (kbd "C-c M-o") 'org-mime-htmlize)) 'append)
(add-hook 'message-mode-hook			(lambda () (local-set-key "\C-c\M-o" 'org-mime-htmlize)))
(add-hook 'org-agenda-mode-hook			'(lambda () (hl-line-mode 1)) 'append)
(add-hook 'org-agenda-mode-hook			(lambda () (define-key org-agenda-mode-map "q" 'bury-buffer)) 'append)
(add-hook 'org-mode-hook			(lambda () (local-set-key "\C-c\M-o" 'org-mime-org-buffer-htmlize)))
(add-hook 'w3m-display-hook			(lambda (url) (let ((buffer-read-only nil)) (delete-trailing-whitespace))))


;;(add-hook 'before-save-hook			'delete-trailing-whitespace)
(add-hook 'diary-display-hook			'fancy-diary-display)
(add-hook 'dired-mode-hook			'turn-on-gnus-dired-mode)
(add-hook 'emacs-lisp-mode-hook			'outlined-elisp-find-file-hook)
(add-hook 'awk-mode-hook			'outlined-zall-find-file-hook)
(add-hook 'outlined-elisp-find-file-hook	'outline-mode-map)

;(add-hook 'message-mode-hook			'bbdb-define-all-aliases 'append)
(add-hook 'message-mode-hook			'orgstruct++-mode 'append)
(add-hook 'message-mode-hook			'orgtbl-mode 'append)
(add-hook 'message-mode-hook			'turn-on-flyspell 'append)

(add-hook 'org-after-todo-statistics-hook	'org-summary-todo)
(add-hook 'org-mode-hook			'abbrev-mode)
(add-hook 'today-visible-calendar-hook		'calendar-mark-today)
(add-hook 'w3m-mode-hook			'w3m-add-keys)


;; * FONCTIONS
;; ** Replace in rectangle
;; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

(require 'rect)

(defun my-search-replace-in-rectangle
  (start end search-pattern replacement search-function literal)
  "Replace all instances of SEARCH-PATTERN (as found by SEARCH-FUNCTION)
              with REPLACEMENT, in each line of the rectangle established by the START
              and END buffer positions.

              SEARCH-FUNCTION should take the same BOUND and NOERROR arguments as
              `search-forward' and `re-search-forward'.

              The LITERAL argument is passed to `replace-match' during replacement.

              If `case-replace' is nil, do not alter case of replacement text."
  (apply-on-rectangle
   (lambda (start-col end-col search-function search-pattern replacement)
     (move-to-column start-col)
     (let ((bound (min (+ (point) (- end-col start-col))
		       (line-end-position)))
	   (fixedcase (not case-replace)))
       (while (funcall search-function search-pattern bound t)
	 (replace-match replacement fixedcase literal))))
   start end search-function search-pattern replacement))

(defun my-replace-regexp-rectangle-read-args (regexp-flag)
  "Interactively read arguments for `my-replace-regexp-rectangle'
              or `my-replace-string-rectangle' (depending upon REGEXP-FLAG)."
  (let ((args (query-replace-read-args
	       (concat "Replace"
		       (if current-prefix-arg " word" "")
		       (if regexp-flag " regexp" " string"))
	       regexp-flag)))
    (list (region-beginning) (region-end)
	  (nth 0 args) (nth 1 args) (nth 2 args))))

(defun my-replace-regexp-rectangle
  (start end regexp to-string &optional delimited)
  "Perform a regexp search and replace on each line of a rectangle
              established by START and END (interactively, the marked region),
              similar to `replace-regexp'.

              Optional arg DELIMITED (prefix arg if interactive), if non-nil, means
              replace only matches surrounded by word boundaries.

              If `case-replace' is nil, do not alter case of replacement text."
  (interactive (my-replace-regexp-rectangle-read-args t))
  (when delimited
    (setq regexp (concat "\\b" regexp "\\b")))
  (my-search-replace-in-rectangle
   start end regexp to-string 're-search-forward nil))

(defun my-replace-string-rectangle
  (start end from-string to-string &optional delimited)
  "Perform a string search and replace on each line of a rectangle
              established by START and END (interactively, the marked region),
              similar to `replace-string'.

              Optional arg DELIMITED (prefix arg if interactive), if non-nil, means
              replace only matches surrounded by word boundaries.

              If `case-replace' is nil, do not alter case of replacement text."
  (interactive (my-replace-regexp-rectangle-read-args nil))
  (let ((search-function 'search-forward))
    (when delimited
      (setq search-function 're-search-forward
	    from-string (concat "\\b" (regexp-quote from-string) "\\b")))
    (my-search-replace-in-rectangle
     start end from-string to-string search-function t)))

(global-set-key (kbd "C-x r M-%") 'my-replace-string-rectangle)
(global-set-key (kbd "C-x r C-M-%") 'my-replace-regexp-rectangle)

;; ** MPLAYER-MODE
;; *** defvar mplayer-timestamp-format
(defvar mplayer-timestamp-format "\n- %H:%M:%S :: " "Format used for inserting timestamps.")
;; *** mplayer-master
(defun mplayer-master()
  (interactive)
  (goto-char (point-min))
  (if (eq (re-search-forward "^- [0-9]\\{0,2\\}:\\{0,1\\}[0-9]\\{0,2\\}:\\{0,1\\}[0-9]\\{1,2\\} ::" nil t) 'nil)
      (call-interactively 'mplayer-go-ahead nil)

    (progn
      (goto-char (point-min))
      (mplayer-inteligent-resume)

      )))

;; *** mplayer-go-ahead
(defun  mplayer-go-ahead(audio)
  (interactive "FFichier Audio à lire: ")
  (goto-char (point-max))
  (insert "* " (file-name-sans-extension (file-name-nondirectory audio)))
  (org-entry-put nil "MEDIAS" (file-name-nondirectory audio))
  (org-entry-put nil "CHEMIN" (file-name-directory (expand-file-name audio)))
  (mplayer-mode 1)
  (mplayer-find-file (expand-file-name audio))
  ;;(mplayer-insert-timelenght)
  (goto-char (point-max))
  (insert "\n** Intro\n")
  (org-clock-in)
  (goto-char (point-max))
  )

;; *** mplayer-resume
(defun mplayer-resume()
  (mplayer-mode 1)
  (setq
   audio-file (concat (org-entry-get nil "CHEMIN") (org-entry-get nil "MEDIAS"))
   this-buffer (buffer-name))
  (mplayer-find-file audio-file)
  (switch-to-buffer-other-window mplayer-process-buffer)
  (switch-to-buffer-other-window this-buffer)
  (goto-char (point-max))
  (search-backward-regexp "^- \\([0-9]\\{0,2\\}:\\{0,1\\}[0-9]\\{0,2\\}:\\{0,1\\}[0-9]\\{1,2\\}\\) ::")
  (aziz-mplayer-seek-position-at-point))

;; *** mplayer-insert-lenght
(defun mplayer-insert-lenght ()
  "Insert a time-stamp of the current recording position in the
buffer.  See `mplayer-timestamp-format' for the insertion
format."
  (interactive)
  (let (time)
    (set-process-filter
     mplayer-process
     ;; wait for output, process, and remove filter:
     (lambda (process output)
       (message "process: %s output: %s" process output)
       (string-match "^ANS_LENGTH=\\(.*\\)$" output)
       (setq time (match-string 1 output))
       (if time
	   (org-entry-put nil "Effort" (aziz--format-time time))
	 ;; (org-entry-put nil "DUREE" (file-name-nondirectory audio))
	 ;;     (insert (aziz--format-time time))
	 (message "MPlayer: couldn't detect current time."))
       (set-process-filter mplayer-process nil)))
    ;; Then send the command:
    (mplayer--send "get_time_length")))

;; *** mplayer-inteligent-resume
(defun mplayer-inteligent-resume()
  (interactive)
  (if (eq (org-clocking-p) 'nil)
      (progn (mplayer-resume) (org-clock-in))
    (progn (mplayer-resume) (message "Attention"))))


;; *** mplayer-inteligent-insert-timestamp
(defun mplayer-inteligent-insert-timestamp()
  (interactive)
  (if (eq (org-clocking-p) 'nil)
      (progn (org-clock-in) (goto-char (point-max)) (mplayer-insert-timestamp))
    (mplayer-insert-timestamp)))




;; *** aziz-mplayer-seek-position-at-point
(defun aziz-mplayer-seek-position-at-point()
  "Commentaire"
  (interactive)
  (search-forward-regexp "^- \\([0-9]\\{0,2\\}:\\{0,1\\}[0-9]\\{0,2\\}:\\{0,1\\}[0-9]\\{1,2\\}\\) ::")
  (mplayer-seek-position (org-time-string-to-seconds (match-string 1))))
(define-key mplayer-mode-map (kbd "\\") 'aziz-mplayer-seek-position-at-point)

(defvar aziz-timestamp-format "%H:%M:%S"
  "Format used for inserting timestamps.")

;; *** aziz--format-time
(defun aziz--format-time (time)
  "Return a formatted time string, using the format string
`mplayer-timestamp-format'.  The argument is in seconds, and
can be an integer or a string."
  (message "format-time: %s" time)
  (if (stringp time)
      (setq time (round (string-to-number time))))
  (message "time to format: %s" time)
  (format-time-string aziz-timestamp-format `(0 ,time 0) t))

;; ** PDN
;; *** insert-time
(defun insert-time ()
  "Insert date at point."
  (interactive)
  (insert (format-time-string "\n- %H:%M:%S :: ")))


;; *** Aziz-timer-item
(defun aziz-timer-item (&optional arg)
  "Insert a description-type item with the current timer value."
  (interactive "P")
  (let ((ind 0))
    (save-excursion
      (skip-chars-backward " \n\t")
      (condition-case nil
	  (progn
	    (org-beginning-of-item)
	    (setq ind (org-get-indentation)))
	(error nil)))
    (or (bolp) (newline))
    (org-indent-line-to ind)
    (insert "- ")
    (org-timer (if arg '(4)))
    (insert ":: ")))

;; *** correction
(defun correction()
  "Replace “<” to “&lt;” and some other chars in HTML.
This works on the current region."
  (interactive)
  ;;***********************************************;;
;;;            mise en forme                    ;;;
  ;;***********************************************;;
  (goto-char (point-min))
  (replace-regexp "^- \\([0-9][0-9]:\\)" "+ \\1")
  (goto-char (point-min))
  (while (search-forward "@" nil t) (replace-match "~" nil t))
  (goto-char (point-min))
  (while (search-forward "²" nil t) (replace-match "~" nil t))
  (goto-char (point-min))
  (while (search-forward "&&" nil t) (replace-match "~" nil t))
  (goto-char (point-min))
  (while (search-forward "&" nil t) (replace-match "\n" nil t))
  (goto-char (point-min))
  (while (search-forward "~" nil t) (replace-match "&" nil t))
  (goto-char (point-min))
  (while (search-forward "&" nil t) (replace-match "\n&" nil t))
  (goto-char (point-min))
  (while (search-forward " é " nil t) (replace-match "\né " nil t))
  (goto-char (point-min))
  (while (search-forward " \" " nil t) (replace-match "\n\" " nil t))
  (goto-char (point-min))
  (while (search-forward " ' " nil t) (replace-match "\n' " nil t))
  (goto-char (point-min))
  (while (search-forward " ( " nil t) (replace-match "\n( " nil t))
  (goto-char (point-min))
  (while (search-forward " - " nil t) (replace-match "\n- " nil t))
  (goto-char (point-min))
  (while (search-forward " è " nil t) (replace-match "\nè " nil t))
  (goto-char (point-min))
  (while (search-forward " _ " nil t) (replace-match "\n_ " nil t))
  (goto-char (point-min))
  (while (search-forward "=" nil t) (replace-match "\n=" nil t))
  (goto-char (point-min))
  (while (re-search-forward "  *$" nil t) (replace-match "" nil t))
  (goto-char (point-min))
  (while (re-search-forward "^  *" nil t) (replace-match "" nil t))
  (goto-char (point-min))
  (flush-lines  "^$")
  (goto-char (point-min))
  (while (search-forward "=" nil t) (replace-match "\n=" nil t))
  (goto-char (point-min))
  (while (search-forward "^+" nil t) (replace-match "\n+" nil t))
  (goto-char (point-min))
  (replace-regexp "^=\\(.*\\)$" "
- \\1 ?")
  (goto-char (point-min))
  (replace-regexp "^+\\(.*\\)$" "
- \\1 ?")
  (goto-char (point-min))
  (while (re-search-forward "^  *" nil t) (replace-match "" nil t))
  (goto-char (point-min))
  (replace-regexp ";" ".")
  (goto-char (point-min))
  (replace-regexp " *\\." ".")
  (goto-char (point-min))
  (replace-regexp "^\\([^*].*\\)\\([^?\n]\\)$" "\\1\\2.")
  (goto-char (point-min))
  (replace-regexp " *," ",")
  (goto-char (point-min))
  (replace-regexp "  *" " ")
  (goto-char (point-min))
  (replace-regexp "^- \\([0-9][0-9]:\\)" "+ \\1")
  (goto-char (point-min))
  (replace-regexp "^\\([0-9]\\)$" "\\1.")
  (goto-char (point-min))
  (replace-regexp " \\?$" " ?")
  (goto-char (point-min))
  (nommer)
					;(collection)
  )


;; *** nommer
(defun nommer()
  "give names"
  (interactive)
  (setq splitPos 0) ;; cursor position of split, for each line
  (setq code_participant '("^& " "^é " "^\" " "^\' " "^\( " "^- " "^è " "_ "))
  (while code_participant
    (while  (re-search-forward (car code_participant) nil t)
      (setq splitPos (point))
      (re-search-forward "\\(\\w+\\)")
      (setq nom_participant (buffer-substring-no-properties (point) splitPos))
      (goto-char 1)
      (replace-regexp (car code_participant) (concat nom_participant " : "))
      (goto-char 1))
    (setq code_participant (cdr code_participant))
    )
  (goto-char (point-min))
  (replace-regexp "^+ \\([0-9][0-9]:\\)" "- \\1")
  (goto-char (point-min))
  )


;; *** ferd
(defun ferd()
  (interactive)
  (save-excursion
;    (goto-char (point-min))
    (if (string= (org-entry-get nil "TIMESTAMP") "nil")
        (if (string= (org-entry-get nil "SCHEDULED") "nil")
            (setq jour ""
		  fauxjour (format-time-string "%m-%Y"))
          (setq
	   jour (format-time-string "%d-%m-%Y" (apply 'encode-time (org-parse-time-string (org-entry-get nil "SCHEDULED"))))
	   fauxjour (format-time-string "%m-%Y")
	   ))
      (setq
       jour (format-time-string "%d-%m-%Y" (apply 'encode-time (org-parse-time-string (org-entry-get nil "TIMESTAMP"))))
       fauxjour (format-time-string "%m-%Y"))
      )
    (if (string= (org-entry-get nil "TAGS") "nil")
        (setq tagg "")
      (setq tagg (upcase (substring (org-entry-get nil "TAGS") 1 -1))))
    (org-todo 'none)
 ;   (goto-char (point-min))
    (beginning-of-line)
    (if	(eq (re-search-forward "\\(\\*\\)\\(.*\\)\\([0-9]\\{2\\}:[0-9]\\{2\\}-[0-9]\\{2\\}:[0-9]\\{2\\}\\)\\(.*\\)$" nil t) nil)
        (setq horaire "")
      ;;  (re-search-forward "\\(\\*\\)\\(.*\\)\\([0-9]\\{2\\}:[0-9]\\{2\\}-[0-9]\\{2\\}:[0-9]\\{2\\}\\)\\(.*\\)$" nil nil)
      (setq horaire (match-string 3)))
    (setq
     heureh (replace-regexp-in-string ":" "h" horaire)
     header (buffer-substring-no-properties (line-beginning-position) (line-end-position))
     headlist (split-string header "\t\\| " t)
     tree (org-entry-properties nil 'special)
     headlist (cdr headlist) ;; enlever l'étoile
     headlist (delete (cdr (assoc "TAGS" tree)) headlist) ;; enlever :tagg:
     headlist (delete horaire headlist) ;; enlever l'horaire
     etudelist (format "%s" headlist);; retourne le titre sans :tagg: sans horaire et sans jour
     etude (substring etudelist 1 -1)
     entete nil
     checklist (reverse (list tagg jour heureh etude)))
    (while checklist
      (if (string= (car checklist) "")
	  (message "blind")
	(setq entete (cons (car checklist) entete)))
      (setq checklist (cdr checklist)))
    (setq entete (substring (format "%s" entete) 1 -1))
    ;;    (setq entete (concat tagg " " jour " " heureh " " etude))
    (setq
     nom_de_fichier (concat entete ".org")
     path-atelier-courant (concat "~/org/ateliers/" fauxjour "/")
     location_fichier (concat path-atelier-courant nom_de_fichier)
     lien_fichier (concat "[[file://" location_fichier "][" nom_de_fichier "]]")
     )
    (org-todo)
    (org-todo)
    (org-entry-put nil "LINK" lien_fichier)
    (if (file-exists-p path-atelier-courant)
	(find-file-noselect location_fichier)
      (progn
	(make-directory path-atelier-courant)
	(find-file-noselect location_fichier)))
    (if    (re-search-forward "\\*\\* Intro" (point-max) t)
	(progn
	  (setq intro (line-beginning-position))
	  (append-to-buffer nom_de_fichier  intro (point-max))))
    ;; (re-search-forward "\\*\\* Intro")
    ;; (setq intro (line-beginning-position))
    ;; (append-to-buffer nom_de_fichier  intro (point-max))
    (switch-to-buffer nom_de_fichier)
    (goto-char 0)
    (insert (concat "* " entete "\n"))
    ))

(defun capitales()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "^\\(\\w\\)" nil t)
      (replace-match (capitalize (match-string 1))))

    (goto-char (point-min))
    (while (re-search-forward ":: \\(\\w\\)" nil t)
      (replace-match (concat ":: " (capitalize (match-string 1)))))

    (goto-char (point-min))
    (while (re-search-forward "^- \\(\\w\\)" nil t)
      (replace-match (concat "- " (capitalize (match-string 1)))))

    (goto-char (point-min))
    (while (re-search-forward " : \\(\\w\\)" nil t)
      (replace-match (concat " : " (capitalize (match-string 1)))))

    (goto-char (point-min))
    (while (re-search-forward "\\. \\(\\w\\)\\(\\w+\\)" nil t)
      (replace-match (concat ". " (capitalize (match-string 1)) (match-string 2))))

    (goto-char (point-min))
    (while (re-search-forward "^\\(\\**\\) \\(\\w\\)\\(\\w+\\)" nil t)
      (replace-match (concat (match-string 1) " " (capitalize (match-string 2)) (match-string 3))))

    (goto-char (point-min))
    (while (re-search-forward "! \\(\\w\\)" nil t)
      (replace-match (concat "! " (capitalize (match-string 1)))))

    (goto-char (point-min))
    (while (re-search-forward "\\? \\(\\w\\)" nil t)
      (replace-match (concat "? " (capitalize (match-string 1)))))

    (goto-char (point-min))
    )
  )

;; (fset 'capitales
;;       (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("<xreplace-regexp^.\\,(capitalize &)<xreplace-regexp: \\(\\w\\): \\,(capitalize \\1)<xreplace-regexp\\. \\(\\w\\)\\(\\w+\\). \\,(capitalize \\1)\\2<xreplace-regexp^\\(\\**\\) \\(\\w\\)\\(\\w+\\)\\1 \\,(capitalize \\2)\\3<xreplace-regexp- \\(\\w\\)- \\,(capitalize \\1)<" 0 "%d")) arg)))

;; (defun capitales()
;;   (interactive)
;;   (save-excursion
;;     (goto-char (point-min))
;;     (replace-regexp "^." ,(capitalize $)))

;; (substring "lo'la" (+ 1 (string-match "'" "lo'la")))
;; (substring "lo'la" 0 (string-match "'" "lo'la"))

;; (defun translate()
;;   (interactive)
;;   (setq bomba (split-string (buffer-substring-no-properties (point-min) (point-max))  )
;; 	trad '())
;;   (while bomba
;;     (setq current (pop bomba))
;;     (if ((string-match "'" current))
;; 	(progn
;; 	  (setq
;; 	   avantapos (substring current (string-match "'" current))
;; 	   current (substring current (+ 1 (string-match "'" current)))
;; 	   )

;; 	  )

;;       )
;;     (find-file "/home/azyvers/dict-france/Atelier/nude.txt")
;;     (goto-char (point-min))
;;     (if (not (re-search-forward (concat "^" current "|") nil t))
;; 	(setq trad "NOVAL")
;;       (progn
;; 	(goto-char (point-min))
;; 	(goto-char (re-search-forward (concat "^" current "|") nil t))
;; 	(setq begin (point))
;; 	(end-of-line)
;; 	(backward-char)
;; 	(setq end (point))
;; 	(setq trad (buffer-substring-no-properties begin end))))
;;     (with-current-buffer "*scratch*"
;;       (insert (concat trad " ")))
;; ;      (insert (concat "\"" trad "\": \"" current "\",\n")))
;;     )
;;   )



;; *** traff
(defun traff()
  "Préparer un document pour mplayer-mode.
Collecte les informations des fichiers audio.
/traff/ utilise `chomp' `lomp' et `hmgn'"
  (interactive)

  (setq
   jesuisici (current-buffer) ;;mon buffer
   ;; mettre la liste des fichiers audios dans une liste nouveaux-fichiers
   nouveaux-fichiers (directory-files "." t "\\(wma\\|mp3\\|wav\\|WMA\\|MP3\\|WAV\\|flv\\|ogg\\|avi\\|wmv\\)$")
   ;; mettre les médias déjà présents dans le fichier dans une liste fichiers-enregistrés
   fichiers-enregistrés  (org-map-entries
			  (lambda ()
			    (let (exist)
			      (setq exist (org-entry-get nil "MEDIAS")))))
   destination (concat "~/org/audio/" (format-time-string "%m-%Y") "/")
   )

  ;; pour chaque nouveau fichier
  (while nouveaux-fichiers
    (setq chemin-et-nom  (pop nouveaux-fichiers)
	  nom-de-fichier (file-name-nondirectory chemin-et-nom))

    (if (eq (member nom-de-fichier fichiers-enregistrés) nil)
	(progn
	  (setq chemin-complet (file-name-directory chemin-et-nom)
		nouveau-titre  (file-name-sans-extension nom-de-fichier)
		date-reception (format-time-string "%a %d-%m-%y %H:%M" (nth 5 (file-attributes nom-de-fichier))))

	  ;; vérifier que seuls les nouveaux fichiers seront traités
	  (insert (concat "* " nouveau-titre "\n"))
	  (org-todo)
	  (org-entry-put nil "ORIGIN" nouveau-titre)
	  (org-entry-put nil "CHEMIN" destination)
	  (org-entry-put nil "MEDIAS" nom-de-fichier)
	  (org-entry-put nil "REÇULE" date-reception)
	  ;; on travaille sur la sortie de exiftool
	  (with-temp-buffer
	    (setq informations (substring (shell-command-to-string (concat "exiftool '" chemin-et-nom "'")) 0 -1))
	    (insert informations)
	    (setq moreline t)
	    (goto-char (point-min))

	    (while moreline

	      (catch 'cbon
		(search-forward ":" nil t 1)
		(setq splt (1- (point)))
		(beginning-of-line)
		(setq brut (buffer-substring-no-properties (point) splt))
		(string-match "[ \t]*$" brut)
		(setq prprt (replace-match "" nil nil brut))
		(setq prprt (chomp prprt))
		(setq prprt (lomp prprt))

		;; éliminer les tags inutiles
		(if (member prprt '("ExifTool_Version_Number" "File_Name" "File_ID" "File_Modification_Date_Time"
				    "Stream_Type" "Time_Offset" "ID3_Size" "MIME_Type" "Channel_Mode" "Stream_Number"
				    "File_Permissions"   "MPEG_Audio_Version" "Creation_Date" "Error_Correction_Type"
				    "Audio_Layer" "MS_Stereo" "Intensity_Stereo" "Copyright_Flag" "Original_Media"
				    "Emphasis"  "Directory" "Data_Packets" "Send_Duration" "Audio_Channels"
				    "Preroll" "Flags" "Min_Packet_Size" "Max_Packet_Size" "Max_Bitrate" "Audio_Codec_ID"
				    "Audio_Codec_Name" "Audio_Codec_Description"))
		    (progn
		      (end-of-line)
		      (throw 'cbon t)))

		;; changer Play_dration et duration en Effort
		(if (member prprt '("Play_Duration" "Duration"))
		    (setq prprt "Effort"))

		(end-of-line)
		(setq vlr (buffer-substring-no-properties  (+ 1 splt) (point)))
		(string-match " *" vlr)
		(setq vlr (replace-match "" nil nil vlr))
		;; convertir le poids
		(if (string= prprt "File_Size")
		    (if (eq (string-match "MB" vlr) nil)
			(setq vlr (concat
				   (format "%.2f" (/ (string-to-number vlr) 1048576.0))
				   " MB"))
		      (setq vlr vlr)))

		(if (string= prprt "Effort")
		    (if (string-match "^\\([0-9][0-9]:[0-9][0-9]\\)$" vlr)
			(setq vlr (hmgn vlr))))

		;; (setq vlr (hmgn vlr)))


		(if (string= prprt "Effort")
		    (if (string-match "(approx)" vlr)
			(setq vlr (replace-match "" nil nil vlr))))


		;; on insère les orgmode PROPERTIES
		(with-current-buffer jesuisici
		  (org-entry-put nil prprt vlr))
		(end-of-line)
		(setq moreline (= 0 (forward-line 1)))
		))
	    )

	  (insert "\n** Intro\n- 00:00:01 ::\n\n")
	  ;; (if (file-exists-p destination)
	  ;;     (rename-file nom-de-fichier destination)
	  ;;   (progn
	  ;;     (make-directory destination)
	  ;;     (rename-file nom-de-fichier destination)))
	  )
      (message "%s existe déjà" nom-de-fichier))
    ))


;; *** todoc
(defun todoc()
  (interactive)
  (setq
   todoc-script "~/bin/todoc"
   this-buffer (buffer-name)
   this-file (buffer-file-name)
   doc-file (concat (file-name-sans-extension this-file) ".doc")
   destination (concat "~/org/livraison/" (format-time-string "%m-%Y"))
   )
  ;; (set-process-filter (get-process "todoc") (lambda (process output)
  ;; 						(string-match "Process todoc finished" output)))
  (progn
    (switch-to-buffer-other-window "*todoc*")
    (goto-char (point-max))
    (switch-to-buffer-other-window this-buffer))
  (start-process "todoc" "*todoc*" todoc-script this-file)
  (sleep-for 2)
  (if (file-exists-p destination)
      (rename-file doc-file destination 1)
    (progn
      (make-directory destination)
      (rename-file doc-file destination 1)))
  )

;; *** mafia
(defun mafia()
  (interactive)
  (setq
   mafia-script "~/bin/mafia"
   this-file (buffer-file-name)
   this-buffer (buffer-name)
   )
  (progn
    (switch-to-buffer-other-window "*mafia*")
    (goto-char (point-max))
    (switch-to-buffer-other-window this-buffer))
  (start-process "mafia" "*mafia*" mafia-script this-file)
  )




;; ** FACTURATION
;; *** bdc
(defun bdc()
  (interactive)
  ;;***********************************************;;
  ;;; Fixe Effort For All Items In Narrowed Region ;;
  ;;***********************************************;;
  (save-excursion
    (goto-char (point-min))
    (parse-effort-all)
    )										;; comptabilisation du temps
  ;;***********************************************;;
  ;;; collecte et intialisation des valeurs       ;;;
  ;;***********************************************;;
  (setq
   temps (org-map-entries (lambda()
			    (let(z) (setq z (org-entry-get nil "Effort")))))		;; collecte "Effort"
   titre (org-map-entries (lambda()
			    (let(w)
			      (if (looking-at org-complex-heading-regexp)
				  (setq w (substring-no-properties (match-string 4)))))))	;; collecte "Item"
   lola (org-map-entries (lambda()
   			   (let(x)
			     (if (string= (org-entry-get nil "SCHEDULED") "nil")
				 (setq x (org-entry-get nil "TIMESTAMP"))
			       (setq x (org-entry-get nil "SCHEDULED"))))))
   sum   0											;; initiatlisations
   dates '()
   premier 365
   dernier 0
   )
  ;;***********************************************;;
;;;  Additionner Effort en secondes             ;;;
  ;;***********************************************;;

  (while titre											;; pour chaque "Item"
    (setq
     temps-x (pop temps)									;; retenir "Effort"
     titre-x (pop titre)									;; retenir "Item"
     )
    (if (string= temps-x "nil")									;; si pas de "Effort" ...
	(message "nothing")									;; sortir
      (progn											;; ... sinon
	(setq sum (+ sum (org-time-string-to-seconds temps-x)))))				;; additionner "Effort"'s
    )
  ;;********************************************************;;
;;;  Définition des dates de début et de fin de l'étude   ;;;
  ;;********************************************************;;
  (while lola											;; si "date"
    (if (string= (car lola) "nil")
	(pop lola)
      (progn
	(setq
	 reference (pop lola)
	 premier (min
		  (- (time-to-day-in-year (date-to-time reference)) 1)				;; sortir "début"
		  premier)
	 dernier (max
		  (- (time-to-day-in-year (date-to-time reference)) 1)
		  dernier)
	 )))
    )											;; sortir "fin"
  ;;***********************************************;;
;;; préparation des variable en vue de leur inscription dans le heading et en vue de leur exportation dans le fichier xfdf
  ;;***********************************************;;
  (setq
   date-debut (format-time-string "%d-%m" (days-to-time premier))
   date-fin (format-time-string "%d-%m" (days-to-time dernier))
   taux (string-to-number (org-entry-get nil "Taux"))
   frais (org-entry-get nil "Frais")
   total-secondes (/ sum 3600.00)
   total-s (format "%.2f" total-secondes)
   total-d (replace-regexp-in-string "," "." total-s)
   tarif (* (string-to-number total-s) taux)				;; HT
   total-h (org-time-seconds-to-string sum)
   )

  (save-excursion
    (goto-char (point-min))
    (looking-at org-complex-heading-regexp)
    (setq
     etude (substring-no-properties (match-string 4))
     client (substring (substring-no-properties (match-string 5)) 1 -1)
     ht (format "%.2f" tarif)
     tva (format "%.2f" (* tarif 0.2))
     ttc (format "%.2f" (* tarif 1.2))
     net (format "%.2f" (/ (* tarif 1.2) 2.041639))
     lieux (org-entry-get nil "Lieux")
     )


    (org-entry-put nil "Etude" etude)
    (org-entry-put nil "Client" client)
    (org-entry-put nil "Total-H" total-h)
    (org-entry-put nil "Total-D" total-d)
    (org-entry-put nil "HT"  ht)
    (org-entry-put nil "TVA" tva)
    (org-entry-put nil "TTC" ttc)
    (org-entry-put nil "NET" net)
    (org-entry-put nil "Date_Debut" date-debut)
    (org-entry-put nil "Date_fin" date-fin)
    ;;***********************************************;;
    ;;;            début de l'exportation           ;;;
    ;;***********************************************;;
    (setq
     base (expand-file-name "~/org/facturation/")
     destination (concat base (format-time-string "%m-%Y") "/")
     )

    (if (not (file-exists-p destination))
	(make-directory destination))
    )
  (progn
    (find-file "~/org/clients.org")
    (widen)
    (goto-char (point-min))
    (goto-char  (search-forward client))
    (org-narrow-to-subtree)
    (setq ensemble (org-entry-properties))
    (setq societe (org-entry-get nil "Texte1"))
    (kill-buffer)
    )
  ;;***********************************************;;
;;;            creation du fichier de base du formulaire
  ;;***********************************************;;
  (with-temp-buffer
    (insert "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n
  <xfdf xmlns=\"http://nous.adobe.com/xfdf/\" xml:space=\"default\">\n
      <fields>\n")
    (setq
     recordon "<field name=\""
     valueon "\"><value>"
     recordoff "</value></field>"
     )
    (insert (concat	    recordon "Texte15"		valueon "Aziz Yemloul"				recordoff "\n")
	    (concat 	    recordon "Texte20"		valueon etude					recordoff "\n")
	    (concat 	    recordon "Texte21"		valueon total-d					recordoff "\n")
	    (concat 	    recordon "Texte22"		valueon (number-to-string taux)			recordoff "\n")
	    (concat 	    recordon "Texte23"		valueon ht					recordoff "\n")
	    (concat 	    recordon "Texte36"		valueon ht					recordoff "\n")
	    (concat 	    recordon "Texte37"		valueon tva					recordoff "\n")
	    (concat 	    recordon "Texte38"		valueon ttc					recordoff "\n")
	    (concat 	    recordon "Texte34"		valueon lieux					recordoff "\n")
	    (concat 	    recordon "Texte35"		valueon (concat date-debut "---" date-fin)	recordoff "\n")
	    (concat 	    recordon "Texte44"		valueon (format-time-string "%d-%m-%Y")		recordoff "\n")
	    (concat 	    recordon "Texte41"		valueon frais					recordoff "\n")
	    )

    (while ensemble
      (setq
       unite (pop ensemble)
       propriete (car unite)
       valeur (cdr unite)
       )
      (if (or (member propriete '("Taux2" "TAGS" "FILE" "ALLTAGS" "BLOCKED" "CATEGORY")) (member valeur '("#")))
	  (message "")
	(insert (concat recordon propriete valueon valeur recordoff "\n")))
      )
    (insert "</fields></xfdf>")

    (setq
     xfdfdoc (expand-file-name (concat destination societe "-" etude "-" date-fin ".xfdf"))
     xfdflink (concat societe "-" etude "-" date-fin ".xfdf")
     pdf (expand-file-name (concat destination societe "-" etude "-" date-fin ".pdf"))
     )

    (append-to-file (point-min) (point-max) xfdfdoc)
    )
  (org-entry-put nil "Facture" (concat "[[file://" xfdfdoc "][" xfdflink "]]"))
  ;;***********************************************;;
;;;            correction des accents non pris en charge dans le formulaire
  ;;***********************************************;;
  ;; (progn
  ;;   (find-file xfdfdoc)
  ;;   (goto-char (point-min))
  ;;   (replace-string "Société" "Soci&#233;t&#233;")
  ;;   (goto-char (point-min))
  ;;   (replace-string "Représentée par" "Repr&#233;sent&#233;e par")
  ;;   (goto-char (point-min))
  ;;   (replace-string "Qualité" "Qualit&#233;")
  ;;   (goto-char (point-min))
  ;;   (replace-string "Période" "P&#233;riode")
  ;;   (goto-char (point-min))
  ;;   (replace-string "Société" "Soci&#233;t&#233;")
  ;;   (goto-char (point-min))
  ;;   (replace-string "_" " ")
  ;;   (goto-char (point-min))
  ;;   (replace-string "dordre" "d'ordre")
  ;;   (save-buffer)
  ;;   (kill-buffer)
  ;;   )
  ;;***********************************************;;
;;;            remplissage du formulaire et apposition de la signature
  ;;***********************************************;;
  (call-process "pdftk" nil "*scratch*" nil (expand-file-name "~/org/facturation/ABC Portage_Bon de commande_TYPE FR.pdf") "fill_form" xfdfdoc "output" pdf)

  (call-process "pdftk" nil "*scratch*" nil pdf "burst" "output" (expand-file-name "~/org/facturation/page_%d.pdf"))
  (call-process "convert" nil "*scratch*" nil "-density" "100" (expand-file-name "~/org/facturation/page_1.pdf") (expand-file-name "~/org/facturation/page_1.png"))
  (call-process "convert" nil "*scratch*" nil "-density" "100" (expand-file-name "~/org/facturation/page_2.pdf") (expand-file-name "~/org/facturation/page_2.png"))
  ;; (call-process "composite" nil "*scratch*" nil "-geometry"  "228x101+560+950" (expand-file-name "~/org/facturation/signature.png")  (expand-file-name "~/org/facturation/page_1.png")  (expand-file-name "~/org/facturation/page_1b.png"))
  (call-process "composite" nil "*scratch*" nil "-geometry"  "228x101+560+970" (expand-file-name "~/org/facturation/signature.png")  (expand-file-name "~/org/facturation/page_1.png")  (expand-file-name "~/org/facturation/page_1b.png"))
  (call-process "composite" nil "*scratch*" nil "-geometry"  "228x101+560+920" (expand-file-name "~/org/facturation/signature.png")  (expand-file-name "~/org/facturation/page_2.png")  (expand-file-name "~/org/facturation/page_2b.png"))
  (call-process "convert" nil "*scratch*" nil "-density" "100" (expand-file-name "~/org/facturation/page_1b.png") (expand-file-name "~/org/facturation/page_1.pdf"))
  (call-process "convert" nil "*scratch*" nil "-density" "100" (expand-file-name "~/org/facturation/page_2b.png") (expand-file-name "~/org/facturation/page_2.pdf"))
  (call-process "pdftk" nil "*scratch*" nil (expand-file-name "~/org/facturation/page_1.pdf") (expand-file-name "~/org/facturation/page_2.pdf") "cat" "output" pdf)
;  (start-process "my-process2" "*scratch*"  "acroread" pdf)
  ;; (start-process "my-process3" "*scratch*"
  ;; 		 "rm"
  ;; 		 (concat base "doc_data.txt")
  ;; 		 (expand-file-name "~/org/facturation/page_1b.png")
  ;; 		 (expand-file-name "~/org/facturation/page_1.pdf")
  ;; 		 (expand-file-name "~/org/facturation/page_1.png")
  ;; 		 (expand-file-name "~/org/facturation/page_2b.png")
  ;; 		 (expand-file-name "~/org/facturation/page_2.pdf")
  ;; 		 (expand-file-name "~/org/facturation/page_2.png")
  ;; 		 )


  )


;; *** org-time-string-to-seconds
(defun org-time-string-to-seconds (s)
  "Convert a string HH:MM:SS to a number of seconds."
  (cond
   ((and (stringp s)
	 (string-match "\\([0-9]+\\):\\([0-9]+\\):\\([0-9]+\\)" s))
    (let (
	  (hour (string-to-number (match-string 1 s)))
	  (min (string-to-number (match-string 2 s)))
	  (sec (string-to-number (match-string 3 s))))
      (+ (* hour 3600) (* min 60) sec)))

   ((and (stringp s)
	 (string-match "\\([0-9]+\\):\\([0-9]+\\)" s))
    (let (
	  (min (string-to-number (match-string 1 s)))
	  (sec (string-to-number (match-string 2 s))))
      (+ (* min 60) sec)))

   ((stringp s) (string-to-number s))
   (t s)))

;; *** org-time-seconds-to-string
(defun org-time-seconds-to-string (secs)
  "Convert a number of seconds to a time string."
  (cond ((>= secs 3600) (format-seconds "%.2h:%.2m:%.2s" secs))
	((>= secs 60) (format-seconds "%.2h:%.2m:%.2s" secs))
	(t (format-seconds "%s" secs))))

(defmacro with-time (time-output-p &rest exprs)
  "Evaluate an org-table formula, converting all fields that look
like time data to integer seconds.  If TIME-OUTPUT-P then return
the result as a time value."
  (list
   (if time-output-p 'org-time-seconds-to-string 'identity)
   (cons 'progn
	 (mapcar
	  (lambda (expr)
	    `,(cons (car expr)
		    (mapcar
		     (lambda (el)
		       (if (listp el)
			   (list 'with-time nil el)
			 (org-time-string-to-seconds el)))
		     (cdr expr))))
	  `,@exprs))))


;; *** ehseb
(defun ehseb()
  (interactive)
  (goto-char (point-min))
  (if (eq (re-search-forward "\\(\\*\\)\\(.*\\)\\([0-9]\\{2\\}\\):\\([0-9]\\{2\\}\\)-\\([0-9]\\{2\\}\\):\\([0-9]\\{2\\}\\)\\(.*\\)$" nil t) 'nil)
      (parse-realeffort)
    (progn
      (parse-effort-all)
      (parse-realeffort))))


;; *** parse-realeffort
(defun parse-realeffort()
  (interactive)
  (goto-char (point-min))
  (search-forward-regexp "^- \\([0-9]\\{0,2\\}\\):\\{0,1\\}\\([0-9]\\{0,2\\}\\):\\{0,1\\}\\([0-9]\\{1,2\\}\\) ::")
  (setq hd (match-string 1))
  (setq md (match-string 2))
  (goto-char (point-max))
  (search-backward-regexp "^- \\([0-9]\\{0,2\\}\\):\\{0,1\\}\\([0-9]\\{0,2\\}\\):\\{0,1\\}\\([0-9]\\{1,2\\}\\) ::")
  (setq hf (match-string 1))
  (setq mf (match-string 2))
  (setq effort
	(org-time-seconds-to-string (-
				     (org-time-string-to-seconds (concat hf ":" mf))
				     (org-time-string-to-seconds (concat hd ":" md))
				     )))
  (goto-char (point-min))
  (org-entry-put nil "Real" effort))


;; *** aziz-time-string-to-seconds
(defun aziz-time-string-to-seconds (s)
  "Convert a string HH:MM to a number of seconds."
  (string-match "\\([0-9]+\\):\\([0-9]+\\)" s)
  (setq hour (string-to-number (match-string 1 s))
	min (string-to-number (match-string 2 s))
	sec 0)
  (+ (* hour 3600) (* min 60) sec))

;; *** parse-effort-all
(defun parse-effort-all()
  (interactive)
  (while		;      1        2          3                   4                 5                  6             7
      (re-search-forward "\\(\\*\\)\\(.*\\)\\([0-9]\\{2\\}\\):\\([0-9]\\{2\\}\\)-\\([0-9]\\{2\\}\\):\\([0-9]\\{2\\}\\)\\(.*\\)$" nil t)

    (setq
     heure-debut (concat (match-string 3) ":" (match-string 4))
     heure-fin (concat (match-string 5) ":" (match-string 6))
     debut-en-secondes (aziz-time-string-to-seconds heure-debut)
     fin-en-secondes (aziz-time-string-to-seconds heure-fin)
     effort (org-time-seconds-to-string (- fin-en-secondes debut-en-secondes))
     )

    (org-entry-put nil "Effort" effort)
    ))




;; ** STENO
;; *** translate
(defun translate()
  (interactive)
  (downcase-region (point-min) (point-max))
  (goto-char (point-min))
  (setq moreline t)
  (setq nline 0)
  (while moreline								;; pour chaque ligne
    (setq p1 (line-beginning-position))
    (setq p2 (line-end-position))
    (setq maliste (split-string (buffer-substring-no-properties p1 p2)))
    (setq nline (+ 1 nline))
    (message (concat "line n°: "  (number-to-string nline)))
    (setq moreline (= 0 (forward-line 1)))
    (with-temp-buffer								;; pour chaque mot
      (setq compteur 1
	    orth ""
	    steno "")
      (while maliste
	(setq mot (pop maliste))

	(if (numberp (string-match "'" mot))
	    (progn
	      (setq avantapos (substring mot 0 (string-match "'" mot))
		    mot (substring mot (+ 1 (string-match "'" mot)))
		    apos "'")
	      (if (string= "l" avantapos) (setq stelision "L"))
	      (if (string= "t" avantapos) (setq stelision "T"))
	      (if (string= "j" avantapos) (setq stelision "Y"))
	      (if (string= "m" avantapos) (setq stelision "M"))
	      (if (string= "s" avantapos) (setq stelision "S"))
	      (if (string= "c" avantapos) (setq stelision "S"))
	      (if (string= "n" avantapos) (setq stelision "N"))
	      (if (string= "d" avantapos) (setq stelision "T*"))
	      (if (string= "qu" avantapos) (setq stelision "K")))
	  (progn
	    (setq  apos ""
		   avantapos ""
		   stelision "")))

	  (with-temp-buffer
	    (find-file "/home/azyvers/dict-france/Atelier/nude.txt")
	    (goto-char (point-min))
	    (if (numberp (re-search-forward (concat "^" mot "|") nil t))
	      (progn
		(goto-char (point-min))
		(goto-char (re-search-forward (concat "^" mot "|") nil t))
		(setq begin (point))
		(setq end (line-end-position))
		(setq trad (buffer-substring-no-properties begin end)))
	      (setq trad "---")))
	  (setq
	   orth (concat orth " " avantapos apos mot)
	   steno (concat steno "/" stelision trad)
	   compteur (+ 1 compteur))
	  )
	)

    (with-current-buffer "*scratch*"
      (insert  (concat "\"" steno "\": \"" orth "\",\n"))
      )
    )
    (with-current-buffer "*scratch*"
      (goto-char (point-min))
      (replace-string "\"/" "\"")
      (goto-char (point-min))
      (replace-string "\" " "\""))
  )



;; ** Enlever l'heure
(defun enlevlr()
  (interactive)
  (save-excursion
    (replace-regexp "^- [0-9:]* :: " "") (point-min) (point-max)))
;; ** MY-DESKTOP LIBRARY
;; my-desktop-save -- Save the current session by name
;; my-desktop-save-and-clear -- Same as above, but clear out all the buffers so you start with a "clean" session
;; my-desktop-read -- Load a session by name
;; my-desktop-change -- Save the current session and load a different one
;; my-desktop-name -- Echo the current session name

(require 'desktop)

(defvar my-desktop-session-dir
  (concat (getenv "HOME") "/.emacs.d/desktop-sessions/")
  "*Directory to save desktop sessions in")

(defvar my-desktop-session-name-hist nil
  "Desktop session name history")

(defun my-desktop-save (&optional name)
  "Save desktop by name."
  (interactive)
  (unless name
    (setq name (my-desktop-get-session-name "Save session" t)))
  (when name
    (make-directory (concat my-desktop-session-dir name) t)
    (desktop-save (concat my-desktop-session-dir name) t)))

(defun my-desktop-save-and-clear ()
  "Save and clear desktop."
  (interactive)
  (call-interactively 'my-desktop-save)
  (desktop-clear)
  (setq desktop-dirname nil))

(defun my-desktop-read (&optional name)
  "Read desktop by name."
  (interactive)
  (unless name
    (setq name (my-desktop-get-session-name "Load session")))
  (when name
    (desktop-clear)
    (desktop-read (concat my-desktop-session-dir name))))

(defun my-desktop-change (&optional name)
  "Change desktops by name."
  (interactive)
  (let ((name (my-desktop-get-current-name)))
    (when name
      (my-desktop-save name))
    (call-interactively 'my-desktop-read)))

(defun my-desktop-name ()
  "Return the current desktop name."
  (interactive)
  (let ((name (my-desktop-get-current-name)))
    (if name
        (message (concat "Desktop name: " name))
      (message "No named desktop loaded"))))

(defun my-desktop-get-current-name ()
  "Get the current desktop name."
  (when desktop-dirname
    (let ((dirname (substring desktop-dirname 0 -1)))
      (when (string= (file-name-directory dirname) my-desktop-session-dir)
        (file-name-nondirectory dirname)))))

(defun my-desktop-get-session-name (prompt &optional use-default)
  "Get a session name."
  (let* ((default (and use-default (my-desktop-get-current-name)))
         (full-prompt (concat prompt (if default
                                         (concat " (default " default "): ")
                                       ": "))))
    (completing-read full-prompt (and (file-exists-p my-desktop-session-dir)
                                      (directory-files my-desktop-session-dir))
                     nil nil nil my-desktop-session-name-hist default)))

;; (defun my-desktop-kill-emacs-hook ()
;;   "Save desktop before killing emacs."
;;   (when (file-exists-p (concat my-desktop-session-dir "last-session"))
;;     (setq desktop-file-modtime
;;           (nth 5 (file-attributes (desktop-full-file-name (concat my-desktop-session-dir "last-session"))))))
;;   (my-desktop-save "last-session"))

;; (add-hook 'kill-emacs-hook 'my-desktop-kill-emacs-hook)
;; (my-desktop-read "last-session")








;; ** CHECK-JSON
(defun find-broken-json ()
  "Rudimentary function to check Plover dictionary entries for ones that are malformed. Move point to the beginning of the line of the first entry, then do M-x find-broken-json <RET>. It will (hopefully) fail if it hits a line that contains an invalid entry (though point may be on the following line depending on what is wrong with the entry, so you should check both the current and previous lines when it stops. Once you've fixed an error you can either move point to the beginning of the formerly-broken entry and re-run from there, or just start over at the beginning, but I recommend at least moving back to before the hopefully-fixed-entry in the file to double-check that it is now fixed. At most there needs to be only whitespace between point and the opening quotation mark for the stenographic stroke of an entry when you invoke find-broken-json for find-broken-json to work properly. It assumes that both the steno stroke and the replacement text are in quotation marks and should fail if they are not. The Plover dictionary can be quite large; do not be surprised if this function takes a few minutes to complete checking the entire thing. It should fail on the last entry because that entry does not have a comma after it; users are strongly encouraged to check the final entry by visual inspection and to make sure that there is a closing brace after it. Be advised that, given its rudimentary nature, it may stop on valid entries and it may miss invalid entries; no warranties are provided, and I make no guarantees about the fitness of this function for use on any computer. Do not taunt find-broken-json. Best of luck! ^_^"
  (interactive)
  (while (and (not (eq (point) (point-max))))
    (let* ((beginning (point))
	   (end (search-forward-regexp "\"\\s *," nil t))
	   (dict-entry (if end (buffer-substring beginning end) nil)))
      (with-temp-buffer
	(insert dict-entry)
	(goto-char (point-min))
	(search-forward-regexp "\\`\\s *\"[^\"]*\"\\s *:\\s *\"[^\"]*\\(\\\\\"\\)?[^\"]*\"\\s *,\\'")))))
;; ** Blogger ~/.emacs.d/elpa/bpe-20131227.2120/bpe.el
(require 'bpe)
(require 'htmlize nil 'noerror)
(setq bpe:account "azizyemloul@gmail.com")
(setq bpe:blog-name "Sténotypie Underground")
;(define-key org-mode-map (kbd "C-c C-p") 'bpe:post-article)
(define-key org-mode-map (kbd "C-c C-i") 'bpe:insert-template)

;; ** AUTRES
;; *** kill buffer and delete file
(defun killanddelete()
  (interactive)
  (setq filename (buffer-file-name))
  (kill-buffer nil)
  (delete-file filename t))
(global-set-key (kbd "C-c K") 'killanddelete)
;; *** aziz scroll-up
(fset 'aziz-scroll-up
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("-10" 0 "%d")) arg)))
;; *** dos2unix
;; C-x C-m f
(defun dos2unix ()
  "Not exactly but it's easier to remember"
  (interactive)
  (set-buffer-file-coding-system 'unix 't) )

;; *** dmj:turn-headline-into-org-mode-link
(defun dmj:turn-headline-into-org-mode-link ()
  "Replace word at point by an Org mode link."
  (interactive)
  (when (org-at-heading-p)
    (let ((hl-text (nth 4 (org-heading-components))))
      (unless (or (null hl-text)
                  (org-string-match-p "^[ \t]*:[^:]+:$" hl-text))
        (beginning-of-line)
        (search-forward hl-text (point-at-eol))
        (replace-string
         hl-text
         (format "[[file:%s.org][%s]]"
                 (org-link-escape hl-text)
                 (org-link-escape hl-text '((?\] . "%5D") (?\[ . "%5B"))))
         nil (- (point) (length hl-text)) (point))))))

;; *** my-align-all-tables
(defun my-align-all-tables ()
  (interactive)
  (org-table-map-tables 'org-table-align 'quietly))

;; *** org-to-org-handle-includes
(defun org-to-org-handle-includes ()
  "Copy the contents of the current buffer to OUTFILE,
recursively processing #+INCLUDEs."
  (let* ((s (buffer-string))
         (fname (buffer-file-name))
         (ofname (format "%s.I.org" (file-name-sans-extension fname))))
    (setq result
          (with-temp-buffer
            (insert s)
            (org-export-handle-include-files-recurse)
            (buffer-string)))
    (find-file ofname)
    (delete-region (point-min) (point-max))
    (insert result)
    (save-buffer)))


;; *** rename-current-file-or-buffer
(defun rename-current-file-or-buffer ()
  (interactive)
  (if (not (buffer-file-name))
      (call-interactively 'rename-buffer)
    (let ((file (buffer-file-name)))
      (with-temp-buffer
	(set-buffer (dired-noselect file))
	(dired-do-rename)
	(kill-buffer nil))))
  nil)
(global-set-key "\C-cR" 'rename-current-file-or-buffer)



;; *** prepare-html
(defun prepare-html ()
  (interactive)
  (time-guide)
  (goto-char (point-max))
  (insert "\n")
  (insert-file-contents "~/.emacs.d/org-templates/jwplayer.template")
  (goto-char (point-min))
  (insert "#+SETUPFILE: ~/.emacs.d/org-templates/level-0.org\n")
  (re-search-forward "\\* \\(.*\\)$" nil t)
  (beginning-of-line)
  (insert (concat "#+Title: " (match-string 1)))
  (kill-line)
  (goto-char (point-max))
  (re-search-backward "æææ" nil t)
  )

(fset 'time-guide
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("xreplace-regexp^- \\([0-9]\\{0,2\\}:\\{0,1\\}[0-9]\\{0,2\\}:\\{0,1\\}[0-9]\\{1,2\\}\\) :: \\(.*\\)$*** \\2
#+HTML:<a href=\"javascript:void(0)\" onclick=\"jwplayer().seek(\\,(org-time-string-to-seconds \\1));jwplayer().play();\">\\1</a><" 0 "%d")) arg)))

(defun prepare()
  (interactive)
  (setq pattern "^- \\([0-9]\\{0,2\\}:\\{0,1\\}[0-9]\\{0,2\\}:\\{0,1\\}[0-9]\\{1,2\\}\\) :: \\(.*\\)$")
  (while (re-search-forward "^- \\([0-9]\\{0,2\\}:\\{0,1\\}[0-9]\\{0,2\\}:\\{0,1\\}[0-9]\\{1,2\\}\\) :: \\(.*\\)$" nil t)
    (setq
     temps (substring-no-properties (match-string 1))
     question (substring-no-properties (match-string 2))
     jwplayerS (number-to-string (org-time-string-to-seconds temps))
     rempla (concat "\#+HTML:<table><tr><td><button class=\"btn btn-mini\" onclick=\"jwplayer().seek(" jwplayerS ");\">" temps "</button></td><td style=\"padding:5px;\"><b>" question "</b></td></tr></table>")
     )
    (kill-region (point) (line-beginning-position))
    (insert rempla)
    )

  )


;; *** logik
(defun logik ()
  (interactive)
  (save-excursion
    (re-search-backward "&" nil nil)
    (replace-match (char-to-string (read-char-exclusive "what character")))))
(global-set-key (kbd "C-c DEL") 'logik)

;; *** aziz-mail
(defun aziz-mail()
  (interactive)
  (setq titre (file-name-sans-extension (buffer-file-name)))
  (setq fichier (buffer-file-name))
  (message-mail "azizyemloul@gmail.com" (file-name-nondirectory titre))
  (mml-attach-file fichier "application/octet-stream"))


;; *** find-file-as-root
(defun find-file-as-root ()
  "Open the current open file via tramp and the /su:: or /sudo:: protocol"
  (interactive)
  (let ((running-ubuntu
	 (and (executable-find "lsb_release")
	      (string= (car (split-string (shell-command-to-string "lsb_release -ds"))) "Ubuntu"))))
    (find-file (concat (if running-ubuntu "/sudo::" "/su::") (buffer-file-name)))))

;; *** figlet-region (&optional b
(defun figlet-region (&optional b e)
  (interactive "r")
  (shell-command-on-region b e "figlet" (current-buffer) t)
  (comment-region (mark) (point)))

;; *** w3m-open-this-buffer
(defun w3m-open-this-buffer ()
  "Show this buffer in w3m"
  (interactive)
  (w3m-find-file (buffer-file-name)))

;; *** google-search
(defun google-search ()
  "Do a Google search of the symbol at the point"
  (interactive)
  (with-current-buffer (buffer-name)
    (switch-to-buffer-other-window
     (w3m-browse-url (concat "http://www.google.fr/search?q="
			     (if (region-active-p)
	    (buffer-substring-no-properties (region-beginning) (region-end))
	  (word-at-point)
	  )
;; (thing-at-point 'symbol)
)))
    (xsteve-flip-windows)
    (deactivate-mark)))

;; *** synonymes-search
(defun synonymes-search ()
  "Do a synonymes search of the symbol at the point"
  (interactive)
  (with-current-buffer (buffer-name)
    (switch-to-buffer-other-window
     (w3m-browse-url (concat "http://www.linternaute.com/dictionnaire/fr/definition/"
			     (thing-at-point 'symbol) "/")))
    (xsteve-flip-windows)))

;; *** xsteve-flip-windows
(defun xsteve-flip-windows ()
  (interactive)
  (let ((cur-buffer (current-buffer))
	(top-buffer)
	(bottom-buffer))
    (pop-to-buffer (window-buffer (frame-first-window)))
    (setq top-buffer (current-buffer))
    (other-window 1)
    (setq bottom-buffer (current-buffer))
    (switch-to-buffer top-buffer)
    (other-window -1)
    (switch-to-buffer bottom-buffer)
    (pop-to-buffer cur-buffer)))

;; *** facture
(defun facture()
  (interactive)
  (find-file "~/facturage/0_facture.org")
  (goto-char (point-min))
  (outline-next-visible-heading 1)
  (org-narrow-to-subtree))

;; *** facgen
(defun facgen()
  (interactive)
  (org-table-iterate)
  (goto-char (point-min))
  (replace-regexp "\\<0\.00\\>" " ")
  (org-cycle)
  (save-buffer)
  (widen)
  (setq org-confirm-babel-evaluate nil)
  (org-export-as-utf8)
  (with-current-buffer "0_facture.txt"
    (goto-char (point-min))
    (search-forward "<" nil t)
    (setq splitPos (1- (point)))
    (kill-region (point-min) splitPos)
    (replace-regexp "\\\"\\\[" "\"")
    (replace-regexp "\\\]\\\"" "\"")
    (flush-lines "\*" (point-min) (point-max))
    (flush-lines "^$" (point-min) (point-max))
    (save-buffer)
    (call-process "pdftk" nil "*scratch*" nil
		  "ABC Portage_Bon de commande_TYPE FR.pdf"
		  "fill_form" "0_facture.txt" "output" "test.pdf")
    (call-process "pdftk" nil "*scratch*" nil
		  "test.pdf" "burst" "output" "page_%d.pdf")
    (call-process "convert" nil "*scratch*" nil
		  "-density" "100" "page_1.pdf" "page_1.png")
    (call-process "convert" nil "*scratch*" nil
		  "-density" "100" "page_2.pdf" "page_2.png")
    (call-process "composite" nil "*scratch*" nil
		  "-geometry"  "228x101+560+950" "signature.png"  "page_1.png"  "page_1b.png")
    (call-process "composite" nil "*scratch*" nil
		  "-geometry"  "228x101+560+920" "signature.png"  "page_2.png"  "page_2b.png")
    (call-process "convert" nil "*scratch*" nil
		  "-density" "100" "page_1b.png" "page_1.pdf")
    (call-process "convert" nil "*scratch*" nil
		  "-density" "100" "page_2b.png" "page_2.pdf")
    (call-process "pdftk" nil "*scratch*" nil
		  "page_1.pdf" "page_2.pdf" "cat" "output" "test_signed.pdf")
    ;; (call-process "xpdf" nil "*scratch*" nil "test_signed.pdf")
    ;; (start-process "my-process" "*scratch*"
    ;;                "pdftk" "ABC Portage_Bon de commande_TYPE FR.pdf"
    ;;                "fill_form" "facture.txt" "output" "test.pdf")
    (start-process "my-process2" "*scratch*"
		   "acroread" "test_signed.pdf")
    (start-process "my-process3" "*scratch*"
		   "rm"
		   "doc_data.txt"
		   "page_1b.png"
		   "page_1.pdf"
		   "page_1.png"
		   "page_2b.png"
		   "page_2.pdf"
		   "page_2.png"
		   )

    ))

;; *** docx2txt
(defun docx2txt ()
  "Run docx2txt on the entire buffer."
  (shell-command-on-region (point-min) (point-max) "docx2txt" t t))
(put 'narrow-to-region 'disabled nil)


;; *** flyspell-goto-previous-error
(defun flyspell-goto-previous-error ()
  "Go to the next previously detected error.
In general FLYSPELL-GOTO-NEXT-ERROR must be used after
FLYSPELL-BUFFER."
  (interactive)
  (let ((pos (point))
	(min (point-min)))
    (if (and (eq (current-buffer) flyspell-old-buffer-error)
	     (eq pos flyspell-old-pos-error))
	(progn
	  (if (= flyspell-old-pos-error min)
	      ;; goto beginning of buffer
	      (progn
		(message "Restarting from beginning of buffer")
		(goto-char (point-max)))
	    (backward-word 1))
	  (setq pos (point))))
    ;; seek the next error
    (while (and (> pos min)
		(let ((ovs (overlays-at pos))
		      (r '()))
		  (while (and (not r) (consp ovs))
		    (if (flyspell-overlay-p (car ovs))
			(setq r t)
		      (setq ovs (cdr ovs))))
		  (not r)))
      (setq pos (1- pos)))
    ;; save the current location for next invocation
    (setq flyspell-old-pos-error pos)
    (setq flyspell-old-buffer-error (current-buffer))
    (goto-char pos)
    (if (= pos min)
	(message "No more miss-spelled word!"))))


;; *** zaya
(defun zaya()
  "Replace word at point."
  (interactive)
  (setq from
	(if (region-active-p)
	    (buffer-substring-no-properties (region-beginning) (region-end))
	  (word-at-point)))
  (setq to (read-from-minibuffer "Remplacer par : " from))
  (save-excursion
    (goto-char (point-min))
    (query-replace-regexp from to t)))

;; *** chomp
(defun chomp(str)
  (while (string-match " " str)
    (setq str (replace-match "_" t t str)))
  str)

;; *** lomp
(defun lomp(str)
  (while (string-match "/" str)
    (setq str (replace-match "_" t t str)))
  str)

;; *** is-short
(defun is-short(str)
  (if (string-match   "^\\([0-9][0-9]:[0-9][0-9]\\)$" str) t nil))

;; *** hmgn
(defun hmgn(str)
  (concat "0:" str))



;; *** backup-this-file
(defun backup-this-file ()
  "Make a backup of current file."
  (interactive)
  (setq
   backup-directory (concat "~/org/backup/" (format-time-string "%m-%y") "/")
   meta (format-time-string "%d-%m_%Hh%M")
   prprt (format-time-string "%Hh%M")
   this-file (file-name-nondirectory (buffer-file-name))
   new-name (concat backup-directory meta "§" this-file)
   lien_fichier (concat "[[file:/" new-name "][" meta "]]")
   )

  (if (string= "org-mode" (symbol-name major-mode))
      (save-excursion
	(find-file-other-window "~/org/diary.org")
	(goto-char (point-min))
	(search-forward this-file nil t)
	(org-entry-add-to-multivalued-property nil "BACKUPS" lien_fichier))
    (message "You're not in org-mode\nNo link will be put for this file"))

  (if (file-exists-p backup-directory)
      (copy-file (buffer-file-name) new-name 1)
    (progn
      (make-directory backup-directory)
      (copy-file (buffer-file-name) new-name 1)))
  )





;; *** clients-tag-lookup
(defun clients-tag-lookup()
  (interactive)
  (setq tag (thing-at-point 'word))
  (find-file-other-window "~/org/clients.org")
  (widen)
  (goto-char (point-min))
  (goto-char  (search-forward tag))
  (org-narrow-to-subtree)
  (org-columns)
  )

;; *** copy-location-to-clip
(defun copy-location-to-clip()
  (interactive)
  (kill-new (buffer-file-name)))

;; *** org-summary-todo (n-done
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

;; *** yank-to-x-clipboard
(defun yank-to-x-clipboard ()
  (interactive)
  (if (region-active-p)
      (progn
	(shell-command-on-region (region-beginning) (region-end) "xsel -i -b")
	(message "Yanked region to clipboard!")
	(deactivate-mark))
    (message "No region active; can't yank to clipboard!")))


;; *** vlctv
(defun vlctv(a)
  (if (get-process "RADIO")
      (progn (kill-process "RADIO")
	     (sleep-for 2)
	     (start-process  "RADIO" "*RADIO*" "vlc" a))
    (start-process  "RADIO" "*RADIO*" "vlc"  a)))

;; *** liretv
(defun liretv(a)
  (if (get-process "TV")
      (progn (kill-process "TV")
	     (sleep-for 2)
	     (start-process  "TV" "*TV*" "mplayer" "-quiet" "-nocache" a))
    (start-process  "TV" "*TV*" "mplayer" "-quiet" "-nocache" a)))

;; *** lirelelien
(defun lirelelien(a)
  (if (get-process "RADIO")
      (progn (kill-process "RADIO")
	     (sleep-for 2)
	     (start-process  "RADIO" "*RADIO*" "mplayer" "-quiet" a))
    (start-process  "RADIO" "*RADIO*" "mplayer" "-quiet" a)))

;; *** enrgislelien
(defun enrgislelien(a)
  (if (get-process "RADIO")
      (progn (kill-process "RADIO")
	     (sleep-for 2)
	     (start-process  "RADIO" "*RADIO*" "mplayer" "-quiet" "-dumpstream" "-dumpfile"  "fichier.wmv" a))
    (start-process  "RADIO" "*RADIO*" "mplayer" "-quiet" "-dumpstream" "-dumpfile" "fichier.wmv" a)))

;; *** radio
(defun radio()
  (interactive)
  (find-file "~/org/radios.org"))

;; * TABBAR
(tabbar-mode)
(setq tabbar-tab-label-function (lambda (tab) (format " %s " (car tab))))

;; Tabbar settings
(set-face-attribute
 'tabbar-default nil
 ;; :background "gray60")
 :background "#202020"
 :box '(:line-width 1 :color "black" :style nil))
(set-face-attribute
 'tabbar-unselected nil
 ;; :background "gray85"
 :background "gray30"
 :foreground "white"
 :box '(:line-width 5 :color "gray30" :style nil))
(set-face-attribute
 'tabbar-selected nil
 ;; :background "#f2f2f6"
 :background "gray75"
 :foreground "black"
 :box '(:line-width 5 :color "gray75" :style nil))
(set-face-attribute
 'tabbar-highlight nil
 ;; :background "#f2f2f6"
 :background "white"
 :foreground "black"
 :underline nil
 :box '(:line-width 5 :color "white" :style nil))
;;(set-face-attribute
;;'tabbar-button nil
;; :box '(:line-width 1 :color "gray72" :style released-button))
;;:box '(:line-width 0 :color "gray72" :style nil))
(set-face-attribute
 'tabbar-separator nil
 :height 1.0)

(global-set-key (kbd "C-! <C-left>") 'tabbar-backward)
(global-set-key (kbd "C-! <C-right>") 'tabbar-forward)


(setq tabbar-buffer-groups-function
      (lambda ()
	(list "All Buffers")))

(setq tabbar-buffer-list-function
      (lambda ()
	(remove-if
	 (lambda(buffer)
	   (find (aref (buffer-name buffer) 0) " *"))
	 (buffer-list))))
;; * KEYS

(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)



(define-key global-map		"\C-z"		'undo)
(define-key global-map		"\C-b"		'aziz-scroll-up)
(define-key global-map		"\C-v"		'scroll-other-window)
(define-key global-map		"\C-o"		'other-window)
(define-key global-map		"\C-cx"		'xsteve-flip-windows)
(define-key global-map		"\C-ct"		'org-toc-show)
(define-key global-map		"\C-ca"		'org-agenda)
(define-key global-map		"\C-cw"		'google-search)
(define-key global-map		"\C-cs"		'synonymes-search)
(define-key global-map		"\C-xp"		'sr-speedbar-toggle)

(global-set-key			"\M-[1;5C"	'forward-word)   ;  Ctrl+right->forward word
(global-set-key			"\M-[1;5D"	'backward-word)  ;  Ctrl+left-> backward word
(global-set-key			"\C-cu"		'browse-url)
(global-set-key			"\C-cg"		'browse-url-at-point)
(global-set-key			"\C-cl"		'goto-line)

;; (global-set-key			"\C-i"		'backward-char)
;; (global-set-key			"\C-p"		'forward-char)
;; (global-set-key			"\C-p"		'backward-char)
;; (global-set-key			"\C-p"		'backward-char)


(global-set-key			[f9]		'org-timer-change-times-in-region)
(global-set-key			[f5]		'org-clock-in)
(global-set-key			[f6]		'org-clock-out)

(global-set-key			(kbd "C-x C-b")	'ibuffer)
(global-set-key			(kbd "<f7>")	'recentf-open-files)
(global-set-key			(kbd "C-c M-b") 'tabbar-backward)
(global-set-key			(kbd "C-c M-f") 'tabbar-forward)
(global-set-key			(kbd "C-c d")	'backup-this-file)
(global-set-key			(kbd "C-c h")	'helm-mini)
(global-set-key			(kbd "C-h t")	'clients-tag-lookup)
(global-set-key			(kbd "C-x C-f") 'helm-find-files)
(global-set-key			(kbd "C-x t")	'multi-term)
(global-set-key			(kbd "C-x l")	'copy-location-to-clip)

(define-key global-map		"\C-cm"		'gnus-no-server)
(define-key global-map		"\C-co"		'org-mode)
(define-key global-map		"\C-cy"		'mplayer-master)
(define-key global-map		"\C-cp"		'flyspell-mode)
(define-key global-map		"\C-cf"		'flyspell-buffer)
(define-key global-map		"\C-cc"		'flyspell-goto-next-error)
(define-key global-map		"\C-cv"		'ispell-word)
(define-key global-map		"\C-cr"		'zaya)
(define-key global-map		"\C-ck"		'browse-kill-ring)
(define-key global-map		"\C-cb"		'display-buffer)
(define-key global-map		"\C-cn"		'find-file-other-window)


(define-key mplayer-mode-map	(kbd "=")	'mplayer-inteligent-insert-timestamp)
(define-key mplayer-mode-map	(kbd "$")	'mplayer-inteligent-seek-backward)
;(define-key mplayer-mode-map	(kbd "$")	'mplayer-inteligent-seek-backward)
(define-key mplayer-mode-map	(kbd "]")	'mplayer-inteligent-seek-forward)
(define-key mplayer-mode-map	(kbd "}")	'mplayer-inteligent-pause)

(define-key dired-mode-map	(kbd "C-p")	'dired-omit-mode)
(define-key dired-mode-map	(kbd "C-o")	'other-window)
(define-key dired-mode-map	(kbd "<return>") 'dired-find-alternate-file) ; was dired-advertised-find-file
(define-key dired-mode-map	(kbd "^")	(lambda () (interactive) (find-alternate-file "..")))  ; was dired-up-directory

(defalias	'rr	'replace-regexp)
(defalias	'qrr	'query-replace-regexp)
(defalias	'sp	'show-paren-mode)
(defalias	'lp	'list-packages)
(defalias	'sr	'shell-command-on-region)

;; (global-set-key "\C-xla" 'langtool-check-buffer)
;; (global-set-key "\C-xld" 'langtool-check-done)
;; (global-set-key "\C-cll" 'langtool-switch-default-language)
;; (global-set-key "\C-xlc" 'langtool-show-message-at-point)
;; (global-set-key "\C-xlx" 'langtool-correct-buffer)
;; ** W3M-SESSIONS-KEYS
(defun w3m-add-keys ()
  (define-key w3m-mode-map "S" 'w3m-session-save)
  (define-key w3m-mode-map "L" 'w3m-session-load))
;; * BBDB
(require 'bbdb)
(bbdb-initialize 'gnus 'message)
(bbdb-insinuate-message)		;

(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(add-hook 'mail-setup-hook 'bbdb-insinuate-sendmail)
(setq bbdb-north-american-phone-numbers nil)
(add-hook 'message-setup-hook 'bbdb-get-mail-aliases)

(setq bbdb-ignore-some-messages-alist (quote (
					      ("From" . "no.?reply\\|DAEMON\\|darty\\|daemon\\|reply\\|canon\\|pap.fr\\|yousendit\\|newsletter")
					      ("To" . "ploversteno"))))

(setq bbdb/news-auto-create-p (quote bbdb-ignore-some-messages-hook))
(setq bbdb/mail-auto-create-p (quote bbdb-ignore-some-messages-hook))

(setq
 bbdb-dwim-net-address-allow-redundancy t ;; always use full name
 bbdb-quiet-about-name-mismatches 2       ;; show name-mismatches 2 secs
 bbdb-completion-type nil                 ;; complete on anything
 bbdb-complete-name-allow-cycling t       ;; cycle through matches this only works partially
 bbdb-use-alternate-names t               ;; use AKA
 )
;; * MAIL-REGION
(defun mail-region (b e to subject)
  "Send the current region in an email"
  (interactive "r\nsRecipient: \nsSubject: ")
  (let ((orig-buffer (current-buffer)))
    (message-mail to subject)
    (message-goto-body)
    (insert (save-excursion (set-buffer orig-buffer)
			    (buffer-substring-no-properties b e)))
    (message-send-and-exit)))

;; * Derniers travaux 

(defun totable()
  (interactive)
  (save-excursion
    
    (goto-char (point-min))
    (setq
     n-item 0
     hl-unit ""
     hl-list '()
     titre-list '()
     chapter ""
     seek ""
     text ""
     replace "")
    
    (while (search-forward-regexp "^\\* " nil t) ;; à chaque premier niveau
      (setq n-item (+ 1 n-item))
      (org-narrow-to-subtree)                     ;; narrow
      (setq chapter (buffer-substring-no-properties (point-min) (point-max)))
      
      (with-temp-buffer                           ;; insérer dans un temp buffer
	(insert chapter)
	
	(org-mode)
	(goto-char (point-min))
	(setq hl-unit (nth 4 (org-heading-components)))   ;;
	(setq new-line hl-unit)           ;; name of the hash is a variable content
	(add-to-list 'titre-list new-line)
	(setq new-line (make-hash-table :test 'equal))
	(add-to-list 'hl-list new-line)

	(text-mode)
	(goto-char (point-min))
	(while (re-search-forward "^_- \\([0-9:]*\\) ::_ \\*\\(.*\\)\\*$" nil t)
	  (setq seek (substring-no-properties (match-string 1)))
	  (setq texte (substring-no-properties (match-string 2)))
	  (setq seeks (number-to-string (org-time-string-to-seconds seek)))
	  (setq replace (concat "<span class=\"btn btn-mini\" onclick=\"" hl-unit "_seek(" seeks ")\">- " seek " :: </span><b>" texte "</b><br/>"))
	  (beginning-of-line)
	  (kill-line)      
	  (insert replace)
	  )
	
	(goto-char (point-min))
	(replace-regexp "@@html:"
			"")
	(goto-char (point-min))
	(replace-regexp "@@"
			"")
	
	(goto-char (point-min))
	(replace-regexp "^\\*\\(.*\\)\\* : \\(.*\\)$"
			"<b>\\1</b> : \\2<br/>")
	
	(goto-char (point-min))
	(replace-regexp "^$"
			"</p><p>")
	
	(goto-char (point-min))
	(replace-regexp "^[^*].*[^>]$"
			"\\&<br/>")
	(org-mode)
	(goto-char (point-min))

	(while (search-forward-regexp "^\\*\\* " nil t)
	  (org-narrow-to-subtree)
	  (setq
	   hl-part (nth 4 (org-heading-components))
	   hl-content (buffer-substring-no-properties (line-end-position) (point-max))
	   )
	  (puthash hl-part hl-content new-line)
	  (widen)
	  )
	)
      (widen)
      )
    (setq parties '("Intro" "Souvenir" "Évocation"
                    "Prototype 1" "Prototype 2" "Prototype 3"  "Prototype 4" "Prototype 5"
                    "Classement" "Vision holistique" "C" "R" "Y"))


    (setq momo 0)
    (with-temp-buffer
      (setq nono 0)
      (insert "\n<div class=\"row\">")
      (while (< nono (length hl-list))
	(insert "<div class=\"col-xs-1\" style=\"position:fixed;top:20px;\">" (nth nono titre-list) "</div>")
	(setq nono (+ 1 nono))
	)
      (insert "</div>\n")

      (while (< momo (length parties))
	(setq partie (nth momo parties))
	(setq nono 0)
	(insert "<div  class=\"row " (replace-regexp-in-string " " "_" partie)  "_toggler\">
<div class=\"btn btn-alerte\" style=\"\">" partie "</div></div>")
	(insert "<div  class=\"row " (replace-regexp-in-string " " "_" partie) "\">")
	(while (< nono (length hl-list))
	  (setq contenu (gethash partie (nth nono hl-list)))
	  (insert "\n<div class=\"col-xs-1 " (nth nono titre-list) "\">" contenu "</div>")
	  (setq nono (+ 1 nono))
	  )
	(setq momo (+ 1 momo))
	(insert "</div>\n")
	)
      (append-to-buffer "ensemble.html" (point-min) (point-max))

      )

    (setq momo 0)
    (with-temp-buffer
      (while (< momo (length parties))
	(setq partie (nth momo parties))
	(insert " $('." (replace-regexp-in-string " " "_" partie) "_toggler ').click(function(){$('." (replace-regexp-in-string " " "_" partie) "').slideToggle();});\n")
	(setq momo (+ 1 momo))
	)
      (append-to-buffer "ensemble.html" (point-min) (point-max))
      )

    
    ))

;; * ehtml
(defun ehtmldoc()
  (interactive)
;;  (sanitize)
  (setq document (buffer-substring-no-properties (point-max) (point-min)))
  (with-temp-buffer
    (insert document)
    (text-mode)
    (capitales)
    
    (goto-char (point-min))

    ;; (while (re-search-forward "^- \\([0-9:]*\\) :: \\(.*\\)$" nil t)
    ;;   (setq seek (substring-no-properties (match-string 1)))
    ;;   (setq texte (substring-no-properties (match-string 2)))
    ;;   (setq replace texte)
    ;;   (beginning-of-line)
    ;;   (kill-line)      
    ;;   (insert replace)
    ;;   )

    ;; ;; (while (re-search-forward "^- \\([0-9:]*\\) :: \\(.*\\)$" nil t)
    ;; ;;   (setq seek (substring-no-properties (match-string 1)))
    ;; ;;   (setq texte (substring-no-properties (match-string 2)))
    ;; ;;   (setq replace (concat "*" texte "*" ))
    ;; ;;   (beginning-of-line)
    ;; ;;   (kill-line)      
    ;; ;;   (insert replace)
    ;; ;;   )

    (while (re-search-forward "^- \\([0-9:]*\\) :: \\(.*\\)$" nil t)
      (setq seek (substring-no-properties (match-string 1)))
      (setq texte (substring-no-properties (match-string 2)))
      (setq replace (concat "@@html:<span class=\"small\">@@- " seek " ::@@html:</span>@@ *" texte "*"))
      (beginning-of-line)
      (kill-line)      
      (insert replace)
      )
    (goto-char (point-min))
    (replace-regexp "^\\([0-9]\\)" "  \\1")

    (goto-char (point-min))
    (replace-regexp "^\\([0-9]\\)e\\>" "\\1^{e}")

    (goto-char (point-min))
    (while (re-search-forward "^\\([^:
 ]*\\) : \\(.*\\)$" nil t)
      (setq seek (substring-no-properties (match-string 1)))
      (setq texte (substring-no-properties (match-string 2)))
      (setq replace (concat "*" seek "* : " texte))
      (beginning-of-line)
      (kill-line)      
      (insert replace)
      )
    
;;     (goto-char (point-min))
;;     (while (re-search-forward "\\([^-,.
;; ]*\\)---" nil t)
;;       (replace-match (concat "@@html:<span class=\"vert\">@@" (match-string 1) "@@html:</span>@@")))
    
    (org-mode)    
    (goto-char (point-min))
    (setq titre-du-document (nth 4 (org-heading-components)))
    (kill-line)
    (goto-char (point-min))
    (insert-file-contents "~/org/forhtml.org")
    (goto-char (point-min))
    (insert (concat "#+TITLE:     " titre-du-document "\n"))
    (org-html-export-as-html)
    (write-file (concat "~/orpartage_v/" titre-du-document ".html") t)
    (kill-buffer (concat titre-du-document ".html"))
    )
  
  )

;; * resultat tableau
(defun totable()
  (interactive)
  (save-excursion
    
    (goto-char (point-min))
    (setq
     n-item 0
     hl-unit ""
     hl-list '()
     titre-list '()
     chapter ""
     seek ""
     text ""
     replace "")
    
    (while (search-forward-regexp "^\\* " nil t) ;; à chaque premier niveau
      (setq n-item (+ 1 n-item))
      (org-narrow-to-subtree)                     ;; narrow
      (setq chapter (buffer-substring-no-properties (point-min) (point-max)))
      
      (with-temp-buffer                           ;; insérer dans un temp buffer
	(insert chapter)
	
	(org-mode)
	(goto-char (point-min))
	(setq hl-unit (nth 4 (org-heading-components)))   ;;
	(setq new-line hl-unit)           ;; name of the hash is a variable content
	(add-to-list 'titre-list new-line)
	(setq new-line (make-hash-table :test 'equal))
	(add-to-list 'hl-list new-line)

	(text-mode)
	(goto-char (point-min))
	(while (re-search-forward "^_- \\([0-9:]*\\) ::_ \\*\\(.*\\)\\*$" nil t)
	  (setq seek (substring-no-properties (match-string 1)))
	  (setq texte (substring-no-properties (match-string 2)))
	  (setq seeks (number-to-string (org-time-string-to-seconds seek)))
	  (setq replace (concat "<span class=\"btn btn-mini\" onclick=\"" hl-unit "_seek(" seeks ")\">- " seek " :: </span><b>" texte "</b><br/>"))
	  (beginning-of-line)
	  (kill-line)      
	  (insert replace)
	  )
	
	(goto-char (point-min))
	(replace-regexp "@@html:"
			"")
	(goto-char (point-min))
	(replace-regexp "@@"
			"")
	
	(goto-char (point-min))
	(replace-regexp "^\\*\\(.*\\)\\* : \\(.*\\)$"
			"<b>\\1</b> : \\2<br/>")
	
	(goto-char (point-min))
	(replace-regexp "^$"
			"</p><p>")
	
	(goto-char (point-min))
	(replace-regexp "^[^*].*[^>]$"
			"\\&<br/>")
	(org-mode)
	(goto-char (point-min))

	(while (search-forward-regexp "^\\*\\* " nil t)
	  (org-narrow-to-subtree)
	  (setq
	   hl-part (nth 4 (org-heading-components))
	   hl-content (buffer-substring-no-properties (line-end-position) (point-max))
	   )
	  (puthash hl-part hl-content new-line)
	  (widen)
	  )
	)
      (widen)
      )
    (setq parties '("Intro" "Souvenir" "Évocation"
                    "Prototype 1" "Prototype 2" "Prototype 3"  "Prototype 4" "Prototype 5"
                    "Classement" "Vision holistique" "C" "R" "Y"))


    (setq momo 0)
;; tete du tableau
    (with-temp-buffer
      (setq nono 0)
      (insert "\n<table class=\"table table-striped table-bordered\" style=\"table-layout:fixed;\">
<col width=\"500\">
<col width=\"500\">
<col width=\"500\">
<col width=\"500\">
<col width=\"500\">
<col width=\"500\">
<col width=\"500\">
<col width=\"500\">
<col width=\"500\">
<tr style=\"\">\n")
      (while (< nono (length hl-list))
	(insert "<td>" (nth nono titre-list) "</td>")
	(setq nono (+ 1 nono))
	)
      (insert "</tr>\n")


;; corps du tableau

      (while (< momo (length parties))
	(setq partie (nth momo parties))

	(insert "<tr  class=\"" (replace-regexp-in-string " " "_" partie)  "_toggler\">")
	(setq nono 0)
	(while (< nono (length hl-list))
	  (insert "<td><div type=\"button\" class=\"btn btn-info\" style=\"\">" partie " " (nth nono titre-list) "</div></td>")
	  (setq nono (+ 1 nono))
	  )

	(insert "</tr>\n
<tr  class=\"" (replace-regexp-in-string " " "_" partie) "\">")
	(setq nono 0)
	(while (< nono (length hl-list))
	  (setq contenu (gethash partie (nth nono hl-list)))
	  (insert "\n<td class=\"" (nth nono titre-list) "\">" contenu "</td>")
	  (setq nono (+ 1 nono))
	  )
	(setq momo (+ 1 momo))
	(insert "</tr>")
	)
      (insert "</table>\n")
      (append-to-buffer "ensemble.html" (point-min) (point-max))

      )

;; javascript
    ;; (setq momo 0)
    ;; (with-temp-buffer
    ;;   (while (< momo (length parties))
    ;; 	(setq partie (nth momo parties))
    ;; 	(insert " $('." (replace-regexp-in-string " " "_" partie) "_toggler ').click(function(){$('." (replace-regexp-in-string " " "_" partie) "').slideToggle();});\n")
    ;; 	(setq momo (+ 1 momo))
    ;; 	)
    ;;   (append-to-buffer "ensemble.html" (point-min) (point-max))
    ;;   )

    
    ))

;; * position to kill ring
(defun position-to-kill-ring ()                                         
  "Copy to the kill ring a string in the format \"file-name:line-number\"
for the current buffer's file name, and the line number at point."      
  (interactive)                                                         
  (save-excursion
    (outline-previous-visible-heading 1)
    (setq partie (nth 4 (org-heading-components)))   ;;
    (outline-up-heading 1)
    (setq reunion (nth 4 (org-heading-components)))   ;;
    )

  (save-excursion
    (if    (re-search-backward "^_- \\([0-9:]*\\) ::_ " nil t)
	(setq pos (substring-no-properties (match-string 1)))
      (setq pos "Temps"))
    )

  (save-excursion
    (beginning-of-line)
    (if    (re-search-forward "^\\*\\(.*\\)\\* : " (+ 10 (point)) t)
	(setq nom (substring-no-properties (match-string 1)))
      (setq nom "Nom")))

  (save-excursion
    (beginning-of-line)
    (setq line    (buffer-substring-no-properties (line-beginning-position) (line-end-position))))
  (setq org-refile-use-cache nil)
  (setq org-refile-targets (quote (("/home/azyvers/org/ateliers/04-2014/SNAP/verbatims.org" :tag . "collection"))))
  (setq extrait  (format "- [[%s::%d][%s %s (%s)]] :: %s" (buffer-file-name) (save-restriction (widen) (line-number-at-pos)) reunion (replace-regexp-in-string " " "_" partie) pos line))
  (with-temp-buffer
    (insert extrait)
    (org-mode)
    (mark-whole-buffer)
    (org-refile))

  ;; (kill-new                                                             
  ;;  (format "- [[%s::%d][%s %s (%s)]] :: *%s* : %s" (buffer-file-name) (save-restriction (widen) (line-number-at-pos)) reunion (replace-regexp-in-string " " "_" partie) pos nom line))

  )

;; * org-protocol with conkeror
;; ;; the 'w' corresponds with the 'w' used before as in:
;;   emacsclient \"org-protocol:/capture:/w/  [...]
(setq org-capture-templates
  '(
     ("w" "" entry ;; 'w' for 'org-protocol'
       (file+headline "www.org" "Notes")
       "* %^{Title}\n\n  Source: %u, %c\n\n  %i")
     ;; other templates
))
;; * sanitize
(defun sanitize()
  (interactive)
  (save-excursion
    (goto-char (point-min)) (query-replace-regexp "\\<faut il\\>"  "faut-il")
    (goto-char (point-min)) (query-replace-regexp "\\<dites moi\\>"  "dites-moi")
    (goto-char (point-min)) (query-replace-regexp "\\<dites vous\\>"  "dites-vous")
    (goto-char (point-min)) (query-replace-regexp "\\<de façon naturel\\>"  "de façon naturelle")
    (goto-char (point-min)) (query-replace-regexp "\\<sus\\>"  "suis")
    (goto-char (point-min)) (query-replace-regexp "\\<j'en met\\>"  "j'en mets")
;;    (goto-char (point-min)) (query-replace-regexp "\\<d'une\\>"  "d'en")
    (goto-char (point-min)) (query-replace-regexp "\\<l'avant bras\\>"  "l'avant-bras")
    (goto-char (point-min)) (query-replace-regexp "\\<que faites vous\\>"  "que faites-vous")
    (goto-char (point-min)) (query-replace-regexp "manoeuvre"  "manœuvre")
    (goto-char (point-min)) (query-replace-regexp "oeuvre"  "œuvre")
    (goto-char (point-min)) (query-replace-regexp "soeur"  "sœur")
    (goto-char (point-min)) (query-replace-regexp "coeur"  "cœur")
    (goto-char (point-min)) (query-replace-regexp "boeuf"  "bœuf")
    (goto-char (point-min)) (query-replace-regexp "\\<oeil\\>"  "œil")
    (goto-char (point-min)) (query-replace-regexp "\\<l'oeil\\>"  "l'œil")
    (goto-char (point-min)) (query-replace-regexp "\\<quelque fois\\>"  "quelques fois")
    (goto-char (point-min)) (query-replace-regexp "\\<ça ça\\>"  "ça, ça")
    (goto-char (point-min)) (query-replace-regexp "\\<li\\>"  "il")
;;    (goto-char (point-min)) (query-replace-regexp "\\([^0-9\\(trois\\|quatre\\|cinq\\|deux\\)]\\) \\<ans\\>"  "\\1 dans")
;;    (goto-char (point-min)) (query-replace-regexp "\\<ne \\([,.]*\\) pas\\>"  "en")
    (goto-char (point-min)) (query-replace-regexp "\\<sauré\\>"  "sauté")
    (goto-char (point-min)) (query-replace-regexp "\\<quo\\>"  "qui")
    (goto-char (point-min)) (query-replace-regexp "\\<no\\>"  "on")
    (goto-char (point-min)) (query-replace-regexp "\\<\\([^t][^u]\\) as\\>"  "\\1 pas")
    (goto-char (point-min)) (query-replace-regexp "\\<in\\>"  "un")
    (goto-char (point-min)) (query-replace-regexp "\\<ales\\>"  "a les")
    (goto-char (point-min)) (query-replace-regexp "\\<ale\\>"  "a le")
    (goto-char (point-min)) (query-replace-regexp "\\<fat\\>"  "faut")
    (goto-char (point-min)) (query-replace-regexp "\\<aune\\>"  "a une")
    (goto-char (point-min)) (query-replace-regexp "\\<une je\\>"  "que je")
    (goto-char (point-min)) (query-replace-regexp "\\<sil\\>"  "s il")
    (goto-char (point-min)) (query-replace-regexp "\\<in\\>"  "un")
    (goto-char (point-min)) (query-replace-regexp "moi même"  "moi-même")
    (goto-char (point-min)) (query-replace-regexp "quand même"  "quand-même")
    (goto-char (point-min)) (query-replace-regexp "toi même"  "toi-même")
    (goto-char (point-min)) (query-replace-regexp "lui même"  "lui-même")
    (goto-char (point-min)) (query-replace-regexp "soi même"  "soi-même")
    (goto-char (point-min)) (query-replace-regexp "\\<eux même\\>"  "eux-mêmes")
    (goto-char (point-min)) (query-replace-regexp "vous même"  "vous-même")
    (goto-char (point-min)) (query-replace-regexp "nous même"  "nous-même")
    (goto-char (point-min)) (query-replace-regexp "là bas"  "là-bas")
    (goto-char (point-min)) (query-replace-regexp "au delà"  "au-delà")
    (goto-char (point-min)) (query-replace-regexp "au dessus"  "au-dessus")
    (goto-char (point-min)) (query-replace-regexp "après vente"  "après-vente")
    (goto-char (point-min)) (query-replace-regexp "libre service"  "libre-service")
    (goto-char (point-min)) (query-replace-regexp "\\<n y\\>"  "n'y")
    (goto-char (point-min)) (query-replace-regexp "là dedans"  "là-dedans")
    (goto-char (point-min)) (query-replace-regexp "là dessus"  "là-dessus")
    (goto-char (point-min)) (query-replace-regexp "là dessous"  "là-dessous")

    (goto-char (point-min)) (query-replace-regexp "\\<ce \\([^ ]*\\) là\\>"  "ce \\1-là")
    (goto-char (point-min)) (query-replace-regexp "\\<ce \\([^ ]*\\) ci\\>"  "ce \\1-ci")
    (goto-char (point-min)) (query-replace-regexp "\\<ces \\([^ ]*\\) là\\>"  "ces \\1-là")
    (goto-char (point-min)) (query-replace-regexp "\\<cette \\([^ ]*\\) là\\>"  "cette \\1-là")
    (goto-char (point-min)) (query-replace-regexp "\\<cet \\([^ ]*\\) là\\>"  "cet \\1-là")
    (goto-char (point-min)) (query-replace-regexp "celui là"  "celui-là")
    (goto-char (point-min)) (query-replace-regexp "celui ci"  "celui-ci")
    (goto-char (point-min)) (query-replace-regexp "celle ci"  "celle-ci")
    (goto-char (point-min)) (query-replace-regexp "celle là"  "celle-là")
    (goto-char (point-min)) (query-replace-regexp "je me suis dis"  "je me suis dit")
    ;;(goto-char (point-min)) (query-replace-regexp "\\<n y a"  "n'y a")
    (goto-char (point-min)) (query-replace-regexp "a t elle\\>"  "a-t-elle")
    (goto-char (point-min)) (query-replace-regexp "a t il\\>"  "a-t-il")
    (goto-char (point-min)) (query-replace-regexp "\\<a t il\\>"  "a-t-il")
    (goto-char (point-min)) (query-replace-regexp " t il\\>"  "-t-il")
    (goto-char (point-min)) (query-replace-regexp "\\<est ce que\\>"  "est-ce que")
    (goto-char (point-min)) (query-replace-regexp "\\<qu'est ce que\\>"  "qu'est-ce que")
    (goto-char (point-min)) (query-replace-regexp "\\<ils on\\>"  "ils ont")
    (goto-char (point-min)) (query-replace-regexp "\\<te\\>"  "et")
    (goto-char (point-min)) (query-replace-regexp "\\<et là "  "et là, ")
    (goto-char (point-min)) (query-replace-regexp "\\<je \\([^ ]*\\)end pas\\>"  "je ne \\1ends pas")
    (goto-char (point-min)) (query-replace-regexp "\\<je ne \\([^ ]*\\)end pas\\>"  "je ne \\1ends pas")
    (goto-char (point-min)) (query-replace-regexp "\\<je \\([^ ]*\\)end\\>"  "je \\1ends")
    (goto-char (point-min)) (query-replace-regexp "\\<je ne prend\\>"  "je ne prends")
    (goto-char (point-min)) (query-replace-regexp "\\<j'ai fais\\>"  "j'ai fait")
    (goto-char (point-min)) (query-replace-regexp "\\<je l'ai fais\\>"  "je l'ai fait")
    (goto-char (point-min)) (query-replace-regexp "\\<j'en ai fais\\>"  "j'en ai fait")
    (goto-char (point-min)) (query-replace-regexp "\\<je met\\>"  "je mets")
    (goto-char (point-min)) (query-replace-regexp "\\<j'ai dis\\>"  "j'ai dit")
    (goto-char (point-min)) (query-replace-regexp "\\<j'ai fais\\>"  "j'ai fait")
    (goto-char (point-min)) (query-replace-regexp "\\<c'est pas\\>"  "ce n'est pas")
    (goto-char (point-min)) (query-replace-regexp "\\<j'ai pas\\>"  "je n'ai pas")
    (goto-char (point-min)) (query-replace-regexp "\\<je \\([^ ]*\\)ait\\>"  "je \\1ais")
    (goto-char (point-min)) (query-replace-regexp "\\<je \\([^n ][^' ][^ ]*\\) pas\\>"  "je ne \\1 pas")
    (goto-char (point-min)) (query-replace-regexp "\\<je ne \\([^ ]*\\)ait\\>"  "je ne \\1ais")
    (goto-char (point-min)) (query-replace-regexp "\\<j'\\([^ ]*\\) pas\\> "  "je n'\\1 pas")
    (goto-char (point-min)) (query-replace-regexp "\\<t'\\([^ ]*\\) pas\\> "  "tu n'\\1 pas")
    (goto-char (point-min)) (query-replace-regexp "\\([^ ]ez\\)\\ \\(vous\\)"  "\\1-\\2")
    (goto-char (point-min)) (query-replace-regexp "\\<ça \\([^ ]*[^m]\\)ais\\>"  "ça \\1ait")
    (goto-char (point-min)) (query-replace-regexp " '\\(\\w\\)"  " \\1'")
    (goto-char (point-min)) (query-replace-regexp "\\<\\([^ ]*ez\\) moi\\>"  "\\1-moi")
    (goto-char (point-min)) (query-replace-regexp "\\<à \\([^ ]*\\)é\\>"  "à \\1er")
    (goto-char (point-min)) (query-replace-regexp "\\<lui même\\>"  "lui-même")
    (goto-char (point-min)) (query-replace-regexp "\\<elle même\\>"  "elle-même")
    (goto-char (point-min)) (query-replace-regexp "\\<cendre\\>"  "vendre")

;;     (goto-char (point-min)) (query-replace-regexp "\\<les \\([^ 
;; ]*[^\\(
;; \\|er\\|ir\\|ez\\|endre\\|s\\|x\\|it\\)0-9]\\)\\>"  "les \\1s")
;;     (goto-char (point-min)) (query-replace-regexp "\\<des \\([^ 
;; ]*[^\\(
;; \\|er\\|ir\\|ez\\|endre\\|s\\|x\\|it\\)0-9]\\)\\>"  "des \\1s")
;;     (goto-char (point-min)) (query-replace-regexp "\\<mes \\([^ 
;; ]*[^\\(
;; \\|er\\|ir\\|ez\\|endre\\|s\\|x\\|it\\)0-9]\\)\\>"  "mes \\1s")
;;     (goto-char (point-min)) (query-replace-regexp "\\<tes \\([^ 
;; ]*[^\\(
;; \\|er\\|ir\\|ez\\|endre\\|s\\|x\\|it\\)0-9]\\)\\>"  "tes \\1s")
;;     (goto-char (point-min)) (query-replace-regexp "\\<ses \\([^ 
;; ]*[^\\(
;; \\|er\\|ir\\|ez\\|endre\\|s\\|x\\|it\\)0-9]\\)\\>"  "ses \\1s")
;;     (goto-char (point-min)) (query-replace-regexp "\\<leurs \\([^ 
;; ]*[^\\(
;; \\|er\\|ir\\|ez\\|endre\\|s\\|x\\|it\\)0-9]\\)\\>"  "leurs \\1s")
;;     (goto-char (point-min)) (query-replace-regexp "\\<nos \\([^ 
;; ]*[^\\(
;; \\|er\\|ir\\|ez\\|endre\\|s\\|x\\|it\\)0-9]\\)\\>"  "nos \\1s")
;;     (goto-char (point-min)) (query-replace-regexp "\\<vos \\([^ 
;; ]*[^\\(
;; \\|er\\|ir\\|ez\\|endre\\|s\\|x\\|it\\)0-9]\\)\\>"  "vos \\1s")

    (goto-char (point-min)) (replace-regexp "\\<[^aày0-9A-Z%]\\>"  "\\?")
    )
  )
;; * little dd 
(defun dd()
  (interactive)
  (goto-char (point-min)))

;; * zap up to char
(autoload 'zap-up-to-char "misc"
    "Kill up to, but not including ARGth occurrence of CHAR.

  \(fn arg char)"
    'interactive)
(global-set-key "\M-z" 'zap-up-to-char)
;; * MULTI BDC
;; (defun multibdc()
;;   (interactive)
;;   (save-excursion
;;     (dd)
;;     (setq counter 0
;; 	  etudes '())
;;     (setq etudes (org-map-entries (lambda()
;; 				    (let(w)
;; 				      (if (looking-at org-complex-heading-regexp)
;; 					  (setq w (substring-no-properties (match-string 4)))))
;; 				    ) "+ET"))
    
;;     (message "%S" etudes)
;;     (dd)
;;     (while etudes
;;       (setq counter (+ 1 counter)
;; 	    etude (pop etudes))
      
;;       (search-forward etude)
;;       (setq reference (org-map-entries (lambda()
;; 					 (let(z)
;; 					   (if (looking-at org-complex-heading-regexp)
;; 					       (setq z (substring-no-properties (match-string 4)))))) nil 'tree)    
;; 	    mission (pop reference)
;; 	    total-temps 0
;; 	    dates '())

;;       (if (looking-at org-complex-heading-regexp)
;; 	  (setq client (substring (substring-no-properties (match-string 5)) 4 -1)))


;;       (save-excursion
;; 	(while reference 
;; 	  (setq ref (pop reference))

;; 	  (if (string-match "\\([0-9]\\{2\\}\\):\\([0-9]\\{2\\}\\)-\\([0-9]\\{2\\}\\):\\([0-9]\\{2\\}\\)" ref)
;; 	      (progn 
;; 		(with-temp-buffer
;; 		  (insert ref)
;; 		  (dd)
;; 		  (while (re-search-forward "\\([0-9]\\{2\\}\\):\\([0-9]\\{2\\}\\)-\\([0-9]\\{2\\}\\):\\([0-9]\\{2\\}\\)" nil t)
;; 		    (setq
;; 		     heure-debut (concat (match-string 1) ":" (match-string 2))
;; 		     heure-fin (concat (match-string 3) ":" (match-string 4))
;; 		     debut-en-secondes (aziz-time-string-to-seconds heure-debut)
;; 		     fin-en-secondes (aziz-time-string-to-seconds heure-fin)
;; 		     temps-en-secondes (- fin-en-secondes debut-en-secondes)
;; 		     effort (org-time-seconds-to-string (- fin-en-secondes debut-en-secondes))
;; 		     )
;; 		    (setq total-temps (+ temps-en-secondes total-temps))
;; 		    )
;; 		  )
;; 		(dd)
;; 		(search-forward ref)
;; 		(org-entry-put nil "Effort" effort))
;; 	    (if (not (string= (org-entry-get nil "Effort") "nil")) 
;; 		(setq total-temps (+ (org-time-string-to-seconds (org-entry-get nil "Effort")) total-temps))
;; 	      (org-entry-put nil "Effort" "0")))
;; 	  )
;; 	)
;;       (progn
;; 	(find-file "~/org/clients.org")
;; 	(widen)
;; 	(goto-char (point-min))
;; 	(goto-char  (search-forward client))
;; 	(org-narrow-to-subtree)
;; 	(setq ensemble (org-entry-properties))
;; 	(kill-buffer)
;; 	)
;;       ;; (while ensemble
;;       ;; 	(setq
;;       ;; 	 unite (pop ensemble)
;;       ;; 	 propriete (car unite)
;;       ;; 	 valeur (cdr unite)
;;       ;; 	 )
;;       ;; 	(if (or (member propriete '("Taux2" "TAGS" "FILE" "ALLTAGS" "BLOCKED" "CATEGORY")) (member valeur '("#")))
;;       ;; 	    (message "")
;;       ;; 	  (org-entry-put nil propriete valeur)
;;       ;; 	  )
;;       ;; 	)
;;       (org-entry-put nil "Effort" (org-time-seconds-to-string total-temps))
;;       (org-entry-put nil "Taux" (number-to-string (read-from-minibuffer "Tarif horaire: " "45.0" nil t nil "45.0")))
;;       (org-entry-put nil "HT" (format "%.2f" (* (string-to-number (org-entry-get nil "Taux")) (/ total-temps 3600.00))))
;;       )
;;     )
;;   )

;; * help multi bdc
(defun whatefort()
  (with-current-buffer (buffer-name)
    (org-entry-get nil "Effort")
    ) 
  )

(defun ht(s op)
  "HT prend en argument un nombre de secondes (s) et une expression string"
  (setq 
   unite (/ s 3600.00)
   factaux (if (org-entry-get nil "FAC_Taux") (string-to-number (org-entry-get nil "FAC_Taux")) 45.0)
   saltaux (if (org-entry-get nil "SAL_Taux") (string-to-number (org-entry-get nil "SAL_Taux")) 25.0)
   facture_ht (* factaux unite)
   facture_tva (* 0.2 (* factaux unite)) 
   facture_ttc (* 1.2 (* factaux unite))
   facture_net (/ (* factaux unite) 2.041639)
   
   salaire_brut (* saltaux unite)
   salaire_net1 (* (* saltaux unite) 0.83)
   conge (/ (* salaire_brut 10) 100)
   primvaca (* (+ salaire_brut conge) (/ 4.0 100)) 
   base (+ salaire_brut conge primvaca)
   char-sala (* base 0.21273463378726537)
   char-patro (* base 0.42602816287026807)
   salaire_cout (+ base char-patro)
   salaire_net2 (- base char-sala)
   salaire_impot (* salaire_net2 0.14)
   )
  (cond 
   ((string= op "un")  unite)
   ((string= op "facht")  facture_ht)
   ((string= op "factva") facture_tva)
   ((string= op "facttc") facture_ttc)
   ((string= op "facnet") facture_net)
   ((string= op "salbrut")  salaire_brut)
   ((string= op "salnet1")  salaire_net1)
   ((string= op "salnet2")  salaire_net2)
   ((string= op "salcout")  salaire_cout)
   ((string= op "impot")  salaire_impot)
   (t 0)
   )
  )

(defun gaph(x)
  "X est un string. GAPH cherche une formule de type HH:MM-HH:MM dans X, calcul 
la durée entre les deux horaires et retourne une liste (secondes \"HH:MM:SS\")"
  (with-temp-buffer
    (insert x)
    (dd)
    (while (re-search-forward "\\([0-9]\\{2\\}\\):\\([0-9]\\{2\\}\\)-\\([0-9]\\{2\\}\\):\\([0-9]\\{2\\}\\)" nil t)
      (setq
       heure-debut (concat (match-string 1) ":" (match-string 2))
       heure-fin (concat (match-string 3) ":" (match-string 4))
       debut-en-secondes (aziz-time-string-to-seconds heure-debut)
       fin-en-secondes (aziz-time-string-to-seconds heure-fin)
       temps-en-secondes (- fin-en-secondes debut-en-secondes)
       effort (org-time-seconds-to-string (- fin-en-secondes debut-en-secondes))
       )
      )
    )
  (list temps-en-secondes effort)
  )
;; * multibdc
(defun multibdc()    
  (interactive)
  (save-excursion
    (setq 
     etude-tag "+ET"
     duration-regexp "\\([0-9]\\{2\\}\\):\\([0-9]\\{2\\}\\)-\\([0-9]\\{2\\}\\):\\([0-9]\\{2\\}\\)"
     duration-property-string "Effort"
     etudes-headings (org-map-entries (lambda()
					(let(w)
					  (if (looking-at org-complex-heading-regexp)
					      (setq w (substring-no-properties (match-string 4)))))) etude-tag))
    ;; POUR CHAQUE ÉTUDE
    (while etudes-headings
      (setq current-etude-heading (pop etudes-headings)
	    current-etude-time-sum 0)
      (dd)
      (search-forward current-etude-heading)
      (setq etude-arbre (org-map-entries (lambda()
					   (let(z)
					     (if (looking-at org-complex-heading-regexp)
						 (setq z (substring-no-properties (match-string 4)))))) nil 'tree)
	    
	    garbage-etude-heading (pop etude-arbre)
	    missions-list etude-arbre)
      ;; POUR CHAQUE MISSION
      (while missions-list
	(setq current-mission (pop missions-list))
	(search-forward current-mission)
	(if (string-match duration-regexp current-mission) 
	    (setq temps-list (gaph current-mission)))
	(if (not (string-match duration-regexp current-mission))
	    (setq temps-list (list (org-time-string-to-seconds (whatefort)) (whatefort))))
	(if (not (whatefort))
	    (org-entry-put nil duration-property-string  (nth 1 temps-list)))
	(if (not (string= (whatefort) (nth 1 temps-list)))
	    (org-entry-put nil "WARNING"  (nth 1 temps-list)))
	
	(setq current-etude-time-sum (+ (nth 0 temps-list) current-etude-time-sum))
	)
      ;; POUR CHAQUE ÉTUDE
      (dd)
      (search-forward current-etude-heading)
      (org-entry-put nil duration-property-string (org-time-seconds-to-string current-etude-time-sum))
      (org-entry-put nil "FAC_Taux" (number-to-string (read-from-minibuffer (concat "Tarif horaire pour " current-etude-heading " : ") "45.0" nil t nil "45.0")))
      (org-entry-put nil "UNIT" (format "%.2f" (ht current-etude-time-sum "un")))
      (org-entry-put nil "FAC_HT"   (format "%.2f" (ht current-etude-time-sum  "facht")))
      (org-entry-put nil "FAC_TVA"   (format "%.2f" (ht current-etude-time-sum "factva")))
      (org-entry-put nil "FAC_TTC"   (format "%.2f" (ht current-etude-time-sum "facttc")))
      (org-entry-put nil "FAC_NET"   (format "%.2f" (ht current-etude-time-sum "facnet")))
      (setq ttoo (org-entry-get nil "FAC_Taux"))
      ;; POUR CHAQUE MISSION
      (while etude-arbre
	(search-forward (pop etude-arbre))
	(org-entry-put nil "FAC_Taux" ttoo)
	(org-entry-put nil "UNIT"     (format "%.2f" (ht (org-time-string-to-seconds (whatefort)) "un")))
	(org-entry-put nil "FAC_NET"  (format "%.2f" (ht (org-time-string-to-seconds (whatefort)) "facnet")))
	(org-entry-put nil "FAC_HT"   (format "%.2f" (ht (org-time-string-to-seconds (whatefort))  "facht")))
	(org-entry-put nil "FAC_TVA"  (format "%.2f" (ht (org-time-string-to-seconds (whatefort)) "factva")))
	(org-entry-put nil "FAC_TTC"  (format "%.2f" (ht (org-time-string-to-seconds (whatefort)) "facttc")))
	)
      )
    ;; POUR L'ENSEMBLE 
    )
  )
;; * dired jump
(defun dired-jump-and-kill()
  (interactive)
  (setq tokill (current-buffer))
  (dired-jump)
  (kill-buffer tokill))
(global-set-key			(kbd "C-x C-j")	'dired-jump-and-kill)

(defun yank-to-x-clipboard ()
  (interactive)
  (if (region-active-p)
        (progn
	  (shell-command-on-region (region-beginning) (region-end) "xsel -i -b")
	  (clipboard-kill-ring-save (region-beginning) (region-end))
	  (message "Yanked region to clipboard!")
	  (deactivate-mark))
    (message "No region active; can't yank to clipboard!")))

(global-set-key "\M-w" 'yank-to-x-clipboard)


;; * Salaire
(defun multisalaire()    
  (interactive)
  (save-excursion 
    (setq 
     etude-tag "+ET"
     duration-regexp "\\([0-9]\\{2\\}\\):\\([0-9]\\{2\\}\\)-\\([0-9]\\{2\\}\\):\\([0-9]\\{2\\}\\)"
     duration-property-string "Effort"
     etudes-headings (org-map-entries 
		      (lambda()
			(let(w)
			  (if (looking-at org-complex-heading-regexp)
			      (setq w (substring-no-properties (match-string 4)))))) etude-tag))
    ;; POUR CHAQUE ÉTUDE
    (while etudes-headings
      (setq current-etude-heading (pop etudes-headings)
	    current-etude-time-sum 0)
      (dd)
      (search-forward current-etude-heading)
      (setq etude-arbre (org-map-entries 
			 (lambda()
			   (let(z)
			     (if (looking-at org-complex-heading-regexp)
				 (setq z (substring-no-properties (match-string 4)))))) nil 'tree)
	    
	    garbage-etude-heading (pop etude-arbre)
	    missions-list etude-arbre)
      ;; POUR CHAQUE MISSION
      (while missions-list
	(setq current-mission (pop missions-list))
	(search-forward current-mission)
	(if (string-match duration-regexp current-mission) 
	    (setq temps-list (gaph current-mission)))
	(if (not (string-match duration-regexp current-mission))
	    (setq temps-list (list (org-time-string-to-seconds (whatefort)) (whatefort))))
	
	(if (not (whatefort))
	    (org-entry-put nil duration-property-string  (nth 1 temps-list)))
	(if (not (string= (whatefort) (nth 1 temps-list)))
	    (org-entry-put nil "WARNING"  (nth 1 temps-list)))
	
	(setq current-etude-time-sum (+ (nth 0 temps-list) current-etude-time-sum))
	)
      ;; POUR CHAQUE ÉTUDE
      (dd)
      (search-forward current-etude-heading)
      (org-entry-put nil duration-property-string (org-time-seconds-to-string current-etude-time-sum))
      (org-entry-put nil "SAL_Taux" (number-to-string (read-from-minibuffer (concat "Tarif horaire pour " current-etude-heading " : ") "25.0" nil t nil "25.0")))
      (org-entry-put nil "UNIT" (format "%.2f" (ht current-etude-time-sum "un")))
      (org-entry-put nil "SAL_Brute"   (format "%.2f" (ht current-etude-time-sum "salbrut")))
      (org-entry-put nil "SAL_NET1"   (format "%.2f" (ht current-etude-time-sum "salnet1")))
      (org-entry-put nil "SAL_NET2"   (format "%.2f" (ht current-etude-time-sum "salnet2")))
      (org-entry-put nil "SAL_COUT"   (format "%.2f" (ht current-etude-time-sum "salcout")))
      (org-entry-put nil "SAL_IMPOT"   (format "%.2f" (ht current-etude-time-sum "impot")))
      (setq ttoo (org-entry-get nil "SAL_Taux"))
      ;; POUR CHAQUE MISSION
      (while etude-arbre
	(search-forward (pop etude-arbre))
	(org-entry-put nil "SAL_Taux" ttoo)
	(org-entry-put nil "UNIT" (format "%.2f" (ht (org-time-string-to-seconds (whatefort)) "un")))
	(org-entry-put nil "SAL_Brute"   (format "%.2f" (ht (org-time-string-to-seconds (whatefort)) "salbrut")))
	(org-entry-put nil "SAL_NET1"   (format "%.2f" (ht  (org-time-string-to-seconds (whatefort)) "salnet1")))
	(org-entry-put nil "SAL_NET2"   (format "%.2f" (ht  (org-time-string-to-seconds (whatefort)) "salnet2")))
	(org-entry-put nil "SAL_COUT"   (format "%.2f" (ht  (org-time-string-to-seconds (whatefort)) "salcout")))
	(org-entry-put nil "SAL_IMPOT"   (format "%.2f" (ht (org-time-string-to-seconds (whatefort)) "impot")))
	)
      )
    ;; POUR L'ENSEMBLE 
    )
  )




;; * browse with conkeror OFF
(setq browse-url-generic-program (executable-find "conkeror"))
(setq browse-url-browser-function 'browse-url-generic)

;; (defcustom browse-url-browser-function
;;   'browse-url-default-browser
;;   "Function to display the current buffer in a WWW browser.
;; This is used by the `browse-url-at-point', `browse-url-at-mouse', and
;; `browse-url-of-file' commands.

;; If the value is not a function it should be a list of pairs
;; \(REGEXP . FUNCTION).  In this case the function called will be the one
;; associated with the first REGEXP which matches the current URL.  The
;; function is passed the URL and any other args of `browse-url'.  The last
;; regexp should probably be \".\" to specify a default browser."
;;   :type '(choice
;; 	  (function-item :tag "Emacs W3" :value  browse-url-w3)
;; 	  (function-item :tag "W3 in another Emacs via `gnudoit'"
;; 			 :value  browse-url-w3-gnudoit)
;; 	  (function-item :tag "Mozilla" :value  browse-url-mozilla)
;; 	  (function-item :tag "Firefox" :value browse-url-firefox)
;; 	  (function-item :tag "Conkeror" :value browse-url-conkeror)
;; 	  (function-item :tag "Chromium" :value browse-url-chromium)
;; 	  (function-item :tag "Galeon" :value  browse-url-galeon)
;; 	  (function-item :tag "Epiphany" :value  browse-url-epiphany)
;; 	  (function-item :tag "Netscape" :value  browse-url-netscape)
;; 	  (function-item :tag "Mosaic" :value  browse-url-mosaic)
;; 	  (function-item :tag "Mosaic using CCI" :value  browse-url-cci)
;; 	  (function-item :tag "Text browser in an xterm window"
;; 			 :value browse-url-text-xterm)
;; 	  (function-item :tag "Text browser in an Emacs window"
;; 			 :value browse-url-text-emacs)
;; 	  (function-item :tag "KDE" :value browse-url-kde)
;; 	  (function-item :tag "Elinks" :value browse-url-elinks)
;; 	  (function-item :tag "Specified by `Browse Url Generic Program'"
;; 			 :value browse-url-generic)
;; 	  (function-item :tag "Default Windows browser"
;; 			 :value browse-url-default-windows-browser)
;; 	  (function-item :tag "Default Mac OS X browser"
;; 			 :value browse-url-default-macosx-browser)
;; 	  (function-item :tag "GNOME invoking Mozilla"
;; 			 :value browse-url-gnome-moz)
;; 	  (function-item :tag "Default browser"
;; 			 :value browse-url-default-browser)
;; 	  (function :tag "Your own function")
;; 	  (alist :tag "Regexp/function association list"
;; 		 :key-type regexp :value-type function))
;;   :version "24.1"
;;   :group 'browse-url)

;; (defun browse-url-default-browser (url &rest args)
;;   "Find a suitable browser and ask it to load URL.
;; Default to the URL around or before point.

;; When called interactively, if variable `browse-url-new-window-flag' is
;; non-nil, load the document in a new window, if possible, otherwise use
;; a random existing one.  A non-nil interactive prefix argument reverses
;; the effect of `browse-url-new-window-flag'.

;; When called non-interactively, optional second argument NEW-WINDOW is
;; used instead of `browse-url-new-window-flag'."
;;   (apply
;;    (cond
;;     ((memq system-type '(windows-nt ms-dos cygwin))
;;      'browse-url-default-windows-browser)
;;     ((memq system-type '(darwin))
;;      'browse-url-default-macosx-browser)
;;     ((browse-url-can-use-xdg-open) 'browse-url-xdg-open)
;;     ((executable-find browse-url-gnome-moz-program) 'browse-url-gnome-moz)
;;     ((executable-find browse-url-mozilla-program) 'browse-url-mozilla)
;;     ((executable-find browse-url-firefox-program) 'browse-url-firefox)
;;     ((executable-find browse-url-conkeror-program) 'browse-url-conkeror)
;;     ((executable-find browse-url-chromium-program) 'browse-url-chromium)
;;     ((executable-find browse-url-galeon-program) 'browse-url-galeon)
;;     ((executable-find browse-url-kde-program) 'browse-url-kde)
;;     ((executable-find browse-url-netscape-program) 'browse-url-netscape)
;;     ((executable-find browse-url-mosaic-program) 'browse-url-mosaic)
;;     ((executable-find browse-url-xterm-program) 'browse-url-text-xterm)
;;     ((locate-library "w3") 'browse-url-w3)
;;     (t
;;      (lambda (&rest ignore) (error "No usable browser found"))))
;;    url args))

;; (defcustom browse-url-conkeror-new-window-is-tab nil
;;   "Whether to open up new windows in a tab or a new window.
;; If non-nil, then open the URL in a new tab rather than a new window if
;; `browse-url-conkeror' is asked to open it in a new window.

;; This option is currently ignored on MS-Windows, since the necessary
;; functionality is not available there."
;;   :type 'boolean
;;   :group 'browse-url)

;; (defcustom browse-url-conkeror-program
;;   (let ((candidates '("conkeror" "iceweasel" "icecat")))
;;     (while (and candidates (not (executable-find (car candidates))))
;;       (setq candidates (cdr candidates)))
;;     (or (car candidates) "conkeror"))
;;   "The name by which to invoke Firefox."
;;   :type 'string
;;   :group 'browse-url)

;; (defcustom browse-url-conkeror-arguments nil
;;   "A list of strings to pass to Firefox as arguments."
;;   :type '(repeat (string :tag "Argument"))
;;   :group 'browse-url)

;; (defcustom browse-url-conkeror-startup-arguments browse-url-conkeror-arguments
;;   "A list of strings to pass to Firefox when it starts up.
;; Defaults to the value of `browse-url-conkeror-arguments' at the time
;; `browse-url' is loaded."
;;   :type '(repeat (string :tag "Argument"))
;;   :group 'browse-url)

;; (defun browse-url-conkeror (url &optional new-window)
;;   "Ask the Firefox WWW browser to load URL.
;; Default to the URL around or before point.  The strings in
;; variable `browse-url-conkeror-arguments' are also passed to
;; Firefox.

;; When called interactively, if variable
;; `browse-url-new-window-flag' is non-nil, load the document in a
;; new Firefox window, otherwise use a random existing one.  A
;; non-nil interactive prefix argument reverses the effect of
;; `browse-url-new-window-flag'.

;; If `browse-url-conkeror-new-window-is-tab' is non-nil, then
;; whenever a document would otherwise be loaded in a new window, it
;; is loaded in a new tab in an existing window instead.

;; When called non-interactively, optional second argument
;; NEW-WINDOW is used instead of `browse-url-new-window-flag'.

;; On MS-Windows systems the optional `new-window' parameter is
;; ignored.  Firefox for Windows does not support the \"-remote\"
;; command line parameter.  Therefore, the
;; `browse-url-new-window-flag' and `browse-url-conkeror-new-window-is-tab'
;; are ignored as well.  Firefox on Windows will always open the requested
;; URL in a new window."
;;   (interactive (browse-url-interactive-arg "URL: "))
;;   (setq url (browse-url-encode-url url))
;;   (let* ((process-environment (browse-url-process-environment))
;; 	 (use-remote
;; 	  (not (memq system-type '(windows-nt ms-dos))))
;; 	 (process
;; 	  (apply 'start-process
;; 		 (concat "conkeror " url) nil
;; 		 browse-url-conkeror-program
;; 		 (append
;; 		  browse-url-conkeror-arguments
;; 		  (if use-remote
;; 		      (list "-remote"
;; 			    (concat
;; 			     "openURL("
;; 			     url
;; 			     (if (browse-url-maybe-new-window new-window)
;; 				 (if browse-url-conkeror-new-window-is-tab
;; 				     ",new-tab"
;; 				   ",new-window"))
;; 			     ")"))
;; 		    (list url))))))
;;     ;; If we use -remote, the process exits with status code 2 if
;;     ;; Firefox is not already running.  The sentinel runs conkeror
;;     ;; directly if that happens.
;;     (when use-remote
;;       (set-process-sentinel process
;; 			    `(lambda (process change)
;; 			       (browse-url-conkeror-sentinel process ,url))))))

;; (defun browse-url-conkeror-sentinel (process url)
;;   "Handle a change to the process communicating with Firefox."
;;   (or (eq (process-exit-status process) 0)
;;       (let* ((process-environment (browse-url-process-environment)))
;; 	;; Firefox is not running - start it
;; 	(message "Starting Firefox...")
;; 	(apply 'start-process (concat "conkeror " url) nil
;; 	       browse-url-conkeror-program
;; 	       (append browse-url-conkeror-startup-arguments (list url))))))
;; * mkdir
(defun mdr()
(interactive)
(dired-create-directory (format-time-string "%y%m%d%H%M%S")))
