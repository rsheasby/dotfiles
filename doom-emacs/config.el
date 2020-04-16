;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Ryan David Sheasby"
      user-mail-address "ryan@sheasby.dev")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Hack" :size 14))
(setq doom-big-font (font-spec :family "Hack" :size 20))


;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; My additions:

(setq scroll-margin 7)

;; Add gopath to exec-path
(setenv "PATH" (concat (getenv "PATH") ":~/go/bin"))
(setq exec-path (append exec-path '("~/go/bin")))

;; VIM Remaps:
(map! :nv ";" #'evil-ex)
(map! :nvo "-" #'evil-end-of-line)

;; Enable word wrap
(setq-default truncate-lines nil)
(setq word-wrap t)

;; Restore Vim substitute key
(after! evil-snipe
  (evil-snipe-mode -1))

;; Add remaps to move between buffers and kill them
(map! :nvo "C-h" #'centaur-tabs-backward)
(map! :nvo "C-l" #'centaur-tabs-forward)
(map! :nvo "C-d" #'kill-current-buffer)

;; Configure inertia plugin
(use-package! inertial-scroll
  :commands (
             inertias-up
             inertias-down
             ))

(setq inertias-initial-velocity 75)
(setq inertias-friction 135)
(setq inertias-update-time 10)
(setq inertias-rest-coef 0.1)

(map! :nv "C-j" #'inertias-up)
(map! :nv "C-k" #'inertias-down)

;; Restore vim increment and decrement operators with C-a and C-A
(map! :nv "C-a" 'evil-numbers/inc-at-pt)
(map! :nv "C-S-a" 'evil-numbers/dec-at-pt)

;; Enable undo history saving
(setq undo-tree-auto-save-history t)

;; Only use sytem clipboard when the leader key is used
(setq-default select-enable-clipboard nil)

(map! :nv (kbd "\\y") (lambda () (interactive)
                       (evil-use-register ?+)
                       (set--this-command-keys "y")
                       (call-interactively 'evil-yank)
                       ))
(map! :nv (kbd "\\p") (lambda () (interactive)
                       (evil-use-register ?+)
                       (call-interactively 'evil-paste-after)
                       ))
(map! :nv (kbd "\\P") (lambda () (interactive)
                       (evil-use-register ?+)
                       (call-interactively 'evil-paste-before)
                       ))

;; Add keymaps for commenting
(map! :n "C-/" 'evilnc-comment-or-uncomment-lines)
(map! :v "C-/" 'evilnc-comment-operator)

;; Treemacs config
(map! :nvo (kbd "C-p") 'treemacs-select-window)
(map! :map evil-treemacs-state-map "<ESC>" #'evil-window-next)

;; Configure avy (easymotion)
(map! :nv (kbd "\\j") #'avy-goto-line-below)
(map! :nv (kbd "\\k") #'avy-goto-line-above)
(map! :nv (kbd "\\w") #'avy-goto-word-0-below)
(map! :nv (kbd "\\b") #'avy-goto-word-0-above)
(map! :nv (kbd "\\f") #'avy-goto-char-in-line)
(map! :nv (kbd "\\s") #'avy-goto-char-2)

;; Alt J/K for visual movement with word wrapping
(map! :nv "M-j" #'evil-next-visual-line)
(map! :nv "M-k" #'evil-previous-visual-line)

;; Go auto fix imports on save
(add-hook! 'go-mode-hook (add-hook! 'before-save-hook :local 'gofmt-before-save))
(setq gofmt-command "goimports")

;; Fix projectile detection of go modules directory
(after! projectile
  (add-to-list 'projectile-project-root-files-bottom-up "go.mod"))

