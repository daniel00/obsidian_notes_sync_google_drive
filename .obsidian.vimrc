nmap ; :
imap jk <Esc>
imap <C-o> <BS>

" imap <C-H> <left>
" imap <C-L> <right>


" unmap <C-p>
" exmap switcher obcommand switcher:open
" nmap <C-p> switcher<CR>

" nmap go ^
" nmap gk $
nmap H ^
nmap L $

nmap j gj
nmap k gk

" Emulate Folding https://vimhelp.org/fold.txt.html#fold-commands
exmap togglefold obcommand editor:toggle-fold
nmap zo :togglefold
nmap zc :togglefold
nmap za :togglefold

exmap unfoldall obcommand editor:unfold-all
nmap zR :unfoldall

exmap foldall obcommand editor:fold-all
nmap zM :foldall

exmap toggleLeftSidebar obcommand app:toggle-left-sidebar
nmap <C-b> :toggleLeftSidebar<cr>

exmap moveNextTab obcommand workspace:next-tab
nmap <C-l> :moveNextTab<cr>

exmap movePreviousTab obcommand workspace:previous-tab
nmap <C-h> :movePreviousTab<cr>

" exmap tabnext obcommand workspace:next-tab
" nmap gt :tabnext<cr>
" nmap <C-L> :tabnext

" unmap <C-H>
" exmap tabprev obcommand workspace:previous-tab
" nmap gT :tabprev<cr>
" nmap <C-H> :tabprev<CR>

" exmap toggleLeftSidebar obcommand editor:

" Emulate Tab Switching https://vimhelp.org/tabpage.txt.html#gt
" requires Cycle Through Panes Plugins https://obsidian.md/plugins?id=cycle-through-panes
" exmap tabnext obcommand cycle-through-panes:cycle-through-panes
" nmap gt :tabnext
" nmap <c-l> :tabnext

" exmap tabprev obcommand cycle-through-panes:cycle-through-panes-reverse
" nmap gT :tabprev
" nmap <c-h> :tabprev


exmap checkmark obcommand editor:cycle-list-checklist
nmap m :checkmark


" Have j and k navigate visual lines rather than logical ones
" nmap j gj
" nmap k gk

" I like using H and L for beginning/end of line
" nmap H ^
" nmap L $

" Quickly remove search highlights
nmap <F9> :nohl

" Yank to system clipboard
set clipboard=unnamed

" Go back and forward with Ctrl+O and Ctrl+I
" (make sure to remove default Obsidian shortcuts for these to work)
exmap back obcommand app:go-back
nmap <C-o> :back
exmap forward obcommand app:go-forward
nmap <C-i> :forward


exmap q obcommand workspace:close

exmap co obcommand workspace:close-others
nmap <C-w>o :co<cr>

exmap closeOthersTab obcommand workspace:close-others
nmap co :closeOthersTab<cr>

exmap vs obcommand workspace:split-vertical
exmap sp obcommand workspace:split-horizontal

exmap focusRight obcommand editor:focus-right
nmap <C-w>l :focusRight
nmap gl :focusRight

exmap focusLeft obcommand editor:focus-left
nmap <C-w>h :focusLeft
nmap gh :focusLeft

exmap focusTop obcommand editor:focus-top
nmap <C-w>k :focusTop

exmap focusBottom obcommand editor:focus-bottom
nmap <C-w>j :focusBottom

exmap splitVertical obcommand workspace:split-vertical
nmap <C-w>v :splitVertical

exmap splitHorizontal obcommand workspace:split-horizontal
nmap <C-w>s :splitHorizontal

exmap globalSearch obcommand global-search:open
nmap gf :globalSea

