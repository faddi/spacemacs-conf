;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; evil mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
(setq evil-emacs-state-modes nil)

;; Fix ret and space
(defun my-move-key (keymap-from keymap-to key)
  "Moves key binding from one keymap to another, deleting from the old location. "
  (define-key keymap-to key (lookup-key keymap-from key))
  (define-key keymap-from key nil))
(my-move-key evil-motion-state-map evil-normal-state-map (kbd "RET"))
(my-move-key evil-motion-state-map evil-normal-state-map " ")

;; switch buffer
(define-key evil-normal-state-map  (kbd "/") 'isearch-forward)
(define-key evil-normal-state-map  (kbd "g n") 'neotree-find)
(define-key evil-normal-state-map  (kbd "g f") 'mc/mark-next-like-this)
(define-key evil-normal-state-map  (kbd "g w") 'mc/mark-next-word-like-this)
(define-key evil-normal-state-map  (kbd "§") 'evil-repeat)
(define-key evil-normal-state-map  (kbd "SPC") 'ace-jump-mode)
(define-key evil-normal-state-map  (kbd "g h") 'hlt-highlight-symbol)
(define-key evil-normal-state-map  (kbd "g H") 'hlt-unhighlight-symbol)

(define-key evil-ex-map "q" 'kill-buffer)

(add-hook 'tide-mode-hook
  (lambda ()
    (define-key evil-normal-state-map  (kbd "g s") 'tide-jump-to-definition)
    (define-key evil-normal-state-map  (kbd "g z") 'tide-jump-back)
    ))

;; easier buffer menu
(define-key evil-normal-state-map  (kbd "g b") 'buffer-menu)

(require 'neotree)

;; neotree
(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") (neotree-make-executor :file-fn 'neo-open-file :dir-fn  'neo-open-dir))
            (define-key evil-normal-state-local-map (kbd "SPC") (neotree-make-executor :file-fn 'neo-open-file :dir-fn  'neo-open-dir))
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") (neotree-make-executor :file-fn 'neo-open-file :dir-fn  'neo-open-dir))))

;; evil matchit mode
(global-evil-matchit-mode 1)

(global-set-key (kbd "S-<up>")    'tabbar-backward-group)
(global-set-key (kbd "S-<down>")    'tabbar-forward-group)
(global-set-key (kbd "S-<left>")    'tabbar-backward)
(global-set-key (kbd "S-<right>")    'tabbar-forward)

(define-key evil-insert-state-map (kbd "M-SPC") 'company-complete)
