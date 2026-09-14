;; -*- lexical-binding: t; -*-
;; this mode is for writting and exporting my books,
;; philosophy reflexion into 
(add-hook 'org-mode-hook #'display-line-numbers-mode)

;; for org-journal
(require 'org-journal)
(setq org-journal-dir "~/Documents/Note/journal/")
(setq org-journal-carryover-delete-empty-journal 'always)
(setq org-journal-tag-alist "#+AUTHOR: Jules")
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))
(add-hook 'org-mode-hook #'org-modern-mode 1)
(setq org-startup-with-inline-images t) 
(setq image-animate-loop t)
(setq flyspell-issue-message-flag nil)
;; (with-eval-after-load 'org
;;   (set-face-attribute 'org-level-1 nil :height 0.8))

(setq org-startup-indented t)
(add-hook 'org-mode-hook #'variable-pitch-mode)
(fringe-mode 4)
;; (set-face-attribute 'org-block nil :inherit 'fixed-pitch)
;; (set-face-attribute 'org-code nil  :inherit 'fixed-pitch)
;; (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
;; (set-face-attribute 'org-meta-line nil :inherit 'fixed-pitch)
;; (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)
(setq org-pretty-entities t)
(setq org-hide-emphasis-markers t)

;; (use-package org-roam
;;   :ensure t
;;   :custom
;;   (org-roam-directory "/home/jlf/Documents/RoamNotes/")
;;   :bind (("C-*" . org-roam-buffer-toggle)
;;          ("C-ù" . org-roam-node-find)
;;          ("C-$" . org-roam-node-insert))
;;   :config
;;   (org-roam-setup))
;; (setq org-roam-db-location "~/.emacs.d/org-roam/org-roam.db")
(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "/home/jlf/Documents/RoamNotes/")
  (org-roam-db-location
   (expand-file-name "org-roam.db" org-roam-directory))
  :bind (("C-*" . org-roam-buffer-toggle)
         ("C-ù" . org-roam-node-find)
         ("C-$" . org-roam-node-insert))
  :config
  (org-roam-setup))

;; For multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key
 [f3]
 (lambda ()
   (interactive)
   (ispell-change-dictionary "francais")))
(global-set-key
 [f4]
 (lambda ()
   (interactive)
   (ispell-change-dictionary "english")))
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
(add-hook 'nov-mode-hook #'olivetti-mode)
(add-hook 'nov-mode-hook #'variable-pitch-mode)
(add-hook 'org-mode-hook
          (lambda ()
            (hl-line-mode 1)))
