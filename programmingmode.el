;; -*- lexical-binding: t; -*-

(set-face-attribute 'line-number-current-line nil
                    :foreground "black"
                    :weight 'bold)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
;; (use-package company-box
;;   :ensure t
;;   :hook (company-mode . company-box-mode))
(setq completion-max-candidates 8) 
(setq lsp-completion-provider :none)
(setq corfu-auto t
      corfu-quit-no-match t
      corfu-cycle t
      corfu-auto-delay 0
      corfu-auto-prefix 1)
(add-hook 'prog-mode-hook #'corfu-mode)
(add-hook 'html-mode-hook
          (lambda ()
            ;; Default indentation is usually 2 spaces, changing to 4.
            (set (make-local-variable 'sgml-basic-offset) 4)))
(setq completion-cycle-threshold 3)
;; (setq eldoc-idle-delay most-positive-fixnum)
(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode lisp-mode       rust-mode
						     plain-tex-mode  python-mode
                                                     go-mode
                                                     ))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))
(setq compile-command "cargo run")
;; Disable company automatically in text buffers
(add-hook 'text-mode-hook (lambda () (corfu-mode -1)))
(add-hook 'eshell-mode-hook (lambda () (corfu-mode -1)))

;; (require 'eshell)
;; (require 'ansi-color)
;; (defun eshell-handle-ansi-color () ;; Enable color for eshell
;;   (ansi-color-apply-on-region eshell-last-output-start
;;                               eshell-last-output-end))
;; (add-to-list 'eshell-output-filter-functions 'eshell-handle-ansi-color)

(add-hook 'prog-mode-hook
          (lambda ()
	    (interactive)
            ;; Buffer-local TAB key          
            ;; Enable minor modes
	    (setq indent-tabs-mode nil)
	    (local-set-key (kbd "RET") #'newline-and-indent)
            (setq electric-pair-open-newline-between-pairs t)
            (electric-pair-mode 1)
	    
            ;; Tab behavior
	    ))
(add-hook 'dired-mode-hook (lambda () (hl-line-mode)))
(add-hook 'prog-mode-hook (lambda () (hl-line-mode)))
(defun indent-whole-buffer ()
  "Indent the entire buffer without affecting point or mark."
  (interactive)
  (save-excursion
    (save-restriction
      (indent-region (point-min) (point-max)))))
;; Eshell section
(setq eshell-cmpl-compare-entry-function
      (function
       (lambda (left right)
	 (let ((exts completion-ignored-extensions) found)
	   (while exts
	     (if (string-match (concat "\\" (car exts) "$") right)
		 (setq found t exts nil))
	     (setq exts (cdr exts)))
	   (if found
	       nil
	     (file-newer-than-file-p left right))))))
(load "~/.emacs.d/programming_languages.el")
