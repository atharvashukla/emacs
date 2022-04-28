;; Atharva's Emacs Config

;; - Mike Zamansky's "Using emacs playlist"
;; 

;; don't show the startup screen
(setq inhibit-startup-message t)

;; -- setup the package manager -- 
(require 'package)

;; Hack for using a different set of repositories when ELPA is down
;; See: https://github.com/syl20bnr/spacemacs/issues/4453#issuecomment-676439117
(setq package-archives
      '(("melpa" . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/melpa/")
        ("org"   . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/org/")
        ("gnu"   . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/gnu/")))
;; (setq package-check-signature nil) ;; probably not necessary


;; removing this cause melpa is giving me 443:
;; (add-to-list 'package-archives
;;	     '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

;; -- add use-package if not installed -- 

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; -- add try -- 
(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(tool-bar-mode -1)

;; Using swiper so ido no longer needed.
;; ido lets you interactively do things with buffers and files. 
;; - ido helps narrow down list of candidates in the minibuffer
;; - ido flexible matching can be enabled with `(setq ido-enable-flex-matching t)`
;; - can cycle thru candidates using C-s/C-r (same as isearch)
;; - you can "confirm" current search term using C-<SPC> and do a nested search of the candidates.
;; - you can open dir in dired by placing "." in existing path query, and jump home by typing ~
;; - C-t to start regexp search mid search and C-e to start editing search term with regular motions
;; - C-h v puts term uder cursor in the describe variable search
;; - Useful bindings in C-h f ido-find-file RET
;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (ido-mode 1)

(defalias 'list-buffers 'ibuffer)

;; [TODO] Check out dired - it's an extremely powerful file manager. 

(use-package tabbar
  :ensure t
  :config (tabbar-mode 1))

;; check out winner mode
;; (winner-mode 1)

(windmove-default-keybindings)

(use-package ace-window
  :ensure t
  :init 
  (progn (global-set-key [remap other-window] 'ace-window)
	 (custom-set-faces
	  '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))))


;; swier, ivy, cousel.

;; it looks like counsel is a requirement for swiper
(use-package counsel
  :ensure t
  )

(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy))


(use-package swiper
  :ensure try
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

;; avy
;; Note: avy searches on screen only
(use-package avy
  :ensure t
  :config
  (global-set-key (kbd "C-:") 'avy-goto-char)
  (global-set-key (kbd "C-'") 'avy-goto-char-2))
;; [TODO] check out `(avy-setup-default)`


;; [TODO]
;; check out company mode
;; autocomplete mode
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))




;; Themes
;; starting off with modus themes
(use-package modus-themes
  :ensure
  :init
  ;; Add all your customizations prior to loading the themes
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs nil
        modus-themes-region '(bg-only no-extend))

  ;; Load the theme files before enabling a theme
  (modus-themes-load-themes)
  :config
  ;; Load the theme of your choice:
  (modus-themes-load-operandi) ;; OR (modus-themes-load-vivendi)
  :bind ("<f5>" . modus-themes-toggle))





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(modus-themes auto-complete swiper ace-window tabbar try use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))


;; useful keybindings:
;; - Move s-exp back/forth: C-M-f/C-M-b
;; - 



