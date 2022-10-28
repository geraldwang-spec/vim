set nu
set pumheight=10
set clipboard="unamedplus"
set mouse="a"
set showmode
"set hlsearch
set shiftwidth=4
set tabstop=4
set showtabline=2
set splitbelow
set splitright
"set termguicolors
set completeopt=menuone,noselect
set background=dark
set laststatus=2
set autoread
set wildmenu
set noswapfile

syntax on
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
set tags=./tags
nmap g. <C-]>
nmap g, <C-t>
nmap gv :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

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




" vim plugin
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  "autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
	Plug 'junegunn/vim-plug'	
	"Plug 'neoclide/coc.nvim', {'branch': 'release'}
	"Plug 'scrooloose/nerdtree'
	"Plug 'liuchengxu/vim-which-key'

	" On-demand lazy load
	Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }	
	autocmd! User vim-which-key call which_key#register('\<Space>', 'g:which_key_map')

call plug#end()

"whick key
nmap <Space>s :cs find s <C-R>=expand("<cword>")<CR><CR> 
nmap <Space>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <Space>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <Space>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <Space>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <Space>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <Space>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <Space>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <Space>a :cs find a <C-R>=expand("<cword>")<CR><CR>

set timeoutlen=500
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>

"call which_key#register('<Space>', 'g:which_key_map', 'n')
"call which_key#register('<Space>', 'g:which_key_map_visual', 'v')

"
"let g:which_key_map = {'w':'apple'}


"let g:which_key_map =  {'w': 'buffer 1'}
"let g:which_key_map.f = { 'name' : '+file' }
"
"
"nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
"vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

"  Define prefix dictionary
"  let g:which_key_map =  {}
"
"  Second level dictionaries:
"  'name' is a special field. It will define the name of the group.
"  leader-f is the "+file" group.
"  Unnamed groups will show a default string
"  let g:which_key_map.f = { 'name' : '+file' }
"
"  nnoremap <silent> <leader>fs :update<CR>
"  let g:which_key_map.f.s = ['update', 'save-file']
"
"  Provide commands and descriptions for existing mappings
"  command, <Plug>/<C-W>/<C-d> mapping are supported
"  nnoremap <silent> <leader>fd :e $MYVIMRC<CR>
"  let g:which_key_map.f.d = ['e $MYVIMRC', 'open-vimrc']
"
"  let g:which_key_map.o = { 'name' : '+open' }
"
"  nnoremap <silent> <leader>oq  :copen<CR>
"  let g:which_key_map.o.q = ['copen', 'open-quickfix']
"
"  nnoremap <silent> <leader>ol  :lopen<CR>
"  let g:which_key_map.o.l = ['lopen', 'open-locationlist']
"
"  Create new menus not based on existing mappings:
"  let g:which_key_map.b = {
"       \ 'name' : '+buffer' ,
"       \ '1' : ['b1'        , 'buffer 1']        ,
"       \ '2' : ['b2'        , 'buffer 2']        ,
"       \ 'd' : ['bd'        , 'delete-buffer']   ,
"       \ 'f' : ['bfirst'    , 'first-buffer']    ,
"       \ 'h' : ['Startify'  , 'home-buffer']     ,
"       \ 'l' : ['blast'     , 'last-buffer']     ,
"       \ 'n' : ['bnext'     , 'next-buffer']     ,
"       \ 'p' : ['bprevious' , 'previous-buffer'] ,
"       \ '?' : ['Buffers'   , 'fzf-buffer']      ,
"       \ }
"
"  let g:which_key_map.l = {
"       \ 'name' : '+lsp'                                            ,
"       \ 'f' : ['LanguageClient#textDocument_formatting()'     , 'formatting']
"    ,
"       \ 'h' : ['LanguageClient#textDocument_hover()'          , 'hover']
"    ,
"       \ 'r' : ['LanguageClient#textDocument_references()'     , 'references']
"    ,
"       \ 'R' : ['LanguageClient#textDocument_rename()'         , 'rename']
"    ,
"       \ 's' : ['LanguageClient#textDocument_documentSymbol()' , 'document-
"    symbol']  ,
"       \ 'S' : ['LanguageClient#workspace_symbol()'            , 'workspace-
"    symbol'] ,
"       \ 'g' : {
"         \ 'name': '+goto',
"         \ 'd' : ['LanguageClient#textDocument_definition()'     ,
"    'definition']       ,
"         \ 't' : ['LanguageClient#textDocument_typeDefinition()' , 'type-
"    definition']  ,
"         \ 'i' : ['LanguageClient#textDocument_implementation()'  ,
"    'implementation']   ,
"         \ },
"       \ }



" setting command
command Vimconfig tabe $HOME/.vimrc

function CtagCS()
	echo system("rm -rf ./tags")
	echo system("rm -rf ./cscope.*")

	echo "ctags running..."
	echo system("ctags -R")
	echo "cscope running..."
	echo system("cscope -Rb")
	set csto=0
	set cst
	cs add cscope.out
	set tags=./tags
	set nocsverb
	set csverb

	echo "end cscope and tags file"	
endfunction
command Cproject call CtagCS()

