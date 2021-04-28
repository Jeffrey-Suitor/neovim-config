call plug#begin()
"LSP
Plug 'neovim/nvim-lsp' "Lsp for neovim
Plug 'neovim/nvim-lspconfig' "Lsp for neovim
Plug 'nvim-treesitter/nvim-treesitter', " We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'romgrk/nvim-treesitter-context'
Plug 'glepnir/lspsaga.nvim'
Plug 'kosayoda/nvim-lightbulb'

""Better finding
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/nacro90/numb.nvim.git'

"Completion Sources
Plug 'https://github.com/hrsh7th/nvim-compe.git'
Plug 'tzachar/compe-tabnine', { 'do': './install.sh' }

"Snippets
Plug 'https://github.com/SirVer/ultisnips.git' "Snipper manager
Plug 'https://github.com/honza/vim-snippets.git' "Snippets

"Appearance
Plug 'https://github.com/lukas-reineke/indent-blankline.nvim.git', { 'branch': 'lua' }
Plug 'lewis6991/gitsigns.nvim'
Plug 'https://github.com/ap/vim-buftabline.git' " Display loaded buffers
Plug 'https://github.com/kshenoy/vim-signature.git' "Display marks
Plug 'bryall/contextprint.nvim'
" Plug 'mhinz/vim-signify' "Git gutter
Plug 'hoob3rt/lualine.nvim'
Plug 'ryanoasis/vim-devicons' "Icons
Plug 'danilamihailov/beacon.nvim' "Show new jump location
Plug 'kyazdani42/nvim-web-devicons' "More icons

"Quality of life
Plug 'djoshea/vim-autoread' "Keep files in sync
Plug 'https://github.com/tpope/vim-speeddating.git' " Increment dates
Plug 'https://github.com/tpope/vim-repeat.git' " Repeat plugins
Plug 'https://github.com/tpope/vim-commentary.git' "Commenting plugin
Plug 'https://github.com/tpope/vim-eunuch.git' "Add unix commands
Plug 'https://github.com/chaoren/vim-wordmotion.git' "Camel Case motion
Plug 'haya14busa/incsearch.vim' "Easy motion incremental search
Plug 'luochen1990/rainbow' "Rainbow parentheses
Plug 'https://github.com/bronson/vim-visual-star-search.git'
Plug 'https://github.com/bfredl/nvim-miniyank.git' "Yank ring plugin
Plug 'https://github.com/machakann/vim-sandwich.git' "Change wrapping chars
Plug 'https://github.com/unblevable/quick-scope.git' "Find unique chars
Plug 'https://github.com/jiangmiao/auto-pairs.git' "Insert pairs
Plug 'https://github.com/airblade/vim-rooter.git' "Change to root
Plug 'numtostr/FTerm.nvim'
Plug 'kevinhwang91/nvim-hlslens'

""Popups
Plug 'liuchengxu/vim-which-key' " Which key to press
Plug 'liuchengxu/vista.vim' "Tags popup
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo' "View register contents
Plug 'Yilin-Yang/vim-markbar' "Add a quick popup markbar

""Coding
Plug 'https://github.com/jmcantrell/vim-virtualenv.git', {'for': 'python'} "Virtual env wrapper for python
Plug 'kkoomen/vim-doge' "Documentation generator
Plug 'wellle/targets.vim' "More movement options

""Markdown
Plug 'https://github.com/junegunn/goyo.vim.git', {'for': 'markdown'} "Writing focus
Plug 'https://github.com/junegunn/limelight.vim.git', {'for': 'markdown'} "Section highlighting

"Colorschemes
Plug 'bluz71/vim-moonfly-colors' "Moonfly colorscheme
Plug 'https://github.com/dylanaraps/wal.vim.git' " Wal colorscheme
Plug 'https://github.com/junegunn/seoul256.vim.git' "Low contrast
Plug 'connorholyday/vim-snazzy' "A colorfull colorscheme
Plug 'https://github.com/morhetz/gruvbox.git' "Gruvbox theme
Plug 'https://github.com/tomasr/molokai.git' "Molokai theme
Plug 'https://github.com/sonph/onehalf.git' "Good dark colorscheme
Plug 'https://github.com/jnurmine/Zenburn.git' "Zenburn theme
Plug 'dracula/vim', { 'as': 'dracula' } "Dracula theme
call plug#end()

