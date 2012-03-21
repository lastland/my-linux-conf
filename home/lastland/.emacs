;; Hide the tool bar.
(custom-set-variables '(tool-bar-mode nil nil (tool-bar)))
(custom-set-faces)
;; Function to replace set RET as newline-and-indent.
(defun RET-autoindent-hook ()
  (local-set-key (kbd "RET") 'newline-and-indent))
;; Settings for hippie-expand.
(global-set-key [(meta return)] 'hippie-expand)
;; Settings for yasnippet.
(add-to-list 'load-path "/usr/share/emacs/site-lisp/yas")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "/usr/share/emacs/site-lisp/yas/snippets")
;; CC-Mode.
(require 'cc-mode)
;; Load CEDET.
(load-file "/usr/share/emacs/site-lisp/cedet/common/cedet.el")
(require 'cedet)
(require 'semantic-ia)
(require 'semantic-gcc)
(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)
;; Bind F2 with semantic-ia-fast-jump.
(global-set-key [f2] 'semantic-ia-fast-jump)
(define-key c-mode-base-map [M-f2] 'semantic-analyze-proto-impl-toggle)
;; Add auto completion and auto indent hook to c-mode-common-hook.
(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))
(defun my-c-mode-cedet-hook ()
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert))
(add-hook 'c-mode-common-hook 'my-cedet-hook)
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)
(add-hook 'c-mode-common-hook 'RET-autoindent-hook)
(global-ede-mode t) ; Enable the Project management system
;; Qt library for Cedet.
(setq qt-base-dir "/usr/include")
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt-base-dir "/Qt/qconfig.h"))
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt-base-dir "/Qt/qconfig-dist.h"))
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt-base-dir "/Qt/qglobal.h"))
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
(setq auto-mode-alist (append '(("/*.\.pyw?$" . python-mode)) auto-mode-alist))
;; Settings for ibus
(require 'ibus)
(global-set-key (kbd "\C- ") 'ibus-toggle)
(custom-set-variables '(ibus-python-shell-command-name "python2"))
