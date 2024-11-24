return { -- Useful plugin to show you pending keybinds.
		"echasnovski/mini.hipatterns",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		config = function() -- This is the function that runs, AFTER loading
			local hipatterns = require("mini.hipatterns")
			hipatterns.setup({
		highlighters = {
		  -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
		  fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
		  hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
		  todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
		  note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

		  -- Highlight hex color strings (`#rrggbb`) using that color
		  hex_color = hipatterns.gen_highlighter.hex_color(),
		},

		})

			-- Document existing key chains
		end,
	}