:lua << END

    local actions = require('telescope.actions')
    require('telescope').setup {
        defaults = {
            file_sorter = require('telescope.sorters').get_fzy_sorter,
            prompt_prefix = ' >',
            color_devicons = true,

            file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
            grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
            qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

            mappings = {
                i = {
                    ["<c-q>"] = require('telescope.actions').close,
                    ["<C-l>"] = actions.send_to_qflist,
                },
            }
        },
        extensions = {
            fzy_native = {
                override_generic_sorter = false,
                override_file_sorter = true,
            }
        }
    }

    require('lualine').setup{
        options = {
            theme = 'dracula'
        }
    }

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            underline = false,
            signs = true,
            update_in_insert = false,
            virtual_text = {
                prefix = '',
                spacing = 2,
                severity_limit = "Warning",
            },
        }
    )

    require ('gitsigns').setup()

    require ('numb').setup()

    require 'nvim-treesitter.configs'.setup {
        highlight = {
            enable = true
        },
        refactor = {
            highlight_definitions = { enable = true },
        },
    }

    require 'lspconfig'.tsserver.setup{}
    require 'lspconfig'.pyls.setup{}
    require 'lspconfig'.html.setup{}
    require 'lspconfig'.jsonls.setup{}
    require 'lspconfig'.cssls.setup{}
    require 'lspconfig'.ccls.setup{}
    require 'lspconfig'.sqlls.setup{
        cmd = {"sql-language-server", "up", "--method", "stdio"}
    }

END

"leader remap
nnoremap <Space> <Nop>
let g:mapleader = "\<Space>"

call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

"Use function keys to move windows
nmap <F1> <Plug>BufTabLine.Go(1)
nmap <F2> <Plug>BufTabLine.Go(2)
nmap <F3> <Plug>BufTabLine.Go(3)
nmap <F4> <Plug>BufTabLine.Go(4)
nmap <F5> <Plug>BufTabLine.Go(5)
nmap <F6> <Plug>BufTabLine.Go(6)
nmap <F7> <Plug>BufTabLine.Go(7)
nmap <F8> <Plug>BufTabLine.Go(8)
nmap <F9> <Plug>BufTabLine.Go(9)
nmap <F10> <Plug>BufTabLine.Go(10)
nmap <F11> <Plug>BufTabLine.Go(11)
nmap <F12> <Plug>BufTabLine.Go(12)

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Override default p and P
nmap p <Plug>(miniyank-autoput)
nmap P <Plug>(miniyank-autoPut)
nmap P <Plug>(miniyank-autoPut)
nmap <C-p> <Plug>(miniyank-cycle)<CR>
nmap <M-p> <Plug>(miniyank-cycleback)<CR>
let g:AutoPairsShortcutToggle = '<M-C-p>'

" Define prefix dictionary
let g:which_key_map =  {}

" Manage session
let g:session_dir = '~/.config/nvim/sessions'
exec 'nnoremap <Leader>Z :mks! ' . g:session_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>z :so ' . g:session_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'
let g:which_key_map.z="load-session"
let g:which_key_map.Z="save-session"

"Git menu"
let g:which_key_map.g = {
  \ 'name' : '+git' ,
  \ 's' : ['Gstatus'                                      , 'status']                 ,
  \ 'p' : ['Gpush'                                        , 'push']                   ,
  \ 'c' : ['Gcommit'                                      , 'commit']                 ,
  \ 'a' : ['Gwrite'                                       , 'add-current-file']       ,
  \ 'r' : ['Gremove'                                      , 'remove-current-file']    ,
  \ 'B' : ['Gblame'                                       , 'blame']                  ,
  \ 'b' : ['Gbrowse'                                      , 'browse']                 ,
  \ 'f' : [':lua require"telescope.builtin".git_files{}'  , 'git-files']              ,
  \ 'F' : ['GFiles?'                                      , 'non-git-files']          ,
  \ 'h' : ['Commits'                                      , 'commit-history']         ,
  \ 'H' : ['BCommits'                                     , 'current-buffer-commits'] ,
  \ }

