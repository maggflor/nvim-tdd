local M = {}

M.config = require("nvim-tdd.config")

M.steps = {
	none = "none",
	red = "red",
	green = "green",
	blue = "blue",
}
M.step = M.steps.none

--- Setup the plugin to use the given options.
---@param opts table Options to be set for the plugin.
function M.setup(opts)
	opts = opts or {}
	M.config = vim.tbl_deep_extend("force", M.config, opts)

	local keys = require("which-key")
	keys.register({
		[M.config.keymaps.next_step] = {
			function()
				if M.step == M.steps.red then
					M.step = M.steps.green
				elseif M.step == M.steps.green then
					M.step = M.steps.blue
				else
					M.step = M.steps.red
				end
				require("lualine").refresh()
			end,
			"TDD next",
		},
		[M.config.keymaps.end_tdd] = {
			function()
				M.step = M.steps.none
				require("lualine").refresh()
			end,
			"TDD end",
		},
	})
end

return M
