return {
  {
    'echasnovski/mini.icons',
    version = false,
    lazy = false,
    config = function()
      local MiniIcons = require('mini.icons')
      MiniIcons.setup()
      MiniIcons.mock_nvim_web_devicons()
    end,
  },
}
