packadd termdebug
let g:ale_disable_lsp = 1

call plug#begin()
"Main engines
Plug 'neovim/nvim-lsp' "Lsp for neovim
Plug 'nvim-treesitter/nvim-treesitter' "Treesitter for better highlighting
Plug 'neovim/nvim-lspconfig'
"Better finding
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
"Completion Sources
Plug 'nvim-lua/completion-nvim' "Completion framework
Plug 'steelsojka/completion-buffers' "Completion from buffers
Plug 'aca/completion-tabnine', { 'do': './install.sh' } "tabnine source
"Diagnostics and Linting
Plug 'nvim-lua/diagnostic-nvim' "Improve diagnostics
Plug 'dense-analysis/ale' "Linting and fixing
"Snippets
Plug 'https://github.com/SirVer/ultisnips.git' "Snipper manager
Plug 'https://github.com/honza/vim-snippets.git' "Snippets
"Appearance
Plug 'https://github.com/Yggdroot/indentLine.git' " Line guides
Plug 'https://github.com/ap/vim-buftabline.git' " Display loaded buffers
Plug 'https://github.com/kshenoy/vim-signature.git' "Display marks
Plug 'https://github.com/airblade/vim-gitgutter.git' "Git gutters
Plug 'vim-airline/vim-airline' "Status line
Plug 'vim-airline/vim-airline-themes' "themes
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
Plug 'https://github.com/bfredl/nvim-miniyank.git' "Yank ring plugin
Plug 'https://github.com/machakann/vim-sandwich.git' "Change wrapping chars
Plug 'https://github.com/unblevable/quick-scope.git' "Find unique chars
Plug 'https://github.com/jiangmiao/auto-pairs.git' "Insert pairs
Plug 'https://github.com/airblade/vim-rooter.git' "Change to root
Plug 'https://github.com/tpope/vim-unimpaired.git' "better pairings
"Popups
Plug 'simnalamburt/vim-mundo' "undo tree
Plug 'liuchengxu/vim-which-key' " Which key to press
Plug 'liuchengxu/vista.vim' "Tags popup
Plug 'junegunn/fzf.vim' "FZF
Plug 'junegunn/vim-peekaboo' "View register contents
Plug 'Yilin-Yang/vim-markbar' "Add a quick popup markbar
"Coding
Plug 'https://github.com/jmcantrell/vim-virtualenv.git', {'for': 'python'} "Virtual env wrapper for python
Plug 'kkoomen/vim-doge' "Documentation generator
Plug 'https://github.com/tpope/vim-fugitive.git' "Git support
Plug 'wellle/targets.vim' "More movement options
Plug 'wellle/context.vim' "Keep context of things
"Markdown
Plug 'https://github.com/mzlogin/vim-markdown-toc.git', {'for': 'markdown'} " Generate a table of contents
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

call plug#end()

"Language servers"
:lua << END
local on_attach_vim = function()
  require'completion'.on_attach()
  require'diagnostic'.on_attach()
end
  require 'nvim_lsp'.pyls_ms.setup{on_attach=on_attach_vim}
  require 'nvim_lsp'.html.setup{on_attach=on_attach_vim}
  require 'nvim_lsp'.jsonls.setup{on_attach=on_attach_vim}
  require 'nvim_lsp'.cssls.setup{on_attach=on_attach_vim}
  require 'nvim_lsp'.tsserver.setup{on_attach=on_attach_vim}
  require 'nvim_lsp'.ccls.setup{on_attach=on_attach_vim}
  require 'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    highlight = {
      enable = true
    },
  }
END

autocmd BufEnter * lua require'completion'.on_attach()

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
nmap <silent> <leader>p :YanksAfter<CR>

