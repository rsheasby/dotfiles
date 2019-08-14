;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq-default truncate-lines nil)
(setq word-wrap t)
(evil-escape-mode -1)
(add-hook! markdown-mode
  (auto-fill-mode -1))
(after! evil-snipe
  (evil-snipe-mode -1))

(map! :nv ";" #'evil-ex)
(map! :nvo "-" "$")
(map! :nvo (kbd "C-p") 'treemacs-select-window)
(map! :map evil-treemacs-State-map "<ESC>" 'evil-window-next)
(map! :n (kbd "`") (lambda () (interactive)
                     (call-interactively 'evil-invert-char)
                     (evil-backward-char 1)))
(map! :v (kbd "`") (lambda () (interactive)
                     (call-interactively 'evil-invert-case)
                     (evil-normal-state)
                     (evil-visual-restore)
                     (if (eq evil-visual-selection 'line)
                         (evil-forward-char 1))))
(map! :v (kbd "C-/") (lambda () (interactive)
                       (call-interactively 'evil-commentary)
                       (evil-normal-state)
                       (evil-visual-restore)))
(map! :n (kbd "C-/") 'evil-commentary-line)
