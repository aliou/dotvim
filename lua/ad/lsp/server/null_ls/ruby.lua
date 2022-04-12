local null_ls = require('null-ls')
local u = require('ad.lsp.server.null_ls.util')

local COMMENT = "# frozen_string_literal: true"
local frozen_string_actions = {
  method = null_ls.methods.CODE_ACTION,
  filetypes = { "ruby" },
  generator = {
    fn = function(context)

      local first_line = context.content[1]

      if first_line ~= COMMENT then
        local lines = { COMMENT }
        -- On non empty files, re-add the previous first line.
        if first_line ~= "" or #context.content > 1 then
          table.insert(lines, "")
          if first_line ~= "" then
            table.insert(lines, first_line)
          end
        end

        return {
          {
            title = "Add frozen string literal comment",
            action = function()
              vim.api.nvim_buf_set_lines(context.bufnr, 0, 1, false, lines)
            end
          }
        }
      end
    end
  }
}

-- Wrap visual selection in begin .. rescue .. end block.
local begin_rescue_block = {
  method = null_ls.methods.CODE_ACTION,
  filetypes = { "ruby" },
  generator = {
    fn = function(context)
      -- Skip if we're not in visual mode.
        if context.range.row == context.range.end_row
          and context.range.col == context.range.end_col then
          return nil
        end

      -- Get visual selection
      local lines = vim.api.nvim_buf_get_lines(
        context.bufnr, context.range.row - 1, context.range.end_row, true
      )

      local line_count = #lines
      for i = 1, line_count do
        lines[i] = u.indent_str(lines[i], 2)
      end

      local indent = vim.fn.indent(context.range.row)

      table.insert(lines, 1, u.indent_str("begin", indent))
      table.insert(lines, u.indent_str("rescue StandardError => e", indent))
      table.insert(lines, u.indent_str("  ", indent))
      table.insert(lines, u.indent_str("end", indent))

      return {
        {
          title = "Wrap in begin .. rescue block",
          action = function()
            vim.api.nvim_buf_set_lines(
              context.bufnr, context.range.row - 1, context.range.end_row, false, lines
            )
            -- TODO: Clean this.
            -- (move down the number of lines + 2, start insert mode at the end of the line).
            vim.api.nvim_feedkeys(string.format("%djA", line_count + 2), 'n', true)
          end
        }
      }
    end
  }
}

null_ls.register(begin_rescue_block)
null_ls.register(frozen_string_actions)
