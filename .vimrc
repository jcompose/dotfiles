" cSpell:disable

" ,------. ,--.               ,--.                
" |  .--. '|  |,--.,--. ,---. `--',--,--,  ,---.  
" |  '--' ||  ||  ||  || .-. |,--.|      \(  .-'  
" |  | --' |  |'  ''  '' '-' '|  ||  ||  |.-'  `) 
" `--'     `--' `----' .`-  / `--'`--''--'`----'  
"                      `---'                      

call plug#begin()
Plug 'sainnhe/gruvbox-material'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'img-paste-devs/img-paste.vim'
call plug#end()

"  ,---.   ,--.           ,--.        
" '   .-',-'  '-.,--. ,--.|  | ,---.  
" `.  `-.'-.  .-' \  '  / |  || .-. : 
" .-'    | |  |    \   '  |  |\   --. 
" `-----'  `--'  .-'  /   `--' `----' 
"                `---'

" This makes lightline only show up in 1 window
set laststatus=2

" This sets the color scheme for lightline and makes it so Coc statuses appear
let g:lightline = {
	\ 'colorscheme': 'gruvbox',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'cocstatus': 'coc#status'
	\ },
	\ }

" This allows bold and italicized fonts to show up while using Gruvbox theme
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1

colorscheme gruvbox-material
syntax on

set tabstop=4				" Tab = 4 spaces
set shiftwidth=4			" Indentation level = 4 spaces
set number relativenumber	" Line numbers + relative distances
set cursorline				" Highlight current line
set cmdheight=2				" Give more space for displaying messages

" Highlight Bold and Italic text in markdown
highlight markdownBold cterm=Bold ctermfg=167
highlight markdownItalic cterm=Italic ctermfg=109

" This makes it so LaTeX concealed text is a good color
hi Conceal ctermfg=214 guifg=214

" ,------.                        ,--.  ,--.                       
" |  .---',--.,--.,--,--,  ,---.,-'  '-.`--' ,---. ,--,--,  ,---.  
" |  `--, |  ||  ||      \| .--''-.  .-',--.| .-. ||      \(  .-'  
" |  |`   '  ''  '|  ||  |\ `--.  |  |  |  |' '-' '|  ||  |.-'  `) 
" `--'     `----' `--''--' `---'  `--'  `--' `---' `--''--'`----'  

" Set mapleader
let g:mapleader = ","
let g:maplocalleader = ","

" This is so I can press <F9> to run python files
autocmd FileType python nnoremap <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

"                  ,--.     ,---.            ,--.                    
"     ,--,--,--. ,-|  |    |  o ,-.        ,-'  '-. ,---. ,--.  ,--. 
"     |        |' .-. |    .'     /_       '-.  .-'| .-. : \  `'  /  
" .--.|  |  |  |\ `-' |    |  o  .__)    .--.|  |  \   --. /  /.  \  
" '--'`--`--`--' `---'      `---'        '--'`--'   `----''--'  '--' 

" Make it so j and k move down 1 visual line instead of 1 literal line
autocmd FileType markdown nnoremap j gj
autocmd FileType markdown nnoremap k gk

" Make it so Markdown files don't show bold or italicized markings
autocmd FileType markdown setlocal conceallevel=1

" Allows me to paste images into Vim
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>

" Sets the PDF viewer for Vimtex
let g:vimtex_view_method = 'skim'

"  ,-----.                                     ,--.           
" '  .--./ ,---.  ,---.,-----.,--,--,,--.  ,--.`--',--,--,--. 
" |  |    | .-. || .--''-----'|      \\  `'  / ,--.|        | 
" '  '--'\' '-' '\ `--.       |  ||  | \    /  |  ||  |  |  | 
"  `-----' `---'  `---'       `--''--'  `--'   `--'`--`--`--' 

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

vmap <tab> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<tab>'

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying code actions to the selected code block.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Apply the most preferred quickfix action to fix diagnostic on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for apply refactor code actions.
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Make lightline automatically update when Coc changes
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"  ,-----.   ,--.  ,--.                    
" '  .-.  ',-'  '-.|  ,---.  ,---. ,--.--. 
" |  | |  |'-.  .-'|  .-.  || .-. :|  .--' 
" '  '-'  '  |  |  |  | |  |\   --.|  |    
"  `-----'   `--'  `--' `--' `----'`--'    

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | wincmd p | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" These are the colors corresponding to Gruvbox-material color scheme
"\ 'fg0':              ['#d4be98',   '223'],
"\ 'fg1':              ['#ddc7a1',   '223'],
"\ 'red':              ['#ea6962',   '167'],
"\ 'orange':           ['#e78a4e',   '208'],
"\ 'yellow':           ['#d8a657',   '214'],
"\ 'green':            ['#a9b665',   '142'],
"\ 'aqua':             ['#89b482',   '108'],
"\ 'blue':             ['#7daea3',   '109'],
"\ 'purple':           ['#d3869b',   '175'],
"\ 'bg_red':           ['#ea6962',   '167'],
"\ 'bg_green':         ['#a9b665',   '142'],
"\ 'bg_yellow':        ['#d8a657',   '214']