let g:which_key_map.w = {
  \ 'name' : '+window' ,
  \ 'h' : ['<M-h>'      , 'focus-left']             ,
  \ 'j' : ['<M-j>'      , 'focus-down']             ,
  \ 'k' : ['<M-k>'      , 'focus-up']               ,
  \ 'l' : ['<M-l>'      , 'focus-right']            ,
  \ 'n' : ['vnew'       , 'open-vertical-window']   ,
  \ 'N' : ['new'        , 'open-horizontal-window'] ,
  \ '|' : ['vsplit'     , 'split-window-right']     ,
  \ '-' : ['split'      , 'split-window-below']     ,
  \ 'o' : ['only'       , 'focus-current-window']   ,
  \ 'w' : ['<C-W>w'     , 'other-window']           ,
  \ 'd' : ['<C-W>c'     , 'delete-window']          ,
  \ '2' : ['<C-W>v'     , 'layout-double-columns']  ,
  \ '=' : ['<C-W>='     , 'balance-window']         ,
  \ '?' : ['Windows'    , 'fzf-window']             ,
  \ }

let g:which_key_map.b = {
  \ 'name' : '+buffers' ,
  \ 'd' : ['bdelete'                                    , 'close-buffer']     ,
  \ 'j' : ['bnext'                                      , 'next-buffer']      ,
  \ 'k' : ['bprevious'                                  , 'previous-buffer']  ,
  \ 'l' : ['blast'                                      , 'last-buffer']      ,
  \ 'b' : [':lua require"telescope.builtin".buffers{}'  , 'search-buffers']   ,
  \ }

let g:which_key_map.f = {
  \ 'name' : '+find'  ,
  \ ' ' : [':lua require"telescope.builtin".find_files{ cwd = "~/" }' , 'files-from-home']      ,
  \ 'f' : [':lua require"telescope.builtin".find_files{}'             , 'files']                ,
  \ 'g' : [':lua require"telescope.builtin".git_files{}'              , 'git-files']            ,
  \ 'b' : [':lua require"telescope.builtin".buffers{}'                , 'buffers']              ,
  \ 'R' : [':lua require"telescope.builtin".live_grep{}'              , 'grep']                 ,
  \ 't' : [':lua require"telescope.builtin".tags{}'                   , 'tags']                 ,
  \ 'm' : [':lua require"telescope.builtin".marks{}'                  , 'marks']                ,
  \ 'o' : [':lua require"telescope.builtin".oldfiles{}'               , 'oldfiles']             ,
  \ 'q' : [':lua require"telescope.builtin".quickfix{}'               , 'quickfixes']           ,
  \ 'l' : [':lua require"telescope.builtin".loclist{}'                , 'loclist']              ,
  \ 'c' : [':lua require"telescope.builtin".command_history{}'        , 'command-history']      ,
  \ 'M' : [':lua require"telescope.builtin".keymaps{}'                , 'keymaps']              ,
  \ 'T' : [':lua require"telescope.builtin".treesitter{}'             , 'treesitter']
  \ }

let g:which_key_map.f._ = {
  \ 'name' : '+more'  ,
  \ 'g' : ['GFiles?'      , 'git-files']            ,
  \ 'l' : ['Locate'       , 'locate']               ,
  \ 'h' : ['History'      , 'history']              ,
  \ 'o' : ['History:'     , 'command-history']      ,
  \ 's' : ['History/'     , 'search-history']       ,
  \ 'C' : ['Commits'      , 'commits']              ,
\ }


