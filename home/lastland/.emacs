;; Hide the tool bar.
(custom-set-variables '(tool-bar-mode nil nil (tool-bar)))
(custom-set-faces)
;; Settings for slime.
(setq inferior-lisp-program "/usr/bin/sbcl")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")
(require 'slime)
(slime-setup)
(setq-default indent-tabs-mode nil)
(put 'upcase-region 'disabled nil)
