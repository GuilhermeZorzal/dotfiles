require("full-border"):setup()

require("git"):setup()

require("no-status"):setup()

require("githead"):setup({
	-- branch_prefix = "on",
	branch_symbol = " ",
	branch_color = "bright black",
	branch_borders = "()",

	remote_branch_color = "bright magenta",
	tag_color = "magenta",
	commit_color = "bright magenta",

	-- symbols ⇣ and ⇡
	behind_remote_color = "red",
	ahead_remote_color = "cyan",

	-- symbol $
	stashes_color = "bright magenta",

	-- symbol ~
	state_color = "red",

	-- symbol ✔
	staged_symbol = "✔",
	staged_color = "green",

	-- symbol !
	unstaged_color = "bright yellow",

	-- symbol ?
	untracked_color = "bright blue",
})

require("relative-motions"):setup({ show_numbers = "relative_absolute", show_motion = true, enter_mode = "first" })

require("bookmarks"):setup({
	last_directory = { enable = false, persist = false, mode = "dir" },
	persist = "all",
	desc_format = "full",
	file_pick_mode = "hover",
	custom_desc_input = false,
	notify = {
		enable = false,
		timeout = 1,
		message = {
			new = "New bookmark '<key>' -> '<folder>'",
			delete = "Deleted bookmark in '<key>'",
			delete_all = "Deleted all bookmarks",
		},
	},
})
