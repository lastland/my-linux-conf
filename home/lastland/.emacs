(load-theme 'deeper-blue)
(ido-mode t)
;; Hide the tool bar.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ibus-python-shell-command-name "python2")
 '(tool-bar-mode nil nil (tool-bar)))
;; Setting calendar style.
(setq american-calendar-style 't)
;; Settings for clipboard.
(setq x-select-enable-clipboard t)
;; Function to replace set RET as newline-and-indent.
(defun RET-autoindent-hook ()
  (local-set-key (kbd "RET") 'newline-and-indent))
;; Settings for display line numbers on the left.
(require 'linum)
(global-linum-mode t)
;; Settings for hippie-expand.
(global-set-key [(meta return)] 'hippie-expand)
;; Settings for yasnippet.
(add-to-list 'load-path "~/.emacs.d/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)
;; Load CEDET.
(load-file "~/.emacs.d/cedet-1.1beta2/common/cedet.el")
(require 'cedet)
;; Settings for EDE project management system.
(global-ede-mode t)
;; CC-Mode.
(require 'cc-mode)
(setq c-default-style "bsd" c-basic-offset 4)
;; Settings for semantic.
(require 'semantic-ia)
(require 'semantic-gcc)
(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(semantic-unmatched-syntax-face ((t nil))))
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
;(add-hook 'c-mode-common-hook 'my-cedet-hook)
;(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)
(add-hook 'c-mode-common-hook 'RET-autoindent-hook)
;; Settings for ECB(Emacs Code Browser). !something wrong
;(require 'ecb) 
;; Qt library for Cedet.
(setq qt-base-dir "/usr/include")
(semantic-add-system-include qt-base-dir 'c++-mode)
(add-to-list 'auto-mode-alist (cons qt-base-dir 'c++-mode))
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt-base-dir "/Qt/qconfig.h"))
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt-base-dir "/Qt/qconfig-dist.h"))
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt-base-dir "/Qt/qglobal.h"))
;; Local includes.
(semantic-add-system-include "~/workspace/cpp/graphics/include" 'c++-mode)
(semantic-add-system-include "~/workspace/cpp/imageprocess/include" 'c++-mode)
;; Settings for slime.
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq-default indent-tabs-mode nil)
(put 'upcase-region 'disabled nil)
(require 'slime)
(slime-setup)
;; Settings for clojure-mode.
(add-to-list 'load-path "~/opt/clojure-mode")
(require 'clojure-mode)
;; Settings for python.
(add-to-list 'load-path (expand-file-name
                         "~/.emacs.d/el-get/python"))
(require 'python)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(setq
 python-shell-interpreter "ipython2"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
 "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
 "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
 "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
;;; pymacs, rope and ropemacs
(add-to-list 'load-path "~/.emacs.d/el-get/pymacs")
(require 'pymacs)
(setq pymacs-load-path '("~/.emacs.d/el-get/ropemacs"))
;; Initialize Pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
;; Initialize Rope
(pymacs-load "ropemacs")
(setq ropemacs-enable-autoimport t)
; (autoload 'python-mode "~/.emacs.d/el-get/python/python.el" "Python mode." t)
; (setq auto-mode-alist (append '(("/*.\.pyw?$" . python-mode)) auto-mode-alist))
;; Settings for ibus.
(require 'ibus)
(global-set-key (kbd "C-\\") 'ibus-toggle)
(ibus-define-common-key ?\C-\s nil)     ;Use C-SPC for Set Mark command
(ibus-define-common-key ?\C-/ nil)      ;Use C-/ for Undo command
(setq ibus-cursor-color '("yellow" "blue" "red")) ;Change cursor color depending on IBus status
;; Turn on ibus-mode automatically after loading .emacs.
(add-hook 'after-init-hook 'ibus-mode-on)
;; (add-hook 'after-make-frame-functions
;;           (lambda (new-frame)
;;             (select-frame new-frame)
;;             (or ibus-mode (ibus-mode-on))))
;; Settings for el-get.
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (url-retrieve "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
                (lambda (s) (end-of-buffer) (eval-print-last-sexp))))
;; Settings for pretty lambdas.
(defun pretty-lambdas ()
  "Display the word “lambda” by “λ”."
  (font-lock-add-keywords
   nil
   `(("\(\\(\\<lambda\\>\\)"
      (0
       (progn
         (compose-region (match-beginning 1) (match-end 1) "λ")
         'font-lock-keyword-face))))))
(add-hook 'emacs-lisp-mode-hook 'pretty-lambdas)
;; (remove-hook 'emacs-lisp-mode-hook 'pretty-lambdas)
(defalias 'λ 'lambda)
;; Highlight numbers.
(add-hook 'c-mode-common-hook 
          (lambda ()
            (font-lock-add-keywords 
             nil 
             '(("\\b0x[[:xdigit:]]+[uUlL]*\\b" . font-lock-string-face)
               ("\\b0x\\(\\w\\|\\.\\)+\\b" . font-lock-warning-face) ; Invalid hex number
               ("\\(\\b[0-9]+\\|\\)\\(\\.\\)\\([0-9]+\\(e[-]?[0-9]+\\)?\\([lL]?\\|[dD]?[fF]?\\)\\)\\b" 
                (1 font-lock-string-face) (3 font-lock-string-face)) ; Valid floating point number.
               ("\\b[0-9].*?\\..+?\\b" . font-lock-warning-face) ; Invalid floating point number.  Must be before valid decimal.
               ("\\b\\(\\(0\\|[1-9][0-9]*\\)[uUlL]*\\)\\b" 1 font-lock-string-face) ; Valid decimal number.  Must be before octal regexes otherwise 0 and 0l will be highlighted as errors.  Will highlight invalid suffix though.
               ("\\b0[0-7]+[uUlL]*\\b" . font-lock-string-face) ; Valid octal number
               ("\\b\\([0-9]+\\)\\." (1 font-lock-string-face)) ; Floating point number with no digits after the period.  This must be after the invalid numbers, otherwise it will "steal" some invalid numbers and highlight them as valid.
               ("\\b[0-9]\\(\\w\\|\\.\\)+?\\b" . font-lock-warning-face) ; Invalid number.  Must be last so it only highlights anything not matched above.
               ))))
