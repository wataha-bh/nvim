" autocmd! BufWritePost * <cmd>:Isort<cr>
autocmd BufWritePost *.py execute ":Isort"
