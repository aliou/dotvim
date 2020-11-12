function! cstm#lsp#setup_maps() abort
  nnoremap <buffer> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <buffer> K     <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <buffer> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
  nnoremap <buffer> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
  nnoremap <buffer> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
  nnoremap <buffer> gr    <cmd>lua vim.lsp.buf.references()<CR>
  nnoremap <buffer> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
  nnoremap <buffer> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
  nnoremap <buffer> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
endfunction
