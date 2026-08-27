;; -*- lexical-binding: t; -*-

;; For Rust section
(use-package rust-mode
  :init
  (setq rust-mode-treesitter-derive t))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-pcm-leading-wildcard t)) ;; Emacs 31: partial-completion behaves like substring

(use-package cape
  :ensure t
  :init
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev))

(use-package kind-icon
  :ensure t
  :after corfu
                                        ;:custom
                                        ; (kind-icon-blend-background t)
                                        ; (kind-icon-default-face 'corfu-default) ; only needed with blend-background
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(custom-set-faces ;; Better highlighting for Flymake
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow")))))

(defun my-rust-mode-setup ()
  (setq rust-format-on-save t)  
  (prettify-symbols-mode 1)
  (lsp-deferred)
  (eldoc-mode -1)
  (flymake-mode 1))

;; sensed to fix corectly the indentation
(defun my-electric-pair-open-newline-between-pairs-psif-hack (orig-func &rest args)
  (ignore orig-func args)
  (when (and (if (functionp electric-pair-open-newline-between-pairs)
                 (funcall electric-pair-open-newline-between-pairs)
               electric-pair-open-newline-between-pairs)
             (eq last-command-event ?\n)
             (< (1+ (point-min)) (point) (point-max))
             (eq (save-excursion
                   (skip-chars-backward "\t\s")
                   (char-before (1- (point))))
                 (matching-paren (char-after))))
    (save-excursion (newline-and-indent 1))))
(advice-add 'electric-pair-open-newline-between-pairs-psif
            :around
            #'my-electric-pair-open-newline-between-pairs-psif-hack)
;; Ending Rust section
(add-hook 'rust-mode-hook #'my-rust-mode-setup)
