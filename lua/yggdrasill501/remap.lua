vim.g.mapleader = " "
vim.keymap.set("n","<leader>pv", vim.cmd.Ex)

vim.keymap.set('t', ',<C-n>', function()
  vim.cmd([[<C-\><C-n>]]) 
  vim.cmd('normal <leader>tr') 
end, {noremap = true})

vim.keymap.set('t', ',<C-n>', function()
  vim.cmd([[<C-\><C-n>:Ex<CR>]]) 

end, {noremap = true})
