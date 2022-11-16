;; OSX

(require 'package)
(add-to-list 'package-archives 
   '("marmalade" .
     "http://marmalade-repo.org/packages/"))
(package-initialize)
(setq load-path (cons "~/tidal/" load-path))
(require 'tidal)
;;(setq tidal-interpreter "/usr/local/bin/ghci")
(setq tidal-interpreter "ghci")

;; Emacsエラーが出たとき警告音を鳴らさない
(setq ring-bell-function 'ignore)

;; 環境を日本語、UTF-8にする
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; スタートアップメッセージを表示させない
(setq inhibit-startup-message t)
;; scratchの初期メッセージ消去
(setq initial-scratch-message "")
;; バックアップファイルを作成させない
(setq make-backup-files nil)
;; 終了時にオートセーブファイルを削除する
(setq delete-auto-save-files t)

;; メニューバーを消す
;;(menu-bar-mode -1)
;; ツールバーを消す
(tool-bar-mode -1)
;; カーソルを点滅させない
(blink-cursor-mode 0)
;; MacのOptionキーをMetaキーにする
(setq mac-option-modifier 'meta)
;;C-hをバックスペースにする
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
;; 対応する括弧を光らせる
(show-paren-mode 1)
(set-face-attribute 'show-paren-match nil
		    :background "grey77")
;;デフォルトのフォントサイズ
(set-face-attribute 'default nil :height 150)
;;括弧を自動補完する
(electric-pair-mode 1)

;;==========================================================
;;外観設定

;;実行時の光らせ方の設定
(setq pulse-iterations 20)
(setq pulse-delay 0.02)

;; 黒背景に白文字, 青アクセント
;; Memo: M-x comment region. 最初にC-u追加でcomment-inもできる

;; (if window-system (progn
;;   ;; 文字の色, 背景色, カーソルの色, マウスポインタの色
;;   (add-to-list 'default-frame-alist '(foreground-color . "white"))
;;   (add-to-list 'default-frame-alist '(background-color . "black"))
;;   (add-to-list 'default-frame-alist '(cursor-color . "white"))
;;   (add-to-list 'default-frame-alist '(mouse-color . "white"))
;;   ;; モードラインの文字色,背景色
;;   (set-face-foreground 'mode-line "gray37")
;;   (set-face-background 'mode-line "gray5")
;;   ;; 選択中のリージョンの色
;;   (set-face-background 'region "white")
;;   (set-face-foreground 'region "gray77")
;;   ;; 選択してないバッファのモードラインの文字色と背景色
;;   (set-face-foreground 'mode-line-inactive "gray25")
;;   (set-face-background 'mode-line-inactive "gray5")

;;   ;;syntaxもろもろ
;;   (set-face-foreground 'font-lock-comment-face "gray45")
;;   (set-face-foreground 'font-lock-string-face  "white")
;;   (set-face-foreground 'font-lock-keyword-face "white")
;;   (set-face-foreground 'font-lock-function-name-face "blue2")
;;   (set-face-bold-p 'font-lock-function-name-face t)
;;   (set-face-foreground 'font-lock-variable-name-face "blue2")
;;   (set-face-foreground 'font-lock-type-face "white")
;;   (set-face-foreground 'font-lock-builtin-face "white")
;;   (set-face-foreground 'font-lock-constant-face "white")
;;   (set-face-foreground 'font-lock-warning-face "red")
;;   (set-face-bold-p 'font-lock-warning-face nil)
;;   ;;eval時の点滅
;;   (set-face-foreground 'pulse-highlight-face "gray66")
;;   (set-face-foreground 'pulse-highlight-start-face "white")
;;   (set-face-background 'pulse-highlight-face "gray66")
;;   (set-face-background 'pulse-highlight-start-face "white")
;;   ;; tidalの文字色
;;   (set-face-foreground 'comint-highlight-prompt "blue1")
;;   (set-face-foreground 'haskell-operator-face "blue1")
;;   (set-face-foreground 'haskell-definition-face "blue1")
;; ))

;; ブルースクリーン
(if window-system (progn
  ;; 文字の色, 背景色, カーソルの色, マウスポインタの色
  (add-to-list 'default-frame-alist '(foreground-color . "white"))
  (add-to-list 'default-frame-alist '(background-color . "blue1"))
  (add-to-list 'default-frame-alist '(cursor-color . "white"))
  (add-to-list 'default-frame-alist '(mouse-color . "white"))
  ;; モードラインの文字色,背景色
  (set-face-foreground 'mode-line "gray37")
  (set-face-background 'mode-line "gray5")
  ;; 選択中のリージョンの色
  (set-face-background 'region "white")
  (set-face-foreground 'region "gray77")
  ;; 選択してないバッファのモードラインの文字色と背景色
  (set-face-foreground 'mode-line-inactive "gray25")
  (set-face-background 'mode-line-inactive "gray5")

  ;;syntaxもろもろ
  (set-face-foreground 'font-lock-comment-face "gray66")
  (set-face-foreground 'font-lock-string-face  "white")
  (set-face-foreground 'font-lock-keyword-face "white")
  (set-face-foreground 'font-lock-function-name-face "white")
  (set-face-bold-p 'font-lock-function-name-face t)
  (set-face-foreground 'font-lock-variable-name-face "white")
  (set-face-foreground 'font-lock-type-face "white")
  (set-face-foreground 'font-lock-builtin-face "white")
  (set-face-foreground 'font-lock-constant-face "white")
  (set-face-foreground 'font-lock-warning-face "red")
  (set-face-bold-p 'font-lock-warning-face nil)
  ;;eval時の点滅
  (set-face-foreground 'pulse-highlight-face "gray66")
  (set-face-foreground 'pulse-highlight-start-face "white")
  (set-face-background 'pulse-highlight-face "gray66")
  (set-face-background 'pulse-highlight-start-face "white")
  ;; tidalの文字色
  (set-face-foreground 'comint-highlight-prompt "white")
  (set-face-foreground 'haskell-operator-face "white")
  (set-face-foreground 'haskell-definition-face "white")
  ;; blue2
))
