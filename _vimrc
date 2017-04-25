let mapleader="\<Space>"
"enable pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"git status on statusline
set statusline=%t
set statusline+=%m
set statusline+=\ %{fugitive#statusline()}

"ack searching
nmap <leader>a <Esc>:Ack!

"python stuff
"be inside a method and type 'za' to open and close a fold.
"set foldmethod=indent
"set foldlevel=99

"task list: hit <leader>td to open the task list.. q to close
"also: hit enter on the task to jmp to the buffer
map <leader>td <Plug>TaskList

"everything else
syntax on
cd ~
set hls!
set ts=4
set background=dark
"colorscheme ir_black
colorscheme desert
map <C-j> <C-W>j<C-W>_
map <C-h> <C-W>h<C-W>_
map <C-k> <C-W>k<C-W>_
map <C-l> <C-W>l<C-W>_
set gfn=Consolas:h10:cANSI
"set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=m  "remove menu
"set guioptions-=r  "remove right-hand scroll bar
set mouse=a	"automatically enable mouse usage
set autochdir 			"always switch to the current file directory
set cursorline
hi cursorline guibg=#000000
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) "a ruler on steroids
"set nowrap
set wrap
"faster transition to ex command mode
nnoremap ; :
"wrapped lines goes down/up to next row, rather
nnoremap j gj
nnoremap k gk
"Yank from the cursor to the end of the line, to be consistent with C and D
nnoremap Y y$
"au VimEnter *  NERDTree
map <F2>  :echo 'Current time = ' . strftime('%c')<CR>
"hotkey to reload my .vimrc
map <C-F1> :source ~/_vimrc <CR>
"hotkey to edit my .vimrc
map <C-S-F1> :vsplit ~/_vimrc <CR>
map <C-t> :NERDTreeToggle <CR>
"set relativenumber
set nu
filetype plugin on
filetype indent on
set smartindent
set shiftwidth=4
nnoremap <C-s> <esc>:w<CR>


map <C-p> "+gP
map <C-c> "+y
"easier inter-tabular navigation!
map <a-l> :tabn<CR>
map <a-h> :tabp<CR>
map <a-n> :tabnew<CR>
map <a-t> :tabnew<CR>
nnoremap ,on :NERDTree ~/Desktop<CR>
map <a-f> :FufFile<CR>
"make it easier to exit insert mode:
:inoremap jk <esc>
"improve the statusline appearance for each window:
hi StatusLine guibg=White
hi StatusLineNC guifg=Black
set winminheight=0 "don't show code from collapsed windows
"keep vim from equalizing the windows when one closes
set noequalalways
"Grep
nnoremap <silent> <F3> :Grep<CR> 
nnoremap <silent> <C-F3> :Regrep<CR> 

"from http://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim
set ignorecase "case-insensitive searching
set scrolloff=5 "keep the cursor towards the middle of the screen when scrolling
set bs=indent,eol,start "Allow backspacing over everything in insert mode
set viminfo='20,\"500   "remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'
"set hidden "remember undo after quitting
set history=50 "keep 50 lines of command history
set lazyredraw "no redraws in macros
"macros for a custom job... WeedCards
let @i=':%s/: /","/g'
let @j='gg0GI,new WeedDescriptor("jkr G$A")jk@iggO€ü€kb{"weedname", new List<WeedDescriptor>{Go}}kVGggj>'

""enable omnicomplete
"set omnifunc=syntaxcomplete#Complete
""enable IDE-like interactive search for omnicomplete
"set completeopt=longest,menuone
""change the behavior of the <Enter> key when the popup menu is visible. In that case the Enter key will simply select the highlighted menu item, just as <C-Y> does
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:NERDTreeChDirMode=2 "makes vim follow NERDTree's current directory (ie. changing directories in NERDTree will chance what directory you see when you type :pwd)

"quick command prompt
map <a-c> :!start cmd<CR>
map <a-e> :!start explorer .<CR>

" CtrpP
"set runtimepath^=~/.vim/bundle/ctrlp.vim
"
"





"below: my attempts at starting a 'HtmlTagLineToAttributePerLine' plugin
"example: 
"	input:  <button class="btn btn-default" ng-click="open()" ng-disabled="loading">
"	output: <button
"			class="btn btn-default"
" 			ng-click="open()"
" 			ng-disabled="loading">
"
"function! Hello()
"	echom "Hello, world!"
"endfunction
"
"function! s:get_visual_selection()
"  " Why is this not a built-in Vim script function?!
"  let [lnum1, col1] = getpos("'<")[1:2]
"  let [lnum2, col2] = getpos("'>")[1:2]
"  let lines = getline(lnum1, lnum2)
"  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
"  let lines[0] = lines[0][col1 - 1:]
"  return join(lines, "\n")
"endfunction
"
"function! Get_visual_selection()
"  " Why is this not a built-in Vim script function?!
"  let [lnum1, col1] = getpos("'<")[1:2]
"  let [lnum2, col2] = getpos("'>")[1:2]
"  let lines = getline(lnum1, lnum2)
"  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
"  let lines[0] = lines[0][col1 - 1:]
"  return join(lines, "\n")
"endfunction
"
"function! TestRegex()
"	let text = '<button class="btn btn-default" ng-click="open()" ng-disabled="loading">'
"	let matches = matchstr(text, '[^= ]+(="[^"]+")?')
"	if matches == ''
"		return 'no matches'
"	endif
"	return matches
"endfunction
"
"


"snippets
map <C-S-F2> :vsplit ~/vimfiles/snippets <CR>
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['javascript'] = 'javascript,angularjs'
"
" This function will update snippets list for current and empty filetype:
function! SnippetsUpdate(snip_dir)
  call ResetSnippets()
  call GetSnippets(a:snip_dir, '_')
  call GetSnippets(a:snip_dir, &ft)
endfunction

map <C-F2> :call SnippetsUpdate('~/vimfiles/snippets') <CR>


" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

"recognize .es6 files as .js
autocmd BufRead,BufNewFile *.es6 set filetype=javascript

"easier jump-to-mark (that tilde is hard to hit without looking)
map <S-M> `

" ex command for toggling hex mode - define mapping if desired
command! -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function! ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    silent :e " this will reload the file without trickeries 
              "(DOS line endings will be shown entirely )
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

" The simple script shown here copies only the text that matches search hits.
" It works with multiline matches. First save the buffer because the script changes it
" (the changes should result in the same text, but it is safer to save first).
" After sourcing the following, search for a pattern, then enter :CopyMatches to copy
" all matches to the clipboard, or :CopyMatches x where x is any register to hold the result.
function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/ge
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

" Macro to turn brace-surrounded, single-expression methods into body-less
" methods in C#:
let @r = '0vobma%dd`addkA =>jkj0frdw'
map ,rm 0vobma%dd`addkA =>j0frdw
" Macro to turn brace-surrounded, non-returning, single-line methods into body-less
" methods in C#:
map ,vm 0vobma%dd`addkA =>

"The default leader has been changed to <Leader><Leader> to avoid conflicts with other plugins you may have installed.
"This can easily be changed back to pre-1.3 behavior by rebinding the leader in your vimrc:
"map <Leader> <Plug>(easymotion-prefix)
"
