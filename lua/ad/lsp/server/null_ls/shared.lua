-- require('pl.stringx')

local null_ls = require('null-ls')
local u = require('ad.lsp.server.null_ls.util')

local debugger_statements = {
  ruby = "binding.pry",
  javascript = "debugger",
  typescript = "debugger",
}

local binding_pry = {
  method = null_ls.methods.CODE_ACTION,
  -- NOTE: Probably overkill to deduce the filetype list from the list above.
  filetypes = { "javascript", "typescript", "ruby" },
  generator = {
    fn = function(context)
      local current_line = context.content[context.row]
      -- TODO: Split filetypes on `.`
      -- local filetypes = pl.stringx.split(context.ft, '.')
      -- P(filetypes)
      local statement = debugger_statements[context.ft]

      if statement == nil then
        vim.notify(
          string.format("missing debugger statement for ft=%s", context.ft),
          vim.log.levels.WARN,
          { prefix = "ad.lsp.null_ls" }
        )
        return nil
      end

      local indent = vim.fn.indent(context.row)
      local lines = { u.indent_str(statement, indent), current_line }

      return {
        {
          title = string.format("Insert `%s`", statement),
          action = function()
            vim.api.nvim_buf_set_lines(
              context.bufnr, context.row - 1, context.row, false, lines
            )
          end
        }
      }
    end
  }
}


null_ls.register(binding_pry)
