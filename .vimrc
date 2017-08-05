"------------------------------------------------------------------
"---------------------------- Pathogen ----------------------------
"https://github.com/tpope/vim-pathogen.git
"http://mirnazim.org/writings/vim-plugins-i-use/
execute pathogen#infect()
:set rnu									"ruler
:syntax on									"turns on syntax
:set expandtab							" use spaces instead of tabs
filetype plugin indent on
"colorscheme codeschool	
:set tabstop=3								"sets tab to be 4 spaces
:set nowrap									"do not visually wrap long lines
":set showmatch								"show matching parenthesis
:set smartcase								"search case-insensitive if everything is lower case
:set hlsearch								"highlight search terms
:set incsearch								"highlight search terms as you type
:set title									"set the terminal title
:set nobackup								"do not create backup files
:set ai										"auto indent
:set si										"smart indent


"----------------------------------------------------------------------------------
"---------------------------- Format json with node.js ----------------------------
nmap fj :<C-U>call FormatJSON(v:count)<CR>

function FormatJSON(...)
  let code="\"
        \ var i = process.stdin, d = '';
        \ i.resume();
        \ i.setEncoding('utf8');
        \ i.on('data', function(data) { d += data; });
        \ i.on('end', function() {
        \     console.log(JSON.stringify(JSON.parse(d), null,
        \ " . (a:0 ? a:1 ? a:1 : 2 : 2) . "));
        \ });\""
  execute "%! node -e " . code
endfunction


"----------------------------------------------------------------
"--------------------------- HTML File Indent ---------------------------
:filetype indent on
:set filetype=html

"----------------------------------------------------------------
"--------------------------- CloseTag ---------------------------
"https://github.com/docunext/closetag.vim.git
"  Integlligently close HTML tags

let g:closetag_html_style=1
source /Users/rachelrybarczyk/.vim/bundle/closetag/plugin/closetag.vim

"------------------------------------------------------------------
"---------------------------- NERDCommenter ----------------------------
"https://github.com/docunext/closetag.vim.git 

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"--------------------------------------------------------------------------------
"---------------------------- Solarized Color Scheme ----------------------------
"https://github.com/altercation/vim-colors-solarized.git
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

"---------------------------------------------------------------------------
"---------------------------- NERDTree Side Bar ----------------------------
"https://github.com/scrooloose/nerdtree.git
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" open and close NERDTree with ctrl-o
map <C-o> :NERDTreeToggle<CR>
" close vim with q if only NERDTree is left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('ts', 'Magenta', 'none', '#ff00ff', '#151515')

 "put cursor on file upon startup
 autocmd VimEnter * wincmd p
 " mapping for moving files
 nnoremap gT :bprev<CR>
 nnoremap gt :bnext<CR>
 " mapping for managing tabs
 map <leader>tn :tabnew<cr>
 map <leader>to :tabnew<cr>
 map <leader>tc :tabclose<cr>
 map <leader>tm :tabmove<cr>
 " Close file
 nnoremap <leader>q :bp<cr>:bd #<cr>
 " Toggles NERDTree side bar
 map <C-o> :NERDTreeToggle<CR>
 " Disables bookmarks and 'Press ? for help' text
 let NERDTreeMinimalUI = 1
 " Displays line numbers
 let NERDTreeShowLineNumbers = 1
 " Show hidden files
 let NERDTreeShowHidden = 1
 " Change current working dir based on file location
 let NERDTreeChDirMode = 2
 " Use natural sort order
 let NERDTreeNaturalSort = 1
 let g:NERDTreeWinSize = 35 

"---------------------------------------------------------------------------
"---------------------------- NERDTree Side Bar ----------------------------
" https://github.com/jason0x43/vim-js-indent.git
"let to 1 to make `case` statements align with their containing `switch`
let js_indent_flat_switch = 0
" Set to 0 to disable use of the JavaScript indenter for TypeScript buffers 
let js_indent_typescript = 1 
 
"---------------------------------------------------------------------------
"---------------------------- Typescript VIM (leafgarland) ----------------------------
" https://github.com/leafgarland/typescript-vim.git
"disable this plugins indenter
let g:typescript_indent_disable = 1
" TypeScript
au BufRead,BufNewFile *.ts   setfiletype typescript



