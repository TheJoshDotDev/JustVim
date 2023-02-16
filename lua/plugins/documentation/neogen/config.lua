local neogen_keys = require("plugins.documentation.neogen.keys")
return function()
	local status_ok, neogen = pcall(require, "neogen")
	if not status_ok then
		return
	end

	neogen.setup()
	neogen_keys()
end
