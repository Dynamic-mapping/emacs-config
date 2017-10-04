(add-to-list 'load-path "~/.emacs.d/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(global-linum-mode t)
(column-number-mode t)


;;speed of mouse
(defun smooth-scroll (increment)
  (scroll-up increment) (sit-for 0.05)
  (scroll-up increment) (sit-for 0.02)
  (scroll-up increment) (sit-for 0.02)
  (scroll-up increment) (sit-for 0.05)
  (scroll-up increment) (sit-for 0.06)
  (scroll-up increment))
(global-set-key [(mouse-5)] '(lambda () (interactive) (smooth-scroll 1)))
(global-set-key [(mouse-4)] '(lambda () (interactive) (smooth-scroll -1)))

;;(global_set-key [C-m] 'set-mark-command)

;;max window
;;(setq initial-frame-alist '((top . 0) (left . 0) (width . 175) (height . 70)))
(set-background-color "black") ;; 使用黑色背景
(set-foreground-color "white") ;; 使用白色前景
(set-face-foreground 'region "green")  ;; 区域前景颜色设为绿色
(set-face-background 'region "blue") ;; 区域背景色设为蓝色

;;不要滚动栏，现在都用滚轴鼠标了，可以不用滚动栏了
(scroll-bar-mode nil)

;;修改中文文本的行距,3个象素就可以了吧
(setq-default line-spacing 3)
;;启用C-x,C-v,C-s这些通用设置
;(cua-mode t)


;; Setting English Font
;;(set-face-attribute 'default nil :font "Courier 14")

;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)

;; 去掉工具栏
(tool-bar-mode nil)

;;去掉烦人的警告铃声
(setq visible-bell nil)

;;去掉Emacs和gnus启动时的引导界面
(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message t)

;;当指针到一个括号时，自动显示所匹配的另一个括号
(show-paren-mode 1)

;;所有的问题用y/n方式，不用yes/no方式。有点懒，只想输入一个字母
(fset 'yes-or-no-p 'y-or-n-p)

(setq
backup-by-copying t ; 自动备份
backup-directory-alist
'(("." . "/home/sunbjt/emacs/bak")) ; 自动备份在目录"D:/bak"下
delete-old-versions t ; 自动删除旧的备份文件
kept-new-versions 6 ; 保留最近的6个备份文件
kept-old-versions 2 ; 保留最早的2个备份文件
version-control t) ; 多次备份

;;自动格式化代码
(dolist (command '(yank yank-pop))
(eval
`(defadvice ,command (after indent-region activate)
(and (not current-prefix-arg)
(member major-mode
'(emacs-lisp-mode
lisp-mode
clojure-mode
scheme-mode
haskell-mode
ruby-mode
rspec-mode
python-mode
c-mode
c++-mode
objc-mode
latex-mode
js-mode
plain-tex-mode))
(let ((mark-even-if-inactive transient-mark-mode))
(indent-region (region-beginning) (region-end) nil))))))
