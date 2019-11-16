" General

syntax enable
set nocompatible

set history=500

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
call vundle#end()            " required

filetype plugin on
filetype indent on

set number
set relativenumber

set backspace=indent,eol,start

set ruler

