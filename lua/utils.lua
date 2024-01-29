local modes = {
	["n"] = "NORMAL",
	["no"] = "NORMAL",
	["v"] = "VISUAL",
	["V"] = "VISUAL LINE",
	[""] = "VISUAL BLOCK",
	["s"] = "SELECT",
	["S"] = "SELECT LINE",
	[""] = "SELECT BLOCK",
	["i"] = "INSERT",
	["ic"] = "INSERT",
	["R"] = "REPLACE",
	["Rv"] = "VISUAL REPLACE",
	["c"] = "COMMAND",
	["cv"] = "VIM EX",
	["ce"] = "EX",
	["r"] = "PROMPT",
	["rm"] = "MOAR",
	["r?"] = "CONFIRM",
	["!"] = "SHELL",
	["t"] = "TERMINAL",
}

local function mode()
	local current_mode = vim.api.nvim_get_mode().mode
	return string.format(" %s ", modes[current_mode]):upper()
end

local function branch_name()
	local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
	if branch ~= "" then
		return branch
	else
		return ""
	end
end

local J = {}

function J.statusLineInfo()
	vim.api.nvim_set_hl(0, "StatusLineMode", { bg = "#E8A2AF", fg = "#333333" })
	vim.api.nvim_set_hl(0, "StatusLineReset", { bg = "#1E2030" })

	return table.concat({
		"%#StatusLineMode#",
		" 󰀵",
		mode(),
		"%#StatusLineReset#",
		"  ",
		branch_name(),
		"%h%m%r%=%-14.(%l,%c%V%)",
	})
end

return J
