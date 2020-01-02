syntax enable

"-------------General Settings--------------"
set backspace=indent,eol,start                                          "Make backspace behave like every other editor.
let mapleader = ',' 						    	"The default leader is \, but a comma is much better.
set number								"Let's activate line numbers.


"-------------Visuals--------------"
colorscheme atom-dark
set t_CO=256
set guifont=Fira_Code:h15
set linespace=15   						        "Macvim-specific line-height.

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

"-------------Search--------------"
set hlsearch
set incsearch


"-------------Mappings--------------"

"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>




"-------------Auto-Commands--------------"

"Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
