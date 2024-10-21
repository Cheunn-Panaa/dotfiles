-- Sidenote since i'm using alacritty there is close to no changes
-- when it comes to the terminal with this plugin
function InitColor(color)
	color = color or "nightfox"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	{
		"EdenEast/nightfox.nvim",
		name = "nightfox",
		config = function()
			require("nightfox").setup({
				options = {
					styles = {
						comments = "italic",
						keywords = "bold",
						types = "italic,bold",
					},
				},
				palette = {
					nightfox = {
						black = { base = "#212121", bright = "#4a4a4a" },
						blue = { base = "#82aaff", bright = "#82aaff"},
						cyan = { base = "#89ddff" , bright = "#89ddff"},
						green = { base = "#c3e88d" , bright = "#c3e88d"},
						magenta = { base = "#c792ea" , bright = "#c792ea"},
						red = { base = "#f07178" , bright = "#f07178"},
						white = { base = "#eeffff" , bright = "#ffffff"},
						yellow = { base = "#ffcb6b" , bright = "#ffcb6b"},
					},
				},
			})
			InitColor()
		end,
	},
}
