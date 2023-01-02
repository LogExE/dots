(setq inhibit-startup-screen t)
(ido-mode 1)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(tool-bar-mode -1)
(setq backup-directory-alist `(("." . "~/.emacssaves")))
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
;(global-hl-line-mode)
;(set-face-background 'hl-line "#CCCCCC")
(add-to-list 'default-frame-alist '(font . "Fantasque Sans Mono 11"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes '(tango-dark))
 '(ispell-dictionary nil)
 '(package-selected-packages '(haskell-mode reverse-im use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(use-package reverse-im
  :ensure t
  :custom
  (reverse-im-input-methods '("russian-computer"))
  :config
  (reverse-im-mode t))

(use-package haskell-mode
  :ensure t)


