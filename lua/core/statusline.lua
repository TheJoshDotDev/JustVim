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

local text = "#181926"

local base1 = "#1E2030"
local base2 = "#494D64"
local base3 = "#7C7F93"

local light_blue = "#94E2D5"
local pink = "#E8A2AF"
local green = "#A6D189"

vim.api.nvim_set_hl(0, "StatusLineSeparator", { bg = base3 })
vim.api.nvim_set_hl(0, "StatusLineBase", { bg = base1 })

local separator = "%#StatusLineSeparator# "

local highlight = {
	["n"] = { bg = light_blue, fg = text },
	["c"] = { bg = pink, fg = text },
	["i"] = { bg = green, fg = text },
}

local repo_icon = {
	["gitlab"] = "",
	["github"] = "",
}

local danger_branches = {
	"main",
	"master",
	"dev",
	"develop",
	"sandbox",
}

local function is_danger_branch(branch)
	for _, value in ipairs(danger_branches) do
		if value == branch then
			return true
		end
	end
	return false
end

local function get_mode_segment()
	local current_mode = vim.api.nvim_get_mode().mode

	vim.api.nvim_set_hl(0, "StatusLineMode", highlight[current_mode] or { bg = "#ffffff" })

	return "%#StatusLineMode# 󰀵 " .. modes[current_mode] .. " "
end

local function get_source_icon()
	local source = vim.fn.system("git remote -v | grep fetch | awk '{print $2}'")

	local isGitlab = string.find(source, "gitlab")

	local repo = "github"
	if isGitlab then
		repo = "gitlab"
	end

	return repo_icon[repo] or ""
end

local function get_git_branch_segment()
	local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")

	if branch ~= "" then
		local git_bg = base1
		local git_fg = light_blue
		if is_danger_branch(branch) then
			git_bg = "#E78284"
			git_fg = "#F2CDCD"
		end

		vim.api.nvim_set_hl(0, "StatusLineGitSegment", { bg = git_bg, fg = git_fg })
		return "%#StatusLineGitSegment# " .. get_source_icon() .. " " .. branch .. " "
	end

	return ""
end

local function get_workspace()
	local cwd = vim.fn.system("pwd")
	local project_folder = string.match(cwd, ".*/(.*)")

	vim.api.nvim_set_hl(0, "StatusLineWorkspace", { bg = base2 })
	return "%#StatusLineWorkspace# 󰝰 " .. string.gsub(project_folder, "%c", "") .. " "
end

local G = {}

function G.refresh()
	return table.concat({
		get_mode_segment(),
		separator,
		get_workspace(),
		separator,
		get_git_branch_segment(),
		"%#StatusLineBase#",
	})
end

return G
