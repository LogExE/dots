(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tango))
 '(package-selected-packages '(haskell-mode jedi magit reverse-im))
 '(reverse-im-input-methods '("russian-computer")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(tool-bar-mode -1)
(setq backup-directory-alist `(("." . "~/.emacssaves")))
(global-display-line-numbers-mode)
(add-to-list 'default-frame-alist '(font . "Fantasque Sans Mono 11"))

(reverse-im-mode t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
