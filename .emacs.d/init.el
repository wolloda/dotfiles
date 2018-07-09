;;; package --- summary

;;; Commentary:
;; My init file

;;; Code:
(setq user-full-name "Vojtech Kana"
      user-mail-address "kana.vojtech@gmail.com")

;; BORING: Ensure everything is UTF-8 all the time
(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)


;;; from purcell/emacs.d
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(setq package-enable-at-startup nil)

(defvar helm-use-frame-when-more-than-two-windows nil)

;; list of packages to be automatically downloaded
(defvar my-packages
  '(ack
    ag
    company
    company-irony
    evil
    ;;evil-collection
    evil-goggles
    evil-magit
    evil-nerd-commenter
    evil-vimish-fold
    evil-smartparens
    evil-surround
    flycheck
    flycheck-irony
    function-args
    git-gutter
    gruvbox-theme
    helm
    helm-ack
    helm-ag
    irony
    markdown-mode
    markdown-mode+
    magit
    neotree
    org
    org-evil
    ox-pandoc
    ;; ox-beamer
    projectile
    smartparens
    ;; powerline / spaceline / ...
    undo-tree
    tabbar
    vimish-fold
    visual-regexp
    which-key
    ))

;; download packages
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-refresh-contents)
    (package-install p)))


;; disable beeping
(setq visible-bell 1)

;; hide toolbar, menu, scrollbar
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

;; backup files location
(if (not (file-directory-p "~/.emacs.d/backup"))
    (make-directory "~/.emacs.d/backup"))
(setq backup-by-copying t
    backup-directory-alist '(("." . "~/.emacs.d/backup")))


(defvar evil-want-integration nil)

;; highlight current line
(global-hl-line-mode)

;; show line numbers
(global-linum-mode)
(setq linum-relative-with-helm t)

;; show clock
(display-time-mode)

;; evil-surround
(global-evil-surround-mode)

;; smartparens
(smartparens-global-mode)
    (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)

;; projectile
(projectile-mode)

;; flycheck
(global-flycheck-mode)

;; company
(global-company-mode)

;; GIT GUTTER
;; turn on
(global-git-gutter-mode +1)

;; If you would like to use git-gutter.el and linum-mode
(git-gutter:linum-setup)
;; set signs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes '(gruvbox-dark-soft))
 '(custom-safe-themes
   '("62c81ae32320ceff5228edceeaa6895c029cc8f43c8c98a023f91b5b339d633f" "42b9d85321f5a152a6aef0cc8173e701f572175d6711361955ecfb4943fe93af" "75c5c39809c52d48cb9dcbf1694bf2d27d5f6fd053777c194e0b69d8e49031c0" "ad109c1ad8115573f40e22ac2b996693b5d48052fa37b5919f70ea37c62a965e" default))
 '(git-gutter:added-sign "•")
 '(git-gutter:deleted-sign "•")
 '(git-gutter:modified-sign "•")
 '(markdown-command "C:/Users/kanav/AppData/Local/Pandoc/pandoc.exe")
 '(package-selected-packages
   '(flycheck evil-nerd-commenter spaceline evil-magit magit markdown-mode markdown-mode+ org-evil gruvbox-theme helm evil-goggles evil)))

;; EVIL MODE

;; set evil-collection
;; (when (require 'evil-collection nil t)
	;;(evil-collection-init))

(defvar evil-search-module 'evil-search)
(defvar evil-want-C-u-scroll t)
(defvar evil-want-C-w-in-emacs-state t)

(require 'evil)
(evil-mode t)

(with-eval-after-load 'evil
  ;; use evil mode in the buffer created from calling `list-packages'.
  (add-to-list 'evil-buffer-regexps '("*Packages*" . normal))

;; evil mode in package-* buffers
(with-eval-after-load 'package
  ;; movement keys j,k,l,h set up for free by defaulting to normal mode.
  ;; mark, unmark, install
  (evil-define-key 'normal package-menu-mode-map (kbd "m") #'package-menu-mark-install)
  (evil-define-key 'normal package-menu-mode-map (kbd "u") #'package-menu-mark-unmark)
  (evil-define-key 'normal package-menu-mode-map (kbd "x") #'package-menu-execute)))


;; EVIL GOGGLES MODE
(require-package 'evil-goggles)
(evil-goggles-mode)

;; EVIL NERD COMMENTER
(evilnc-default-hotkeys)

;; HELM
(require 'helm-config)
(helm-mode 1)

;; hs minor mode in c / cpp files
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'c-mode-hook 'hs-minor-mode)

;; flycheck in c / cpp files
(add-hook 'c++-mode-hook 'hs-minor-mode)

;; WHICH-KEY
(defvar which-key-popup-type 'minibuffer)
(which-key-mode t)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
