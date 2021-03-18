source ~/.config/nvim/vim-plug.vim
source ~/.config/nvim/settings.vim
source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/suda.vim
source ~/.config/nvim/plugins/coc.vim

" the prefix to use for leader commands
let g:mapleader="<space>"

vmap <C-M-f>  <Plug>(coc-format-selected)
nmap <C-M-f>  <Plug>(coc-format-selected)
nnoremap <C-f> :NERDTreeToggle<cr>
nnoremap <C-p> :FZF<cr>
noremap <C-M-p> :Buffers<cr>
nnoremap <LEADER><LEADER>f :ComradeFix

" Colour stuff
if (has("termguicolors"))
  set termguicolors
endif
colorscheme material
let g:material_terminal_italics=1
