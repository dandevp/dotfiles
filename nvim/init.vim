" Load packer
lua require('plugins')

" Syntax highlighting
syntax on

"display extra whitespace, tabs and end of line
set list

"set list listchars=tab:»·,trail:·,nbsp:·
set listchars=tab:▸\ ,eol:¬,nbsp:·,trail:·

"expand tabs into spaces if necessary
"set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent

" Line numbers
set relativenumber number

" Use one space, not two, after punctuation.
set nojoinspaces

" Search options
set incsearch

" I also like gruvbox or mono-/molokai
colorscheme palenight

" Default file encoding
set encoding=utf-8

" Line wrap
set wrap

" Might be unnecessary because of plugin
set laststatus=2
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fag :Ag 

 " Mouse support I only really want this enabled for resizing the splits
 set mouse=a

 " More split stuff
 nnoremap <silent> <leader>h :vertical resize +5<cr>


" Configure optional stuff here