" Cycle yanks with Ctrl+p
nmap <C-p> <Plug>(miniyank-cycle)<CR>
nmap <C-n> <Plug>(miniyank-cycleback)<CR>

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
  \ 'h' : ['<C-w>h'     , 'focus-left']             ,
  \ 'j' : ['<C-w>j'     , 'focus-down']             ,
  \ 'k' : ['<C-w>k'     , 'focus-up']               ,
  \ 'l' : ['<C-w>l'     , 'focus-right']            ,
  \ 'n' : ['vnew'       , 'open-vertical-window']   ,
  \ 'N' : ['new'        , 'open-horizontal-window'] ,
  \ 'q' : ['wq'         , 'save-and-quit']          ,
  \ 'Q' : ['quit!'      , 'quit-without-saving']    ,
  \ '|' : ['vsplit'     , 'split-window-right']     ,
  \ '-' : ['split'      , 'split-window-below']     ,
  \ 'o' : ['only'       , 'focus-current-window']   ,
  \ 'w' : ['<C-W>w'     , 'other-window']           ,
  \ 'd' : ['<C-W>c'     , 'delete-window']          ,
  \ '2' : ['<C-W>v'     , 'layout-double-columns']  ,
  \ 'H' : ['<C-W>5<'    , 'expand-window-left']     ,
  \ 'J' : ['resize +5'  , 'expand-window-below']    ,
  \ 'L' : ['<C-W>5>'    , 'expand-window-right']    ,
  \ 'K' : ['resize -5'  , 'expand-window-up']       ,
  \ '=' : ['<C-W>='     , 'balance-window']         ,
  \ '?' : ['Windows'    , 'fzf-window']             ,
  \ }

let g:which_key_map.B = {
  \ 'name' : '+buffers' ,
  \ 'd' : ['bdelete'                                    , 'close-buffer']     ,
  \ 'j' : ['bnext'                                      , 'next-buffer']      ,
  \ 'k' : ['bprevious'                                  , 'previous-buffer']  ,
  \ 'l' : ['blast'                                      , 'last-buffer']      ,
  \ 'b' : [':lua require"telescope.builtin".buffers{}'  , 'search-buffers']   ,
  \ }
let g:which_key_map.b = 'search-buffers'
nnoremap <leader>b :lua require'telescope.builtin'.buffers{}<CR>

let g:which_key_map.f = {
  \ 'name' : '+find'  ,
  \ ' ' : [':lua require"telescope.builtin".find_files{ cwd = "~/" }' , 'files-from-home']      ,
  \ 'f' : [':lua require"telescope.builtin".find_files{}'             , 'files']                ,
  \ 'g' : [':lua require"telescope.builtin".git_files{}'              , 'git-files']            ,
  \ 'b' : [':lua require"telescope.builtin".buffers{}'                , 'buffers']              ,
  \ 'r' : [':lua require"telescope.builtin".live_grep{}'              , 'grep']                 ,
  \ 't' : ['Tags'                                                     , 'tags']                 ,
  \ 'T' : ['BTags'                                                    , 'tags-current-buffer']  ,
  \ 'm' : ['Marks'                                                    , 'marks']                ,
  \ 'o' : [':lua require"telescope.builtin".oldfiles{}'               , 'oldfiles']             ,
  \ 'q' : [':lua require"telescope.builtin".quickfix{}'               , 'quickfixes']           ,
  \ 'l' : [':lua require"telescope.builtin".loclist{}'                , 'loclist']              ,
  \ 'h' : [':lua require"telescope.builtin".command_history{}'        , 'command-history']      ,
  \ }

let g:which_key_map.f._ = { 
  \ 'name' : '+more'  ,
  \ 'g' : ['GFiles?'      , 'git-files']            ,
  \ 'l' : ['Locate'       , 'locate']               ,
  \ 'h' : ['History'      , 'history']              ,
  \ 'o' : ['History:'     , 'command-history']      ,
  \ 's' : ['History/'     , 'search-history']       ,
  \ 'C' : ['Commits'      , 'commits']              ,
  \ 'c' : ['Commands'     , 'commands']             ,
  \ 'm' : ['Maps'         , 'keymaps']              ,
  \ 'H' : ['Helptags'     , 'help-tags']            ,
  \ 'i' : ['Filetypes'    , 'filetypes']            ,
\ }


