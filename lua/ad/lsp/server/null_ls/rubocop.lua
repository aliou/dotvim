local null_ls = require('null-ls')
local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

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

return {
  diagnostic = diagnostic,
}
