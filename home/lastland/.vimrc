call pathogen#infect()
filetype plugin indent on
syntax on
set nu			" line number
set softtabstop=4	" tab equals to 4 blanks
set autoindent		" auto indent
set showcmd		" show command in status line
set ruler		" show line and column number of cursor position
set showmatch		" jump to the matching bracket after a new bracket being insertd
set hlsearch		" highlight the search results
set incsearch		" real time search
set formatoptions=r	" r means automatically insert current comment leader for a new line
" about colorscheme solarized
set t_Co=256
set background=dark
colorscheme solarized
call togglebg#map("<F5>")
