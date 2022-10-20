set nu
set pumheight=10
set clipboard="unamedplus"
set mouse="a"
set showmode
set hlsearch
set shiftwidth=4
set tabstop=4
set showtabline=2
set splitbelow
set splitright
"set termguicolors
set completeopt=menuone,noselect
set background=dark
"set t_Co=256
"syntax enable

set wildmenu
"set wildmode=longest:list,full


"syntax on
highlight Pmenu ctermbg=Black ctermfg=White guibg=Black guifg=White

nmap qa :wq<CR>
nmap qc :q!<CR> 

" move text up/down
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

" terminal
"nmap <F5> :terminal<CR>
"open terminal on right side
nnoremap <F5> :vertical botright term<CR> 
"close terminal
tnoremap <F6> <C-w>:q!<CR>

" ctags
nmap g. <C-]>
nmap g, <C-t>
nmap gv :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

"nmap <SPACE>d :messages<CR>
nmap sc <C-w>c
nmap so <C-w>o
nmap <C-u> 9k
nmap <C-d> 9j
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

set cspc=5

if has("cscope")
	set csto=0
	set cst
	set nocsverb
		" add any database in current directory
	if filereadable("cscope.out")
	    cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
	    cs add $CSCOPE_DB
	endif
	set csverb
endif

nmap <Space>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <Space>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <Space>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <Space>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <Space>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <Space>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <Space>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <Space>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <Space>a :cs find a <C-R>=expand("<cword>")<CR><CR>

"imap <Tab> <C-n>

" tree view
nmap <F2> :Lex 30<CR>
nmap <Space>q :close<CR>
let g:netrw_liststyle=3
let g:netrw_browse_split=3


"switch to binary
nmap <F8> :%! xxd<CR>

" tab
":set tabline=%!MyTabLine()
nmap m. gt
nmap m, gT
nmap <F4> :tabc<CR>
nmap <F3> :exec("/".expand("<cword>"))<CR>
