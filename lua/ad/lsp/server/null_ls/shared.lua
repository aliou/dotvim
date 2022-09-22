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

local PRINT_STR = 'console.log("DEBUG", { %s });'
local print_var = {
  method = null_ls.methods.CODE_ACTION,
  filetypes = { "javascript", "typescript" },
  generator = {
    fn = function(context)
      local current_line = context.content[context.row]
      local current_word = vim.fn.expand("<cword>")

      local print_statement = string.format(PRINT_STR, current_word)

      local indent = vim.fn.indent(context.row)
      local lines = { current_line, u.indent_str(print_statement, indent) }

      return {
        {
          title = "Insert print statement for variable",
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
null_ls.register(print_var)
