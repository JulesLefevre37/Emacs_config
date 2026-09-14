;; -*- lexical-binding: t; -*-

;; For Rust section
(use-package rust-mode
  :init
  (setq rust-mode-treesitter-derive t))

(use-package lsp-mode
  :init
  (defun my/lsp-mode-setup-completion ()
    (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
          '(orderless))) ;; Configure orderless
  :hook
  (lsp-completion-mode . my/lsp-mode-setup-completion))

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

;; For C programming section
(setq treesit-language-source-alist
      '((c . ("https://github.com/tree-sitter/tree-sitter-c"))))
(setq c-default-style "linux")
```elisp
;; C with Tree-sitter + LSP
(add-to-list 'major-mode-remap-alist '(c-mode . c-ts-mode))

(add-hook 'c-ts-mode-hook
          (lambda ()
            (setq-local c-ts-mode-indent-offset 4)
            (local-set-key (kbd "RET") #'newline-and-indent)
            (setq-local lsp-enable-on-type-formatting nil)

            (lsp)
            (setq compilation-scroll-output t)
            (setq-local compile-command
                        (format
                         "gcc -std=c17 -Wall -Wextra -Wpedantic -Wconversion -Wshadow -Wformat=2 -g -O1 -fsanitize=address,undefined %s -o %s"
                         (shell-quote-argument buffer-file-name)
                         (shell-quote-argument
                          (file-name-sans-extension buffer-file-name))))
            (add-to-list 'display-buffer-alist
                         '("\\*compilation\\*"
                           (display-buffer-at-bottom)
                           (window-height . 0.20)))
            ))

;; Ending Rust section
(add-hook 'rust-mode-hook #'my-rust-mode-setup)
