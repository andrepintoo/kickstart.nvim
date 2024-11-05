-- "require 'custom/keymaps'" place this into .config/nvim/init.lua

-- Helpers:
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local function get_comment_chars()
  local filetype = vim.bo.filetype
  local comment_chars = {
    lua = '--',
    python = '#',
    html = '<!-- -->',
    -- Add other languages here
  }
  return comment_chars[filetype] or '//' -- Default to `//` if not defined
end

-- :map <keystroke:> to see existing maps
-- Normal mode

-- Comment/Uncomment bindings
vim.keymap.set('n', '<C-\\>', function()
  local comment_char = get_comment_chars()
  local line = vim.api.nvim_get_current_line()
  if line == nil then
    return
  end
  if string.sub(line, 1, #comment_char) == comment_char then
    -- Uncomment by removing the comment character
    vim.api.nvim_set_current_line(string.sub(line, #comment_char + 2))
  else
    -- Comment by prepending the comment character and a space
    vim.api.nvim_set_current_line(comment_char .. ' ' .. line)
  end
end, { noremap = true, silent = true })

-- Insert mode

-- Visual mode
vim.keymap.set('v', '<C-\\>', function()
  local comment_char = get_comment_chars()
  local start_line = vim.fn.line 'v'
  local end_line = vim.fn.line '.'

  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end

  for i = start_line, end_line do
    local line = vim.fn.getline(i)
    if string.sub(line, 1, #comment_char) == comment_char then
      -- Uncomment by removing the comment character
      vim.fn.setline(i, string.sub(line, #comment_char + 2))
    else
      -- Comment by prepending the comment character and a space
      vim.fn.setline(i, comment_char .. ' ' .. line)
    end
  end
end, { noremap = true, silent = true })
