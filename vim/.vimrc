let mapleader=","

function! Count()
    execute '%s/^- \[//n'
endfunction

nnoremap <leader>c :call Count()<cr>