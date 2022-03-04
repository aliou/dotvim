local null_ls = require('null-ls')

local get_previous_selection_position = function()
  local _, start_row, _, _ = unpack(vim.fn.getpos("'<"))
  local _, end_row, _, _ = unpack(vim.fn.getpos("'>"))

  if start_row > end_row then
    local tmp = end_row
    end_row = start_row
    start_row = tmp
  end

  return { start_row, end_row }
end

-- TODO:
--   * Store string in constant
--   * Have it configurable based on rubocop configuration?
--   * Check emptyness of the first line.
local frozen_string_actions = {
  method = null_ls.methods.CODE_ACTION,
  filetypes = { "ruby" },
  generator = {
    fn = function(context)
      -- TODO: Store in constant
      local frozen_string_literal_comment = "# frozen_string_literal: true"

      local first_line = context.content[1]

      if first_line ~= frozen_string_literal_comment then
        return {
          {
            title = "Add frozen string literal comment",
            action = function()
              local lines = { frozen_string_literal_comment, "", first_line }
              vim.api.nvim_buf_set_lines(context.bufnr, 0, 1, false, lines)
            end
          }
        }
      end
    end
  }
}

-- Insert binding.pry at the current line.
-- TODO: Refactor so it works for multiple languages (e.g. `binding.pry` for ruby, `debugger` for javascript).
local binding_pry = {
  method = null_ls.methods.CODE_ACTION,
  filetypes = { "ruby" },
  generator = {
    fn = function(context)
      local current_line = context.content[context.row]

      if #context.content == 1 and context.content[1] == "" then
        return nil
      end

      -- Skip if the line contains a debugger statement.
      if vim.regex('binding.pry'):match_str(current_line) then
        return nil
      end

      -- Skip if we only have one line
      -- if context.lines[

      return {
        {
          title = "Insert `binding.pry`",
          action = function()
            local lines = { "binding.pry", current_line }
            vim.api.nvim_buf_set_lines(context.bufnr, context.row - 1, context.row, false, lines)
            vim.api.nvim_feedkeys('==', 'n', true)
          end
        }
      }
    end
  }
}

-- Wrap visual selection in begin .. rescue .. end block.
local begin_rescue_block = {
  method = null_ls.methods.CODE_ACTION,
  filetypes = { "ruby" },
  generator = {
    fn = function(context)
      local mode = vim.fn.mode()

      P({ mode })

      if mode ~= 'V' and mode ~= 'v' then
        return nil
      end

      -- Get visual selection
      local lines = vim.api.nvim_buf_get_lines(context.bufnr, context.range.row - 1, context.range.end_row, true)

      for i = 1, #lines do
        lines[i] = string.format("  %s", lines[i])
      end

      -- Add two indent chars to each lines
      -- Add begin at first, rescue StandardError => e + '' + end at the end.
      -- Insert lines.
      -- Move cursor to rescue block.
      return {
        {
          title = "Wrap in begin .. rescue block",
          action = function()
            -- Leave visual mode.
            -- print("leaving mode")
            -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), 'n', true)
            -- Get visual selection using getpos and nvim_buf_get_lines
            -- print("retriving position")
            -- local start_pos, end_pos = unpack(get_previous_selection_position())
            -- local position = get_previous_selection_position()
            -- local start_pos = position[1]
            -- local end_pos = position[2]
            -- print("retrieving lines")
            -- P({ start_pos, end_pos })
            -- local lines = vim.api.nvim_buf_get_lines(context.bufnr, start_pos - 1, end_pos, true)
            -- P({ lines })
          end
        }
      }
    end
  }
}

null_ls.register(begin_rescue_block)
null_ls.register(binding_pry)
null_ls.register(frozen_string_actions)

-- return {
--   frozen_string_actions = frozen_string_actions,
--   binding_pry = binding_pry,
--   begin_rescue_block = begin_rescue_block,
-- }
