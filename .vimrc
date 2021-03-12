" dein.vim settings {{{
" install dir {{{
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }}}

" dein installation check {{{
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }}}

" begin settings {{{
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " .toml file
  let s:rc_dir = expand('~/.vim')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein.toml'

  " read toml and cache
  call dein#load_toml(s:toml, {'lazy': 0})

  " end settings
  call dein#end()
  call dein#save_state()
endif
" }}}

" plugin installation check {{{
if dein#check_install()
  call dein#install()
endif
" }}}

" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" }}}

" シンタックスハイライトの設定
syntax on

" 自動インデントの設定
filetype plugin indent on

" --------------------------------------------------------------------
"  表示設定
" --------------------------------------------------------------------

" 行番号の表示
set number

" タイトルを表示
set title

" エラーメッセージの表示時にびーぷを鳴らさない.
set noerrorbells

" 対応する括弧やブレースを表示
set showmatch matchtime=1

" タブ文字をCTRL-Iで表示し、行末に$で表示する
set list

" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~

" コメントの色を水色
hi Comment ctermfg=3

" タブの設定
set tabstop=4 "タブを4文字分
set shiftwidth=4 "インデントの増減もスペース4文字分の幅
set expandtab

" 対応する括弧を強調表示
set showmatch
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

" 勝手に改行させない
set tw=0

set wildmenu
set history=5000

" マウスの有効化
if has('mouse')
	set mouse=a
	if has('mouse_sgr')
		set ttymouse=sgr
	elseif v:version > 703 || v:version is 703 && has('patch632')
		set ttymouse=sgr
	else
		set ttymouse=xterm2
	endif
endif

" colorschemeの微妙な変更
" green
" autocmd ColorScheme * highlight Comment ctermfg=41 guifg=#008800
" bule
autocmd ColorScheme * highlight Comment ctermfg=33 guifg=#008800

" set colorscheme to molokai.
colorscheme molokai
" iTerm2など既に256色環境ならなくても良い
set t_Co=256
syntax enable

" 現在のモードを表示
set showmode
" 打ったコマンドをステータスラインの下に表示
set showcmd
" ステータスラインの右側にカーソルの現在位置を表示する
set ruler

" help langage
set helplang=ja

set encoding=UTF-8

" ヤンクによるクリップボードへの追加許可
set clipboard+=unnamed



" --------------------------------------------------------------------
"  プラグインの設定
" --------------------------------------------------------------------
" lightline setting
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\			  [ 'gitbranch', 'readonly', 'filename', 'modified'] ]
	\ },
	\ 'component_function': {
	\   'gitbranch': 'FugitiveHead'
	\ },
	\ }
set laststatus=2 " always display statusline

" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" 自動カラーを無効にする
let g:indent_guides_auto_colors=0
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" ガイドの幅
let g:indent_guides_guide_size = 1

" airblade/vim-gitgutter
let g:gitgutter_highlight_lines = 1


" --------------------------------------------------------------------
"  キーマップの設定
" --------------------------------------------------------------------

" NERDTree
nnoremap <silent><C-e> :NERDTree<CR>
" Vim起動時に常に表示したい場合
" autocmd vimenter * NERDTree
" ファイル指定なしでvimを起動した場合だけ表示したい場合は下記行を追加
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" NERD Treeのウィンドウだけが残るような場合にVimを終了したい場合は下記行を追加。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" アイコンに色をつける
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

" vim-commentary
" autocmd FileType python setlocal commentstring=#\ %s " Filetypeを指定する場合
autocmd BufNewFile,BufRead .gitignore setlocal commentstring=#\ %s

" jjを素早く入力することでインサートモードを抜ける
inoremap <silent> jj <ESC>
