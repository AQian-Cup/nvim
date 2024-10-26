return {
  {
    'nanozuki/tabby.nvim',
    config = function()
      vim.o.showtabline = 2
      local theme = {
        fill = { fg = '#7c6f64', bg = '#f2e5bc' },                        -- 柔和的背景色
        head = { fg = '#3c3836', bg = '#e0cfa9' },                        -- 稍深的标题背景
        current_tab = { fg = '#282828', bg = '#d8a657', style = 'bold' }, -- 当前标签使用醒目的橙色
        tab = { fg = '#504945', bg = '#ebdbb2' },                         -- 非当前标签使用柔和的米色
        win = { fg = '#504945', bg = '#ebdbb2' },                         -- 窗口标签与普通标签相同
        tail = { fg = '#3c3836', bg = '#e0cfa9' },                        -- 与头部相同
      }
      require('tabby.tabline').set(function(line)
        return {
          {
            { '  ', hl = theme.head },
            line.sep('', theme.head, theme.fill),
          },
          line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            return {
              line.sep('', hl, theme.fill),
              tab.is_current() and '' or '',
              tab.number(),
              tab.name(),
              -- tab.close_btn(''), -- show a close button
              line.sep('', hl, theme.fill),
              hl = hl,
              margin = ' ',
            }
          end),
          line.spacer(),
          {
            line.sep('', theme.tail, theme.fill),
            { '  ', hl = theme.tail },
          },
          hl = theme.fill,
        }
      end)
    end,
  }
}
