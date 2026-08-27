;; -*- lexical-binding: t; -*-
(require 'package)

(require 'bookmark)
(require 'corfu)
(require 'org-journal)
(require 'doom-modeline)
(require 'multiple-cursors)
(setq doom-modeline-time-icon t)

;; Enable uptime segment
(setq doom-modeline-time nil)
(setq doom-modeline-env-enable-python nil) ;; optional cleanup

(defun my/doom-modeline-uptime ()
  "Return Emacs uptime."
  (format "⌛ %s" (emacs-uptime "%hh %mm")))

(doom-modeline-def-segment uptime
  (my/doom-modeline-uptime))

(doom-modeline-def-modeline 'main
  '(bar workspace-name window-number modals matches buffer-info remote-host buffer-position word-count parrot selection-info)
  '(uptime misc-info minor-modes input-method buffer-encoding major-mode process vcs))

(doom-modeline-set-modeline 'main t)
