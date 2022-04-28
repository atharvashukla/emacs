;; Atharva's Emacs Config

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(try use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