let g:which_key_map.L = { 
  \ 'name' : '+lsp'  ,
  \  'r' : [':lua require"telescope.builtin".lsp_references{}'        , 'references']  ,
  \  'd' : [':lua require"telescope.builtin".lsp_document_symbols{}'  , 'document-symbols']  ,
  \  'w' : [':lua require"telescope.builtin".lsp_workspace_symbols{}' , 'workspace-symbols']  ,
  \  't' : [':lua require"telescope.builtin".treesitter{}'            , 'treesitter']  ,
  \  'u' : [':lua vim.lsp.buf.declaration()'                          , 'declaration']  ,
  \  'D' : [':lua vim.lsp.buf.definition()'                           , 'definition']  ,
  \  'h' : [':lua vim.lsp.buf.hover()'                                , 'hover']  ,
  \  'i' : [':lua vim.lsp.buf.implementation()'                       , 'implementation']  ,
  \  'g' : [':lua vim.lsp.buf.signature_help()'                       , 'signature-help']  ,
  \  'T' : [':lua vim.lsp.buf.type_definition()'                      , 'type-definition']  ,
  \  'p' : [':lua require"lsp_util".peek_definition()'                , 'references']  ,
  \  'b' : [':lua vim.lsp.buf.formatting()'                           , 'references']  ,
  \  'c' : [':lua vim.lsp.buf.code_action()'                          , 'references']  ,
  \  'P' : [':lua vim.lsp.buf.rename()'                               , 'references']  ,
  \  'o' : [':lua require"diagnostic.util".show_line_diagnostics()'   , 'references']  ,
  \  'n' : [':NextDiagnostic'                                          , 'references']  ,
  \  'm' : [':PrevDiagnostic'                                          , 'references']  ,
  \  'O' : [':OpenDiagnostic'                                          , 'references']  ,
\ }

""Lsp stuff

"Number Remaps
let g:which_key_map.0="generate-documentation"
nnoremap <silent> <leader>0 :DogeGenerate<CR>

let g:which_key_map.1="compile"
nnoremap <silent> <leader>1 :!compile.sh %<CR>

let g:which_key_map.2="toggle-spelling"
nnoremap <silent> <leader>2 :spell!<CR>

let g:which_key_map.3="undo-tree"
nnoremap <silent> <leader>3 :MundoToggle<CR>

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
nnoremap <silent> <leader>9 :OpenDiagnostic<CR>

"Key Remaps
let g:which_key_map.h="beg-of-line"
nnoremap <leader>h ^

let g:which_key_map.l="end-of-line"
nnoremap <leader>l $

let g:which_key_map.s="next-spell-err"
nnoremap <leader>s ]s

let g:which_key_map.S="prev-spell-err"
nnoremap <leader>S [s

nnoremap <silent> <leader>\ :nohlsearch<CR>

"Quick search mappings"
nnoremap <silent> <C-g> :lua require"telescope.builtin".live_grep{}<CR>
nnoremap <silent> <C-s> :lua require"telescope.builtin".find_files{}<CR>
nnoremap <silent> <C-Space> :lua require"telescope.builtin".find_files{}<CR>
nnoremap <silent> <C-q> :lua require"telescope.builtin".quickfix{}<CR>
nnoremap <silent> <C-l> :lua require"telescope.builtin".loclist{}<CR>

"Improved maps
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
nnoremap <C-S-o> <C-I>
nnoremap \ :vsplit<CR>
nnoremap - :split<CR>

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
set completeopt+=menuone
set clipboard=unnamed,unnamedplus "Set clipboard
set conceallevel=0 "Set conceal to 0 so we can see guide lines
set completeopt=menuone,noinsert,noselect
set cursorline

set foldenable foldlevelstart=10 foldnestmax=10 foldmethod=manual " setup folding

set gdefault "when substituting use g by default

set hidden "Allow vim to keep files open if not on screen
set hlsearch "Highlight searches"

set incsearch "Allow incremntal search
set ignorecase "ignore letter case
set inccommand=nosplit

set linebreak " Break lines at words
set lazyredraw "faster on large files
set lazyredraw " only redraw when necessary
set list
set listchars=tab:>~,trail:~,extends:>,precedes:<,nbsp:_

set matchpairs+=<:>
set modelines=1 "check the file line of the file for modeline

set number relativenumber "Set hybrid lines
set nospell " no spelling"
set nobackup nowritebackup noswapfile "If you save often then this stuff gets annoying

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
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab "Set tab stops to 2 spaces
set termguicolors
set updatetime=1
set ttimeout
set ttimeoutlen=0
set timeoutlen=500

set undodir=/tmp
set undofile

set viewoptions=folds,cursor

set wildmenu wildchar=<TAB> wildmode=list:longest,full
set wildignore+=*.a,*.o,*.pyc,*~,*.swp,*.tmp

"Plugin Configurations

"Ale
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier']    
\}

