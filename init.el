;; -*- lexical-binding: t; -*-
(require 'package)
(require 'doom-modeline)
(setq frame-resize-pixelwise t) 
(package-initialize)
(setq use-package-always-ensure t)(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do nnthis.
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(set-face-attribute 'default nil :background "#FFFDE7")
(setq inhibit-startup-screen t)
(when (display-graphic-p)
  (push '(background-color . "#FFFFEE") default-frame-alist))
(list-bookmarks)
(setq bookmark-bmenu-toggle-filenames t)
(setq bookmark-sort-flag 'last-modified)
(setq bookmark-sort-flag 'last-modified)
(switch-to-buffer "*Bookmark List*")
(setq make-backup-files t)
(push '(tool-bar-lines . 0) default-frame-alist)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(unless (boundp 'mode-line-right-align-edge)
  (defvar mode-line-right-align-edge 'right-margin))
(setq doom-modeline-support-imenu t)
(doom-modeline-mode 1)
(setq-default cursor-type '(bar . 3))
(set-face-attribute 'default nil
                    :font "Jetbrains Mono"
                    :height 140)
;; make backup name incremental by number, ending in ~1~ ~2~ etc
;; note: only one backup is made when file is changed for first time, not every save
(global-visual-line-mode 1)
(setq version-control nil)
(setq delete-old-versions t)
;; make sure hard link and creation date, owner, etc is preserved
(setq backup-by-copying t)
(setq auto-save-default nil)
(setq create-lockfiles nil)
(blink-cursor-mode 0)
(setq use-dialog-box nil)
(global-prettify-symbols-mode 1)
(setq mouse-highlight nil)
(setq max-mini-window-height 0.7)

(global-set-key [f5] #'save-buffer)
(global-set-key [f8] 'find-file)
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq doom-modeline-total-line-number t)
(defun my/toggle-eat ()
  "Toggle Eat at the bottom of the frame."
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

(global-set-key (kbd "C-!") 'my/toggle-eat)
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-:") 'ibuffer)

(global-set-key (kbd "C-;") 'kill-current-buffer)
(defun kill-buffer-and-fullscreen ()
  "Kill current buffer and make the remaining buffer fullscreen."
  (interactive)
  (kill-current-buffer)
  (delete-other-windows))

(global-set-key (kbd "C-;") #'kill-buffer-and-fullscreen)
(setq visible-bell t)
;; 2. Programming mode hook
(load "~/.emacs.d/programmingmode.el")
(load "~/.emacs.d/package.el")
;;(load "~/.emacs.d/note_and_writting_mode.el")
(setq backup-directory-alist
      `(("." . ,(expand-file-name "~/.emacs.d/save/"))))
;; Org-mode section
(setq confirm-kill-emacs 'y-or-n-p)
(add-hook 'ibuffer-mode-hook #'nerd-icons-ibuffer-mode)
(add-hook 'dired-mode-hook #'nerd-icons-dired-mode)

;; This line is for making the directory icon yellow

(add-to-list 'nerd-icons-dir-icon-alist
             '("." nerd-icons-faicon "nf-fa-folder" :face nerd-icons-lyellow))
(defalias 'rmdir 'delete-directory)
(vertico-flat-mode)
(vertico-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   '("87fa3605a6501f9b90d337ed4d832213155e3a2e36a512984f83e847102a42f4"
     "e1df746a4fa8ab920aafb96c39cd0ab0f1bac558eff34532f453bd32c687b9d6"
     "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8"
     "f6ea954a9544b0174a876d195387f444da441535ee88c7fb0fc346af08b0d228"
     "c9d837f562685309358d8dc7fccb371ed507c0ae19cf3c9ae67875db0c038632"
     "2f8af2a3a2fae6b6ea254e7aab6f3a8b5c936428b67869cef647c5f8e7985877"
     "b7a09eb77a1e9b98cafba8ef1bd58871f91958538f6671b22976ea38c2580755"
     "599f72b66933ea8ba6fce3ae9e5e0b4e00311c2cbf01a6f46ac789227803dd96"
     "5244ba0273a952a536e07abaad1fdf7c90d7ebb3647f36269c23bfd1cf20b0b8"
     "166a2faa9dc5b5b3359f7a31a09127ebf7a7926562710367086fcc8fc72145da"
     default))
 '(package-selected-packages
   '(cape corfu doom-modeline kind-icon lsp-mode multiple-cursors
          nerd-icons-dired orderless org-journal org-modern org-roam
          rust-mode vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow")))))
