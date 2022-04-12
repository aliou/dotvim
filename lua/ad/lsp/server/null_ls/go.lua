local null_ls = require('null-ls')
local u = require('ad.lsp.server.null_ls.util')

local PRINT_STR = 'fmt.Printf("%s\\n", %s)'

-- NOTE: For some reason, gopls has the following error when the code action runs:
-- "gopls: -32700: JSON RPC parse error: json: cannot unmarshal object into Go struct field ExecuteCommandParams.arguments of type []json.RawMessage: JSON RPC parse error"
local print_var = {
  method = null_ls.methods.CODE_ACTION,
  filetypes = { "go" },
  generator = {
    fn = function(context)
      local current_line = context.content[context.row]
      local current_word = vim.fn.expand("<cword>")

      local print_statement = string.format(PRINT_STR, "%+v", current_word)

      local indent = vim.fn.indent(context.row)
      local lines = { u.indent_str(print_statement, indent), current_line }

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
    end,
  }
}

null_ls.register(print_var)