nnoremap <C-j> <Plug>(ale_previous_wrap)
nnoremap <C-k> <Plug>(ale_next_wrap)
nnoremap <leader>E <Plug>(ale_previous_wrap)<CR>
nnoremap <leader>e <Plug>(ale_next_wrap)<CR>
let g:ale_sign_error = ''
let g:ale_sign_warning = ''

"Buftabline
let g:buftabline_show=1
let g:buftabline_numbers=2

"Completion
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_chain_complete_list = {
    \ 'default': [
    \    {'complete_items': ['path', 'snippet', 'lsp', 'buffers', 'tabnine' ]},
    \    {'complete_items': ['path']},
    \    {'complete_items': ['snippet']},
    \    {'complete_items': ['lsp']},
    \    {'complete_items': ['tabnine']},
    \    {'complete_items': ['buffers']},
    \    {'mode': '<c-p>'},
    \    {'mode': '<c-n>'}
    \]
\}
let g:completion_trigger_on_delete = 1
let g:completion_auto_change_source = 1
"use <c-j> to switch to previous completion
imap <c-j> <Plug>(completion_next_source)
"use <c-k> to switch to next completion
imap <c-k> <Plug>(completion_prev_source)
let g:completion_enable_snippet = 'UltiSnips'

"Diagnostic
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_virtual_text_prefix = ''
let g:diagnostic_insert_delay = 1
call sign_define("LspDiagnosticsErrorSign", {"text" : "", "texthl" : "LspDiagnosticsError"})
call sign_define("LspDiagnosticsWarningSign", {"text" : "", "texthl" : "LspDiagnosticsWarning"})
call sign_define("LspDiagnosticsInformationSign", {"text" : "", "texthl" : "LspDiagnosticsInformation"})
call sign_define("LspDiagnosticsHintSign", {"text" : "", "texthl" : "LspDiagnosticsHint"})

"Doge"
let g:doge_enable_mappings=1
let g:doge_mapping='<leader>0'

"FZF
let g:fzf_preview_window = 'right:60%'

"Gitgutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 1
highlight SignColumn guibg=bg

"Indent line
let g:indentLine_setColors = 0
let g:indentLine_char = '┃'
let g:indenLine_setConceal=0

let g:termdebugger = 'arm-none-eabi-gdb'
tnoremap <Esc> <C-\><C-n>

"Markbar
let g:markbar_marks_to_display = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let g:markbar_num_lines_context = {
    \ 'around_local' : 2,
    \ 'around_file' : 0,
    \ 'peekaboo_around_local' : 2,
    \ 'peekaboo_around_file' : 0}

"Miniyank
let g:miniyank_maxitems = 100
function! s:fzf_miniyank(put_before, fullscreen) abort
    function! Sink(opt, line) abort
        let l:key = substitute(a:line, ' .*', '', '')
        if empty(a:line) | return | endif
        let l:yanks = miniyank#read()[l:key]
        call miniyank#drop(l:yanks, a:opt)
    endfunction

    let l:put_action = a:put_before ? 'P' : 'p'
    let l:name = a:put_before ? 'YanksBefore' : 'YanksAfter'
    let l:spec = {}
    let l:spec['source'] = map(miniyank#read(), {k,v -> k.' '.join(v[0], '\n')})
    let l:spec['sink'] = {val -> Sink(l:put_action, val)}
    let l:spec['options'] = '--no-sort --prompt="Yanks-'.l:put_action.'> "'
    call fzf#run(fzf#wrap(l:name, l:spec, a:fullscreen))
endfunction

command! -bang YanksBefore call s:fzf_miniyank(1, <bang>0)
command! -bang YanksAfter call s:fzf_miniyank(0, <bang>0)

"Mundo"
let g:mundo_right = 1

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
colorscheme gruvbox

"Auto commands
augroup AutoSaveFolds
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
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

augroup AUTOMARKS
  autocmd!
  autocmd BufLeave *.css,*.scss normal! mC
  autocmd BufLeave *.html       normal! mH
  autocmd BufLeave *.js,*.ts    normal! mJ
  autocmd BufLeave *.md         normal! mM
  autocmd BufLeave *.yml,*.yaml normal! mY
  autocmd BufLeave *.vue        normal! mV
  autocmd BufLeave .env*        normal! mE
augroup END

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
