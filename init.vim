syntax on

" Leader
" ------
let mapleader = ","
set timeoutlen=500

filetype on
filetype indent on
filetype plugin on
set encoding=UTF-8
:set ignorecase
:set smartcase


set nocompatible
set hlsearch
set number relativenumber
set laststatus=2
set vb
set spelllang=en_gb
set autoindent
set autochdir

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" Netrw
nnoremap - :Explore<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
autocmd FileType netrw setl bufhidden=delete
" End Netrw

call plug#begin()

" TODO I really need to figure this one out, could be a life save
" Aligner
Plug 'junegunn/vim-easy-align'

" Basics
Plug 'vim-airline/vim-airline' " https://github.com/vim-airline/vim-airline
Plug 'ryanoasis/vim-devicons'  " https://github.com/ryanoasis/vim-devicons + https://github.com/ryanoasis/nerd-fonts/
Plug 'airblade/vim-gitgutter'  " https://github.com/airblade/vim-gitgutter
Plug 'mkitt/tabline.vim'       " https://github.com/mkitt/tabline.vim

" Misc or better yet, tpope section
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-dispatch'
Plug 'folke/which-key.nvim'

" Theme
Plug 'gruvbox-community/gruvbox'
Plug 'luisiacc/gruvbox-baby'
Plug 'ayu-theme/ayu-vim'
Plug 'mhartington/oceanic-next'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'christophermca/meta5'

" Undo tree!
Plug 'mbbill/undotree'

" Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Harpoon
Plug 'ThePrimeagen/harpoon'

" Plebvim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'L3MON4D3/LuaSnip' " Snippets plugin

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'hrsh7th/nvim-cmp'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}     " https://github.com/neoclide/coc.nvim

" Python
" Yes, I am a sneaky snek now
Plug 'ambv/black'
Plug 'petobens/poet-v'
Plug 'fisadev/vim-isort'

" Barbell
Plug '~/bionichound/vim-barbell'

call plug#end()

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nmap <leader>Y "+Y

" Window navigation
nnoremap <silent> <leader>T :tabnew<cr>
nnoremap <silent> <leader>tl :tabnext<cr>
nnoremap <silent> <leader>th :tabprev<cr>
nnoremap <silent> <leader>q :q<cr>
nnoremap <silent> <leader>V :vsplit<cr>
nnoremap <silent> <leader>S :split<cr>
nnoremap <silent> <leader>l <c-w>l
nnoremap <silent> <leader>h <c-w>h
nnoremap <silent> <leader>j <c-w>j
nnoremap <silent> <leader>k <c-w>k
nnoremap <silent> <leader>b :bnext<cr>
nnoremap <silent> <leader>B :bprevious<cr>
" Resizing
nnoremap <silent> <leader>w] :resize +10<cr>
nnoremap <silent> <leader>w[ :resize -10<cr>
nnoremap <silent> <leader>w< :vertical resize -10<cr>
nnoremap <silent> <leader>w<< :vertical resize -25<cr>
nnoremap <silent> <leader>w> :vertical resize +10<cr>
nnoremap <silent> <leader>w>> :vertical resize +25<cr>


" PlugInstall
nnoremap <F12> :PlugInstall<cr>

" Git
" ---------------
nnoremap <silent> <leader>gs :Git<cr>
nnoremap <silent> <leader>gaa :Git add .<cr>
nnoremap <silent> <leader>ggp  :Git push origin<cr>
nnoremap <leader>ga :Git add 
nnoremap <leader>gcsm :Git commit -s -S -m
nnoremap <leader>gloda :Git log --oneline --decorate --graph --all<cr>

" Source vimrc
nnoremap <silent> <Leader><Leader>r :source $MYVIMRC<cr>

" Edit vimrc
nnoremap <silent> <Leader>v :e $MYVIMRC<cr>

" Telescope
:lua require("telescope_config")
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>ffg <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Harpoon
" :lua require("telescope").load_extension('harpoon')
" nnoremap <leader>ha <cmd>:lua require("harpoon.mark").add_file()<cr>
" nnoremap <leader>hu <cmd>:lua require("harpoon.ui").toggle_quick_menu()<cr>
" nnoremap <leader>ht <cmd>:lua require("harpoon.term").gotoTerminal(1)<cr>

" Clear search match
nnoremap <silent> <Leader>cl :let @/=""<cr>

" Colorscheme
" colorscheme meta5
colorscheme OceanicNext

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Do the python
let g:python3_host_prog='~/.pyenv/shims/python'

" LSP stuff
:lua require("lsp")

" Barbell
xnoremap <silent> <F10> :PostJson<CR>
