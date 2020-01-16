" gcman105's .vimrc file
" Author: Gary C = gcman105 <gary@gcman105.com>
" https://gcman105.com/
"
" vim: foldmethod=marker
"
" The line below allows me to update the Gist with the command :Gist
" GistID: 5821422

"-----------------------------------------------------------------------------
" Global stuff {{{1
"-----------------------------------------------------------------------------
"Below is the line that can cause a No Mapping error on startup if I'm also
"using the Snipmate plugin.  It seems to be okay if I use it at the top.
set cpoptions=ces$

"Forget compatibility with Vi.
set nocompatible
filetype off 			" required

source $VIMRUNTIME/defaults.vim

syntax on
set background=dark
colorscheme solarized8
"colorscheme onedark