let g:which_key_map.l = {
  \ 'name' : '+lsp'  ,
  \  'd' : [':lua vim.lsp.buf.declaration()'                          , 'declaration']  ,
  \  'D' : [':lua vim.lsp.buf.definition()'                           , 'definition']  ,
  \  'h' : [':lua vim.lsp.buf.hover()'                                , 'hover']  ,
  \  'i' : [':lua vim.lsp.buf.implementation()'                       , 'implementation']  ,
  \  'g' : [':lua vim.lsp.buf.signature_help()'                       , 'signature-help']  ,
  \  'T' : [':lua vim.lsp.buf.type_definition()'                      , 'type-definition']  ,
  \  'p' : [':lua require"lsp_util".peek_definition()'                , 'peek-definition']  ,
  \  'b' : [':lua vim.lsp.buf.formatting()'                           , 'format']  ,
  \  'P' : [':lua vim.lsp.buf.rename()'                               , 'rename']  ,
  \  'o' : [':lua require"diagnostic.util".show_line_diagnostics()'   , 'line-diagnostics']  ,
  \  'O' : [':lua vim.lsp.diagnostic.set_loclist()'                   , 'error-list']
\ }

"Number Remaps
let g:which_key_map.0="terminal"
nnoremap <silent> <leader>0 :FTermToggle<CR>

let g:which_key_map.1="compile"
nnoremap <silent> <leader>1 :!compile.sh %<CR>

let g:which_key_map.2="toggle-spelling"
nnoremap <silent> <leader>2 :spell!<CR>

let g:which_key_map.3="generate-documentation"
nnoremap <silent> <leader>3 :DogeGenerate<CR>

let g:which_key_map.4="symbols"
nnoremap <silent> <leader>4 :Vista!!<CR>

let g:which_key_map.5="markbar"
map <silent> <leader>5 <Plug>ToggleMarkbar

let g:which_key_map.6="Goyo"
map <silent> <leader>6 :Goyo<CR>

let g:which_key_map.7="quickfix"
nnoremap <silent> <leader>7 :call ToggleQuickFix()<CR>

let g:which_key_map.8="location-list"
nnoremap <silent> <leader>8 :call ToggleLocationList()<CR>

let g:which_key_map.9="diagnostic"
nnoremap <silent> <leader>9 :lua vim.lsp.diagnostic.set_loclist()<CR>

"Key Remaps
let g:which_key_map.s="next-spell-err"
nnoremap <leader>s ]s

