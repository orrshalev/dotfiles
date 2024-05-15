;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-


;; auth

(setq user-full-name "Orr Shalev"
      user-mail-address "shalev.orr@gmail.com")

;; basic
(setq display-line-numbers-type `relative)


;; visual

(setq doom-theme 'doom-one)


(setq
 doom-variable-pitch-font (font-spec :family "CaskaydiaCove Nerd Font")
 global-prettify-symbols-mode t
 doom-font (font-spec :family "CaskaydiaCove Nerd Font" :size 13)
 )

;; org
(setq org-directory "~/org/")

(use-package! org
  :config
  (custom-set-faces
   '(org-level-1 ((t (:inherit outline-1 :height 1.5))))
   '(org-level-2 ((t (:inherit outline-2 :height 1.2))))
   '(org-level-3 ((t (:inherit outline-3 :height 1.1))))
   '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
   '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))
  )

;; copilot

(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))
(defun disable-copilot-in-emacs-lisp-mode ()
  "Disable copilot-mode when entering emacs-lisp-mode."
  (when (and (boundp 'copilot-mode) copilot-mode)
    (copilot-mode -1)))

(add-hook 'emacs-lisp-mode-hook 'disable-copilot-in-emacs-lisp-mode)

;; keybinds - vim

(evil-define-key 'normal 'global (kbd "C-h") 'evil-window-left)

(evil-define-key 'normal 'global (kbd "C-j") 'evil-window-down)

(evil-define-key 'normal 'global (kbd "C-k") 'evil-window-up)

(evil-define-key 'normal 'global (kbd "C-l") 'evil-window-right)

(evil-define-key 'normal 'global (kbd "C-M-+") 'doom/increase-font-size)

(evil-define-key 'normal 'global (kbd "C-M-=") 'doom/decrease-font-size)

;; mu4e
(set-email-account! "shalev.orr@gmail.com"
                    '((user-full-name         . "Orr Shalev")
                      (mu4e-sent-folder       . "/[Gmail].Sent Mail")
                      (mu4e-trash-folder      . "/[Gmail].Trash")
                      (mu4e-refile-folder     . "/[Gmail].All Mail")
                      (mu4e-sent-folder     . "/[Gmail].Sent Mail")
                      (smtpmail-smtp-user     . "shalev.orr@gmail.com")
                      (mu4e-compose-signature . "\nOrr Shalev | Software Developer | Computer Science M.S."))
                    t)

(setq +mu4e-gmail-accounts '(("shalev.orr@gmail.com" . "/INBOX")))

;; don't need to run cleanup after indexing for gmail
(setq mu4e-index-cleanup nil
      ;; because gmail uses labels as folders we can use lazy check since
      ;; messages don't really "move"
      mu4e-index-lazy-check t)


(after! mu4e
  (setq sendmail-program (executable-find "msmtp")
        send-mail-function #'smtpmail-send-it
        message-sendmail-f-is-evil t
        message-sendmail-extra-arguments '("--read-envelope-from")
        message-send-mail-function #'message-send-mail-with-sendmail))

;; LaTeX

(after! org
  (setq org-format-latex-options
        (plist-put org-format-latex-options :scale 3.5)))
