local M = require("lualine.component"):extend()

vim.cmd("highlight TddRed guifg=#282c34 guibg=#e06c75")
vim.cmd("highlight TddGreen guifg=#282c34 guibg=#89c379")
vim.cmd("highlight TddBlue guifg=#282c34 guibg=#61afef")

function M:init(options)
	options.icon = { "󰊲", align = "right" }
	M.super.init(self, options)
end

function M:update_status()
	local tdd = require("nvim-tdd")

	if tdd.step == tdd.steps.red then
		return "%#TddRed#" .. "Write one failing test"
	elseif tdd.step == tdd.steps.green then
		return "%#TddGreen#" .. "Make the test pass"
	elseif tdd.step == tdd.steps.blue then
		return "%#TddBlue#" .. "Refactor the code"
	end
	return ""
end

return M