let g:which_key_map.S="prev-spell-err"
nnoremap <leader>S [s

let g:which_key_map.r="rename"
nnoremap <leader>r :lua vim.lsp.buf.rename()<CR>

nnoremap <silent> <leader>\ :nohlsearch<CR>

"Quick search mappings"

""Lsp stuff
let g:which_key_map.l.c="code_action"
nnoremap <silent><leader>lc <cmd>lua require('lspsaga.codeaction').code_action()<CR>

nnoremap <silent> <C-g> :lua require"telescope.builtin".git_files{}<CR>
nnoremap <silent> <C-Space> :lua require"telescope.builtin".live_grep{}<CR>
nnoremap <silent> <C-m> :lua require"telescope.builtin".quickfix{}<CR>
nnoremap <silent> <M-m> :lua require"telescope.builtin".loclist{}<CR>

"Error mappings
nnoremap <C-e> :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <M-e> :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <M-C-e> :lua vim.lsp.diagnostic.set_loclist()<CR>

"LSP Symbols mappings
nnoremap <C-s> :lua require'telescope.builtin'.lsp_document_symbols{}<CR>
nnoremap <M-s> :lua require'telescope.builtin'.lsp_workspace_symbols{}<CR>
nnoremap <M-C-s> :lua require'telescope.builtin'.lsp_references{}<CR>
let g:which_key_map.f.r="references"
let g:which_key_map.f.s="document_symbols"
let g:which_key_map.f.S="workspace_symbols"
nnoremap <silent> <leader>fr :lua require"telescope.builtin".lsp_references{}<CR>
nnoremap <silent> <leader>fs :lua require"telescope.builtin".lsp_document_symbols{}<CR>
nnoremap <silent> <leader>fS :lua require"telescope.builtin".lsp_workspace_symbols{}<CR>

"Declaration and Definition mappings (origin)
nnoremap <C-o> :lua vim.lsp.buf.declaration()'<CR>
nnoremap <M-o> :lua vim.lsp.buf.definition()'<CR>
nnoremap <M-C-o> :lua vim.lsp.buf.type_definition()'<CR>

"Quick commands
nnoremap <C-c> :lua require"telescope.builtin".command_history{}<CR>

"Notes
nnoremap <C-i> :lua vim.lsp.buf.hover()<CR>
nnoremap <M-i> :lua vim.lsp.buf.signature_help()<CR>
nnoremap <M-C-i> :lua require"diagnostic.util".show_line_diagnostics()<CR>

"Improved maps
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
nnoremap \ :vsplit<CR>
nnoremap - :split<CR>
vnoremap <C-h> ^
nnoremap <C-j> <C-i>
nnoremap ]j <C-i>
nnoremap [j <C-o>
nnoremap <C-k> <C-o>
vnoremap <C-l> $
nnoremap <C-q> :bdelete<CR>
nnoremap <M-q> <C-w>q

"Allow line navigation"
nnoremap j gj
nnoremap k gk

"Allow cut to end of line"
nnoremap Y y$

" Keep search results at the center of screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

"Resize maps
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

"Insert mode remaps
inoremap jk <esc>

"delete marks
nnoremap <silent> dm :execute 'delmarks '.nr2char(getchar())<cr>

"Basic Configurations
set autochdir "cd into directory of current buffer
set autoindent "automatically indent
set autoread "Make sure to keep all files updated

set backspace=indent,eol,start "Fix backspace issues
set belloff=all "Turn off all bells
set breakindent

set complete-=i "Don't search included files
set clipboard=unnamed,unnamedplus "Set clipboard
set colorcolumn=80
set completeopt=menu,menuone,noselect
set conceallevel=0 "Set conceal to 0 so we can see guide lines
set cursorline

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

set gdefault "when substituting use g by default

set hidden "Allow vim to keep files open if not on screen
set hlsearch "Highlight searches"

set incsearch "Allow incremntal search
set ignorecase "ignore letter case
set inccommand=nosplit

set linebreak " Break lines at words
set lazyredraw "faster on large files
set list
set listchars=tab:>~,trail:~,extends:>,precedes:<,nbsp:_

set matchpairs+=<:>
set modelines=1 "check the file line of the file for modeline

set number relativenumber "Set hybrid lines
set nospell " no spelling"
set nobackup nowritebackup noswapfile "If you save often then this stuff gets annoying

set signcolumn="yes"
set shortmess+=c
set shiftround "round indent to a multiple of shift width for << or >>
set spellfile=~/.config/nvim/spell/dictionary.utf-8.add spelllang=en_ca
set smartcase "override ignore case if there is capitals
set showcmd showmode title "show command and show mode
set splitbelow splitright "Make splits proper
set scrolloff=999 "Lets you scroll through your document
set showbreak=\\ " [bonus]
syntax enable "enable syntax processing
set sessionoptions=folds

set thesaurus+=~/.config/nvim/spell/Thesaurus.txt
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab "Set tab stops to 4 spaces
set termguicolors
set ttimeout
set ttimeoutlen=0
set timeoutlen=500
set updatetime=1

set undodir=/tmp
set undofile

set viewoptions=folds,cursor

set wildmenu wildchar=<TAB> wildmode=list:longest,full
set wildignore+=*.a,*.o,*.pyc,*~,*.swp,*.tmp

"Plugin Configurations
"
" HL search
noremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap * *<Cmd>lua require('hlslens').start()<CR>
noremap # #<Cmd>lua require('hlslens').start()<CR>
noremap g* g*<Cmd>lua require('hlslens').start()<CR>
noremap g# g#<Cmd>lua require('hlslens').start()<CR>

"Buftabline
let g:buftabline_show=1
let g:buftabline_numbers=2

"Completion
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 1000
let g:compe.source_timeout = 2000
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:false

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.nvim_lsp = v:true
 let g:compe.source.tabnine = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:false
let g:compe.source.vsnip = v:false
let g:compe.source.nvim_lua = v:false
let g:compe.source.spell = v:false
let g:compe.source.tags = v:false
let g:compe.source.snippets_nvim = v:false
let g:compe.source.treesitter = v:false

"FZF
let g:fzf_preview_window = 'right:60%'

"Gitgutter
highlight SignColumn guibg=bg

"Indent line
let g:indentLine_char = '┃'

tnoremap <Esc> <C-\><C-n>

"Markbar
let g:markbar_marks_to_display = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let g:markbar_num_lines_context = {
    \ 'around_local' : 2,
    \ 'around_file' : 0,
    \ 'peekaboo_around_local' : 2,
    \ 'peekaboo_around_file' : 0}

"Quickscope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"Rainbow Parentheses
let g:rainbow_active = 1

"Vista
let g:vista_default_executive = 'nvim_lsp'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1

"WhichKey
let g:which_key_vertical=1
let g:which_key_use_floating_win = 0

"Wal.vim
colorscheme dracula

sign define LspDiagnosticsSignError       text= texthl=LspDiagnosticsSignError       linehl=LspDiagnosticsSignError       numhl=LspDiagnosticsSignError
sign define LspDiagnosticsSignWarning     text= texthl=LspDiagnosticsSignWarning     linehl=LspDiagnosticsSignWarning     numhl=LspDiagnosticsSignWarning    
sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl=LspDiagnosticsSignInformation numhl=LspDiagnosticsSignInformation
sign define LspDiagnosticsSignHint        text= texthl=LspDiagnosticsSignHint        linehl=LspDiagnosticsSignHint        numhl=LspDiagnosticsSignHint       

" Underline the offending code
hi LspDiagnosticsUnderlineError guifg=NONE ctermfg=NONE cterm=underline gui=underline
hi LspDiagnosticsUnderlineWarning guifg=NONE ctermfg=NONE cterm=underline gui=underline
hi LspDiagnosticsUnderlineInformation guifg=NONE ctermfg=NONE cterm=underline gui=underline
hi LspDiagnosticsUnderlineHint guifg=NONE ctermfg=NONE cterm=underline gui=underline

"Auto commands
augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end

autocmd BufWritePost bashAliases.txt,configFiles.txt,folderFile.txt :!keyMapper.sh

autocmd BufWritePost config.h : !sudo make clean install

"Hide status line for which key and fzf"
augroup remove_status_line
autocmd! FileType which_key,fzf
autocmd  FileType which_key,fzf set laststatus=0 noshowmode noruler
\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

augroup spelling
    autocmd!
    autocmd FileType markdown setlocal spell
augroup END

augroup PYTHON
    autocmd!
    autocmd! FileType python set tabstop=4 shiftwidth=4 softtabstop=4 expandtab "Set tab stops to 4 spaces
    autocmd! FileType javascript set tabstop=4 shiftwidth=4 softtabstop=4 expandtab "Set tab stops to 4 spaces
    autocmd! FileType html set tabstop=4 shiftwidth=4 softtabstop=4 expandtab "Set tab stops to 4 spaces
    autocmd! FileType css set tabstop=4 shiftwidth=4 softtabstop=4 expandtab "Set tab stops to 4 spaces
augroup END

"Limelight intergration into Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"better popup window
function! DisableExtras()
  call nvim_win_set_option(g:float_preview#win, 'number', v:false)
  call nvim_win_set_option(g:float_preview#win, 'relativenumber', v:false)
  call nvim_win_set_option(g:float_preview#win, 'cursorline', v:false)
endfunction

autocmd User FloatPreviewWinOpen call DisableExtras()
let g:float_preview#docked = 0

augroup LuaHighlight
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


if has('nvim') && exists('&winblend') && &termguicolors
  set winblend=20

  hi NormalFloat guibg=None
  if exists('g:fzf_colors.bg')
    call remove(g:fzf_colors, 'bg')
  endif

  if stridx($FZF_DEFAULT_OPTS, '--border') == -1
    let $FZF_DEFAULT_OPTS .= ' --border'
  endif

  function! FloatingFZF()
    let width = float2nr(&columns * 0.8)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
               \ 'row': (&lines - height) / 2,
               \ 'col': (&columns - width) / 2,
               \ 'width': width,
               \ 'height': height }

    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

function! ToggleLocationList()
    if empty(filter(getwininfo(), 'v:val.loclist'))
        lopen
    else
        lclose
    endif
endfunction

"Show the light bulb for code actions
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

"Show line diagnostics
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" Correct typos
aug FixTypos
    :command! WQ wq
    :command! Wq wq
    :command! QA qa
    :command! Qa qa
    :command! W w
    :command! Q q
aug end

