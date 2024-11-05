-- You can add your own plugins here or in other files in this directory!
-- To install/update plugins, go exec :Lazy update. See the kickstart.nvim README for more information
-- uncomment: { import = 'custom.plugins' }, to apply changes from this file
--
-- opts --> to set up when and how a plugin is loaded.
-- empty opts, is to load default (when neovim starts). We can add lua code in this to change behaviour

-- AutoCompletion: to install others, go to :e $MYVIMRC to the mapping (search for :help ins-completion) and add it to the sources = {} object
-- Keybindings
return {
  -- include just plugin configurations
  -- Highlight todo, notes, etc in comments
  --{
  --  'folke/todo-comments.nvim',
  --  dependencies = { 'nvim-lua/plenary.nvim' },
  --  opts = { signs = false },
  --},
}

-- we can do keymaps or abbreviations (check help on :help abbr)
