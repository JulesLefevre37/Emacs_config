;; -*- lexical-binding: t; -*-
;; (require 'package)
;; (require 'doom-modeline)
;; (require 'dashboard)
;; (setq frame-resize-pixelwise t) 
;; (package-initialize)
;; (setq use-package-always-ensure t)(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; ;; and `package-pinned-packages`. Most users will not need or want to do nnthis.
;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; ;; (setq inhibit-startup-screen t)
;; (dashboard-setup-startup-hook)
;; (setq dashboard-startup-banner 'logo)
;; (setq dashboard-center-content t)
;; (setq make-backup-files t)
;; (push '(tool-bar-lines . 0) default-frame-alist)
;; (menu-bar-mode 0)
;; (scroll-bar-mode 0)
;; (unless (boundp 'mode-line-right-align-edge)
;;   (defvar mode-line-right-align-edge 'right-margin))
;; (setq doom-modeline-support-imenu t)
;; (doom-modeline-mode 1)
;; (setq-default cursor-type '(bar . 3))
;; (set-face-attribute 'default nil
;;                     :font "Jetbrains Mono"
;;                     :height 140)
;; ;; make backup name incremental by number, ending in ~1~ ~2~ etc
;; ;; note: only one backup is made when file is changed for first time, not every save
;; (global-visual-line-mode 1)
;; (setq version-control nil)
;; (setq delete-old-versions t)
;; ;; make sure hard link and creation date, owner, etc is preserved
;; (setq backup-by-copying t)
;; (setq auto-save-default nil)
;; (setq create-lockfiles nil)
;; (blink-cursor-mode 0)
;; (setq use-dialog-box nil)
;; (global-prettify-symbols-mode 1)
;; (setq mouse-highlight nil)
;; (setq max-mini-window-height 0.7)

;; (global-set-key [f5] #'save-buffer)
;; (global-set-key [f8] 'find-file)
;; (global-auto-revert-mode 1)
;; (setq global-auto-revert-non-file-buffers t)
;; (setq doom-modeline-total-line-number t)
;; (defun my/toggle-eat ()
;;   "Toggle Eat at the bottom of the frame."
;;   (interactive)
;;   (let ((eshell-buffer (get-buffer "*eshell*")))
;;     (if (and eshell-buffer
;;              (get-buffer-window eshell-buffer 'visible))
;;         (delete-windows-on eshell-buffer)
;;       (let ((display-buffer-alist
;;              '(("\\*eshell\\*"
;;                 (display-buffer-reuse-window
;;                  display-buffer-pop-up-window)
;;                 (window-height . 0.33)
;;                 (reusable-frames . visible)
;;                 (dedicated . t)))))
;;         (if eshell-buffer
;;             (display-buffer eshell-buffer)
;;           (eshell))))))

;; (global-set-key (kbd "C-!") 'my/toggle-eat)
;; (global-set-key (kbd "C-<tab>") 'other-window)
;; (global-set-key (kbd "C-:") 'ibuffer)

;; (global-set-key (kbd "C-;") 'kill-current-buffer)
;; (defun kill-buffer-and-fullscreen ()
;;   "Kill current buffer and make the remaining buffer fullscreen."
;;   (interactive)
;;   (kill-current-buffer)
;;   (delete-other-windows))

;; (global-set-key (kbd "C-;") #'kill-buffer-and-fullscreen)
;; (setq visible-bell t)
;; ;; 2. Programming mode hook
;; (load "~/.emacs.d/package.el")
;; (load "~/.emacs.d/programmingmode.el")
;; ;;(load "~/.emacs.d/note_and_writting_mode.el")
;; (setq backup-directory-alist
;;       `(("." . ,(expand-file-name "~/.emacs.d/save/"))))
;; ;; Org-mode section
;; (setq confirm-kill-emacs 'y-or-n-p)
;; (add-hook 'ibuffer-mode-hook #'nerd-icons-ibuffer-mode)
;; (add-hook 'dired-mode-hook #'nerd-icons-dired-mode)

;; ;; This line is for making the directory icon yellow
;; (add-to-list 'nerd-icons-dir-icon-alist
;;              '("." nerd-icons-faicon "nf-fa-folder" :face nerd-icons-lyellow))

;; (defalias 'rmdir 'delete-directory)
;; (vertico-flat-mode)
;; (vertico-mode)
;; ;; Theme
;; (require 'ef-themes)
;; (load-theme 'ef-spring t)

;; ;; Packages installed by package.el
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages
;;    '(affe cape corfu ctrlf dape dashboard doom-modeline ef-themes
;;           kind-icon lsp-mode magit multiple-cursors nerd-icons-dired
;;           orderless org-journal org-modern org-roam rust-mode vertico)))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(flymake-errline ((((class color)) (:underline "red"))) t)
;;  '(flymake-warnline ((((class color)) (:underline "yellow"))) t))

(setq frame-resize-pixelwise t
      package-enable-at-startup t
      use-package-always-ensure nil
      make-backup-files t
      version-control nil
      delete-old-versions t
      backup-by-copying t
      auto-save-default nil
      create-lockfiles nil
      use-dialog-box nil
      mouse-highlight nil
      max-mini-window-height 0.7
      confirm-kill-emacs 'y-or-n-p
      visible-bell t)

(setq backup-directory-alist
      `(("." . ,(expand-file-name "~/.emacs.d/save/"))))

;;; ---------------------------------------------------------------------------
;;; Packages
;;; ---------------------------------------------------------------------------

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; Keep this only if you actually install packages from MELPA Stable.
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

;;; ---------------------------------------------------------------------------
;;; Basic UI
;;; ---------------------------------------------------------------------------

(push '(tool-bar-lines . 0) default-frame-alist)

(menu-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)

(setq-default cursor-type '(bar . 3))

(set-face-attribute 'default nil
                    :font "JetBrains Mono"
                    :height 140)

;;; ---------------------------------------------------------------------------
;;; Editing
;;; ---------------------------------------------------------------------------

(global-set-key [f5] #'save-buffer)
(global-set-key [f8] #'find-file)
(global-set-key (kbd "C-<tab>") #'other-window)
(global-set-key (kbd "C-:") #'ibuffer)

(defun kill-buffer-and-fullscreen ()
  "Kill current buffer and make the remaining buffer fullscreen."
  (interactive)
  (kill-current-buffer)
  (delete-other-windows))

(global-set-key (kbd "C-;") #'kill-buffer-and-fullscreen)

(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)

;; Instead of enabling these globally, only enable them in relevant buffers.
(add-hook 'text-mode-hook #'visual-line-mode)
(add-hook 'prog-mode-hook #'visual-line-mode)

(add-hook 'text-mode-hook #'prettify-symbols-mode)
(add-hook 'prog-mode-hook #'prettify-symbols-mode)

(defun my/toggle-eat ()
  "Toggle Eshell at the bottom of the frame."
  (interactive)
  (let ((eshell-buffer (get-buffer "*eshell*")))
    (if (and eshell-buffer
             (get-buffer-window eshell-buffer 'visible))
        (delete-windows-on eshell-buffer)
      (let ((display-buffer-alist
             '(("\\*eshell\\*"
                (display-buffer-reuse-window
                 display-buffer-pop-up-window)
                (window-height . 0.33)
                (reusable-frames . visible)
                (dedicated . t)))))
        (if eshell-buffer
            (display-buffer eshell-buffer)
          (eshell))))))

(global-set-key (kbd "C-!") #'my/toggle-eat)

(when (fboundp 'vertico-mode)
  (vertico-mode 1))

(when (fboundp 'vertico-flat-mode)
  (vertico-flat-mode 1))

(require 'doom-modeline)
(setq doom-modeline-support-imenu t
      doom-modeline-total-line-number t)

(doom-modeline-mode 1)
(require 'dashboard)

(setq dashboard-startup-banner 'logo
      dashboard-center-content t)

(dashboard-setup-startup-hook)

(require 'ef-themes)
(load-theme 'ef-spring t)

(add-hook 'ibuffer-mode-hook #'nerd-icons-ibuffer-mode)
(add-hook 'dired-mode-hook #'nerd-icons-dired-mode)

(with-eval-after-load 'nerd-icons
  ;; Yellow directory icon
  (add-to-list 'nerd-icons-dir-icon-alist
               '("." nerd-icons-faicon
                 "nf-fa-folder"
                 :face nerd-icons-lyellow)))

;;; ---------------------------------------------------------------------------
;;; Programming configuration
;;;
;;; Load it only when the first programming buffer is opened.
;;; ---------------------------------------------------------------------------

(defvar my/programmingmode-loaded nil)

(defun my/load-programming-mode ()
  "Load programming configuration once."
  (unless my/programmingmode-loaded
    (setq my/programmingmode-loaded t)
    (load "~/.emacs.d/programmingmode.el")))

(add-hook 'prog-mode-hook #'my/load-programming-mode)

;;; ---------------------------------------------------------------------------
;;; Package selection
;;; ---------------------------------------------------------------------------

(custom-set-variables
 '(package-selected-packages
   '(affe
     cape
     corfu
     ctrlf
     dape
     dashboard
     doom-modeline
     ef-themes
     kind-icon
     lsp-mode
     magit
     multiple-cursors
     nerd-icons-dired
     orderless
     org-journal
     org-modern
     org-roam
     rust-mode
     vertico)))

(custom-set-faces
 '(flymake-errline ((((class color)) (:underline "red"))) t)
 '(flymake-warnline ((((class color)) (:underline "yellow"))) t))
