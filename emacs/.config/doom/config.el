;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Orr Shalev"
      user-mail-address "shalev.orr@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tokyo-night)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(setq auth-sources '("~/.authinfo"))

;; (after! evil-multiedit (evil-multiedit-default-keybinds))
;;

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; org test

;; (orr/configure-based-on-hostname
;;  '((doom-font (font-spec :family "CaskaydiaCove Nerd Font" :size 13)))
;;  '((doom-font (font-spec :family "CaskaydiaCove Nerd Font" :size 18)))
;; )

(after! ein (setq ein:jupyter-server-use-subcommand "server"
                  ein:output-area-inlined-images t))

(use-package! org
  :config
  (custom-set-faces
   '(org-level-1 ((t (:inherit outline-1 :height 1.5))))
   '(org-level-2 ((t (:inherit outline-2 :height 1.2))))
   '(org-level-3 ((t (:inherit outline-3 :height 1.1))))
   '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
   '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))
  )

(setq
 doom-variable-pitch-font (font-spec :family "CaskaydiaCove Nerd Font")
 global-prettify-symbols-mode t
 doom-font (font-spec :family "CaskaydiaCove Nerd Font" :size 13)
 )

;; accept completion from copilot and fallback to company
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


(custom-set-faces! ; for switch window
  '(aw-leading-char-face
    :foreground "white" :background "red"
    :weight bold :height 2.5 :box (:line-width 10 :color "red")))

(after! org
  (setq org-agenda-files '("~/notes/agenda" "~/notes/agenda/weekly")))

(set-frame-parameter nil 'alpha-background 65)
(add-to-list 'default-frame-alist '(alpha-background . 65))

(add-to-list 'doom-modeline-continuous-word-count-modes 'latex-mode)
(setq doom-modeline-enable-word-count t)

                                        ; alt+vim motion to move windows
(evil-define-key 'normal 'global (kbd "M-h") 'evil-window-left)

(evil-define-key 'normal 'global (kbd "M-j") 'evil-window-down)

(evil-define-key 'normal 'global (kbd "M-k") 'evil-window-up)

(evil-define-key 'normal 'global (kbd "M-l") 'evil-window-right)

(evil-define-key 'normal 'global (kbd "M-c") 'evil-window-delete)
