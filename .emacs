;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq use-spacemacs nil)   ; or nil 

(when use-spacemacs
  (setq user-emacs-directory "~/.spacemacs.d/"))   ; defaults to ~/.emacs.d/

(load (expand-file-name "init.el" user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (gruvbox-dark-soft)))
 '(custom-safe-themes
   (quote
    ("42b9d85321f5a152a6aef0cc8173e701f572175d6711361955ecfb4943fe93af" default)))
 '(git-gutter:added-sign "•")
 '(git-gutter:deleted-sign "•")
 '(git-gutter:modified-sign "•")
 '(inhibit-startup-screen t)
 '(markdown-command "C:/Users/kanav/AppData/Local/Pandoc/pandoc.exe")
 '(package-selected-packages
   (quote
    (ox-pandoc helm which-key visual-regexp tabbar projectile org-evil neotree markdown-mode+ markdown-mode popup gruvbox-theme git-gutter function-args flycheck-irony evil-vimish-fold evil-surround evil-smartparens evil-nerd-commenter evil-magit evil-goggles evil-collection company-irony ag ack))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
