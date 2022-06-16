local null_ls = require('null-ls')
local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local u = require('cstm.util')

-- Override the existing handler:
--   * Override binary to use `rubocop-daemon-wrapper`.
--   * Display convention diagnostic as errors.
local diagnostic = null_ls.builtins.diagnostics.rubocop.with({
  name = 'rubocop-daemon-wrapper',
  command = 'rubocop-daemon-wrapper',
  args = { "--format", "json", "--force-exclusion", "--stdin", "$FILENAME" },
  on_output = function(params)
    if params.output and params.output.files then
        local file = params.output.files[1]
        if file and file.offenses then
            local parser = h.diagnostics.from_json({
                severities = {
                    info = h.diagnostics.severities.information,
                    refactor = h.diagnostics.severities.hint,
                    convention = h.diagnostics.severities.error,
                    warning = h.diagnostics.severities.warning,
                    error = h.diagnostics.severities.error,
                    fatal = h.diagnostics.severities.fatal,
                },
            })
            local offenses = {}

            for _, offense in ipairs(file.offenses) do
                table.insert(offenses, {
                    message = offense.message,
                    ruleId = offense.cop_name,
                    level = offense.severity,
                    line = offense.location.start_line,
                    column = offense.location.start_column,
                    endLine = offense.location.last_line,
                    endColumn = offense.location.last_column + 1,
                })
            end

            return parser({ output = offenses })
        end
    end
    return {}
  end,
})

local SEPARATOR = '===================='

local generator = h.generator_factory({
    name = 'rubocop-daemon-wrapper',
    command = 'rubocop-daemon-wrapper',
    args = { "--auto-correct", "-f", "quiet", "--stdin", "$FILENAME" },
    to_stdin = true,
    format = "raw",
    on_output = function(params, done)
        if params.err then
            vim.notify('error while generating formatted content', vim.log.levels.ERROR, { prefix = '[null_ls.rubocop]' })
            done()
        end

        -- Rubocop fixer outputs diagnostics first and then the fixed
        -- output. These are delimited by a separator string that we
        -- look for to remove everything before it.
        local output = vim.split(params.output, '\n')
        if vim.tbl_contains(output, SEPARATOR) then
            local separator_index = u.fn.indexOf(output, SEPARATOR) + 1
            output = vim.fn.join(vim.list_slice(output, separator_index, #output), "\n")
        end
        done({{ text = output }})
    end,
})

local formatter = h.make_builtin({
    generator = generator,
    filetypes = {'ruby'},
    method = methods.internal.FORMATTING,
})

return {
  diagnostic = diagnostic,
  formatting = formatter,
}
