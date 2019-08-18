;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq-default truncate-lines nil)
(setq word-wrap t)
(setq-default select-enable-clipboard nil)
(setq-default org-export-preserve-breaks t)
(evil-escape-mode -1)
(add-hook! markdown-mode
  (auto-fill-mode -1))
(after! evil-snipe
  (evil-snipe-mode -1))
(remove-hook 'org-mode-hook #'auto-fill-mode)

(map! :map evil-treemacs-state-map "<ESC>" #'evil-window-next)

(map! :nv ";" #'evil-ex)
(map! :nvo "-" #'evil-end-of-line)
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

(map! :map org-mode-map
      :localleader
      :prefix ("b" . "tables")
      "d" #'org-table-delete-column)
