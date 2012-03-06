;; Hide the tool bar.
(custom-set-variables '(tool-bar-mode nil nil (tool-bar)))
(custom-set-faces)
;; Settings for slime.
(setq inferior-lisp-program "/usr/bin/sbcl")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")
(setq-default indent-tabs-mode nil)
(put 'upcase-region 'disabled nil)
(require 'slime)
(slime-setup)
;; Setting calendar style
(setq american-calendar-style 't)
;; Settings for clojure-mode
(add-to-list 'load-path "~/opt/clojure-mode")
(require 'clojure-mode)
;; Settings for python-mode
(autoload 'python-mode "python-mode.el" "Python mode." t)
(setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist))