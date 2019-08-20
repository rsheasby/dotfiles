;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq doom-font (font-spec :family "Hack" :size 14))
(setq-default truncate-lines nil)
(setq scroll-margin 7)
(setq word-wrap t)
(setq-default select-enable-clipboard nil)
(setq-default org-export-preserve-breaks t)
(setq undo-tree-auto-save-history t)
(evil-escape-mode -1)
(add-hook! markdown-mode
  (auto-fill-mode -1))
(after! evil-snipe
  (evil-snipe-mode -1))
(remove-hook 'org-mode-hook #'auto-fill-mode)
(add-hook 'window-setup-hook 'toggle-frame-maximized t)


(def-package! inertial-scroll
  :commands (
             inertias-up
             inertias-down
             ))

(setq inertias-initial-velocity 75)
(setq inertias-friction 135)
(setq inertias-update-time 10)
(setq inertias-rest-coef 0.1)

(setq tex-open-quote "\"")
(setq tex-close-quote "\"")

(map! :nv "C-j" #'inertias-up)
(map! :nv "C-k" #'inertias-down)

(map! :nv ";" #'evil-ex)
(map! :nvo "-" #'evil-end-of-line)

(map! :map evil-treemacs-state-map "<ESC>" #'evil-window-next)
(map! :nvo (kbd "C-p") 'treemacs-select-window)

(map! :n (kbd "`") (lambda () (interactive)
                     (call-interactively 'evil-invert-char)
                     (evil-backward-char 1)
                     ))
(map! :v (kbd "`") (lambda () (interactive)
                     (call-interactively 'evil-invert-case)
                     (evil-normal-state)
                     (evil-visual-restore)
                     (if (eq evil-visual-selection 'line)
                         (evil-forward-char 1))
                     ))

(map! :v (kbd "C-/") (lambda () (interactive)
                       (call-interactively 'evil-commentary)
                       (evil-normal-state)
                       (evil-visual-restore)
                       ))
(map! :n (kbd "C-/") 'evil-commentary-line)

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
(map! :nv (kbd "\\j") #'avy-goto-line-below)
(map! :nv (kbd "\\k") #'avy-goto-line-above)
(map! :nv (kbd "\\w") #'avy-goto-word-0-below)
(map! :nv (kbd "\\b") #'avy-goto-word-0-above)
(map! :nv (kbd "\\f") #'avy-goto-char-in-line)
(map! :nv (kbd "\\s") #'avy-goto-char-2)
(map! :nv "M-j" #'evil-next-visual-line)
(map! :nv "M-k" #'evil-previous-visual-line)

(map! :map org-mode-map
      :localleader
      :prefix ("b" . "tables")
      "d" #'org-table-delete-column)
