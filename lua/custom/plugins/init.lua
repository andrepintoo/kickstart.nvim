-- You can add your own plugins here or in other files in this directory!
-- To install/update plugins, go exec :Lazy update. See the kickstart.nvim README for more information
--
-- opts --> to set up when and how a plugin is loaded.
-- empty opts, is to load default (when neovim starts). We can add lua code in this to change behaviour

-- Keybindings
vim.api.nvim_set('n', '<C-k-c>', function()
  local line = vim.api.nvim_get_current_line()
  vim.api.nvim_set_current_line('-- ' .. line)
end, { noremap = true, silent = true })

vim.api.nvim_set('n', '<C-k-u>', function()
  local line = vim.api.nvim_get_current_line()
  vim.api.nvim_set_current_line(string.gsub(line, '^%-%-', ''))
end, { noremap = true, silent = true })

return {
  -- Highlight todo, notes, etc in comments
  --{
  --  'folke/todo-comments.nvim',
  --  dependencies = { 'nvim-lua/plenary.nvim' },
  --  opts = { signs = false },
  --},
}
