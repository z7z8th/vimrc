if has("cscope")
    let g:cs_base_dir="/optz/cscope"
    let g:deb_kernel_dir="linux-source-3.2"
    cnoremap  csl     cs add <C-R>=g:cs_base_dir<CR>/<C-R>=g:deb_kernel_dir<CR><CR>
endif
