return {
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			workspaces = {
				{
					name = "personal",
					path = "~/Documents/Obsidian/personal",
				},
				{
					name = "work",
					path = "~/Documents/Obsidian/work",
				},
			},

			-- Optional, customize how note IDs are generated
			note_id_func = function(title)
				-- Create note IDs in a Zettelkasten format with a timestamp.
				local suffix = ""
				if title ~= nil then
					-- If title is given, transform it into valid file name.
					suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					-- If title is nil, just add 4 random uppercase letters to the suffix.
					for _ = 1, 4 do
						suffix = suffix .. string.char(math.random(65, 90))
					end
				end
				return tostring(os.time()) .. "-" .. suffix
			end,

			-- Optional, set the YAML parser to use.
			yaml_parser = "native",

			-- Optional, customize how note file names are generated given the ID, target directory, and title.
			note_path_func = function(spec)
				-- This is equivalent to the default behavior.
				local path = spec.dir / tostring(spec.id)
				return path:with_suffix(".md")
			end,

			-- Optional, customize how wiki links are formatted.
			wiki_link_func = function(opts)
				return require("obsidian.util").wiki_link_id_prefix(opts)
			end,

			-- Optional, customize how markdown links are formatted.
			markdown_link_func = function(opts)
				return require("obsidian.util").markdown_link(opts)
			end,

			-- Optional, set to true if you use the Obsidian Advanced URI plugin.
			use_advanced_uri = false,

			-- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
			open_app_foreground = false,

			-- Optional, customize the default tags behavior
			disable_frontmatter = false,

			-- Optional, customize note frontmatter
			note_frontmatter_func = function(note)
				-- Add the title of the note as an alias.
				if note.title then
					note:add_alias(note.title)
				end

				local out = { id = note.id, aliases = note.aliases, tags = note.tags }

				-- `note.metadata` contains any manually added fields in the frontmatter.
				-- So here we just make sure those fields are kept in the frontmatter.
				if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
					for k, v in pairs(note.metadata) do
						out[k] = v
					end
				end

				return out
			end,

			-- Optional, for templates
			templates = {
				folder = "templates",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M",
				-- A map for custom variables, the key should be the variable and the value a function
				substitutions = {
					yesterday = function()
						return os.date("%Y-%m-%d", os.time() - 86400)
					end,
				},
			},

			-- Optional, configure key mappings for navigating links
			follow_url_func = function(url)
				-- Open the URL in the default web browser.
				vim.fn.jobstart({ "xdg-open", url }) -- linux
				-- vim.fn.jobstart({"open", url})  -- Mac OS
				-- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
			end,

			-- Optional, configure additional syntax highlighting / extmarks.
			ui = {
				enable = true,
				update_debounce = 200,
				max_file_length = 5000,
				checkboxes = {
					[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
					["x"] = { char = "", hl_group = "ObsidianDone" },
					[">"] = { char = "", hl_group = "ObsidianRightArrow" },
					["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
					["!"] = { char = "", hl_group = "ObsidianImportant" },
				},
				bullets = { char = "•", hl_group = "ObsidianBullet" },
				external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
				reference_text = { hl_group = "ObsidianRefText" },
				highlight_text = { hl_group = "ObsidianHighlightText" },
				tags = { hl_group = "ObsidianTag" },
				block_ids = { hl_group = "ObsidianBlockID" },
				hl_groups = {
					ObsidianTodo = { bold = true, fg = "#f78c6c" },
					ObsidianDone = { bold = true, fg = "#89ddff" },
					ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
					ObsidianTilde = { bold = true, fg = "#ff5370" },
					ObsidianImportant = { bold = true, fg = "#d73128" },
					ObsidianBullet = { bold = true, fg = "#89ddff" },
					ObsidianRefText = { underline = true, fg = "#c792ea" },
					ObsidianExtLinkIcon = { fg = "#c792ea" },
					ObsidianTag = { italic = true, fg = "#89ddff" },
					ObsidianBlockID = { italic = true, fg = "#89ddff" },
					ObsidianHighlightText = { bg = "#75662e" },
				},
			},

			-- Optional, configure note search functionality
			finder = "telescope.nvim",
			finder_mappings = {
				-- Create a new note from your query with `:ObsidianSearch` and `:ObsidianQuickSwitch`.
				-- Currently only telescope supports this.
				new = "<C-x>",
			},

			-- Optional, sort search results by "path", "modified", "accessed", or "created".
			sort_by = "modified",
			sort_reversed = true,

			-- Optional, determines how certain commands open notes.
			open_notes_in = "current",

			-- Optional, configure additional callbacks
			callbacks = {
				-- Runs at the end of `require("obsidian").setup()`.
				post_setup = function(client) end,

				-- Runs anytime you enter the buffer for a note.
				enter_note = function(client, note) end,

				-- Runs anytime you leave the buffer for a note.
				leave_note = function(client, note) end,

				-- Runs right before writing the buffer for a note.
				pre_write_note = function(client, note) end,

				-- Runs anytime the workspace is set/changed.
				post_set_workspace = function(client, workspace) end,
			},

			-- Optional, customize the default picker behavior
			picker = {
				name = "telescope.nvim",
				note_mappings = {
					new = "<C-x>",
					insert_link = "<C-l>",
				},
				tag_mappings = {
					tag_note = "<C-x>",
					insert_tag = "<C-l>",
				},
			},

			-- Optional, for daily notes
			daily_notes = {
				folder = "daily",
				date_format = "%Y-%m-%d",
				alias_format = "%B %-d, %Y",
				default_tags = { "daily-notes" },
				template = nil,
			},

			-- Optional, completion
			completion = {
				nvim_cmp = true,
				min_chars = 2,
			},

			-- Optional, mappings
			mappings = {
				-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
				["gf"] = {
					action = function()
						return require("obsidian").util.gf_passthrough()
					end,
					opts = { noremap = false, expr = true, buffer = true },
				},
				-- Toggle check-boxes.
				["<leader>ch"] = {
					action = function()
						return require("obsidian").util.toggle_checkbox()
					end,
					opts = { buffer = true },
				},
				-- Smart action depending on context, either follow link or toggle checkbox.
				["<cr>"] = {
					action = function()
						return require("obsidian").util.smart_action()
					end,
					opts = { buffer = true, expr = true },
				},
			},

			-- Optional, for specifying attachments folder
			attachments = {
				img_folder = "attachments",
				img_text_func = function(client, path)
					path = client:vault_relative_path(path) or path
					return string.format("![%s](%s)", path.name, path)
				end,
			},
		},

		-- Custom keymaps
		keys = {
			{
				"<leader>on",
				"<cmd>ObsidianNew<cr>",
				desc = "Create new note",
			},
			{
				"<leader>oo",
				"<cmd>ObsidianOpen<cr>",
				desc = "Open in Obsidian app",
			},
			{
				"<leader>ob",
				"<cmd>ObsidianBacklinks<cr>",
				desc = "Show backlinks",
			},
			{
				"<leader>ot",
				"<cmd>ObsidianToday<cr>",
				desc = "Open today's daily note",
			},
			{
				"<leader>oy",
				"<cmd>ObsidianYesterday<cr>",
				desc = "Open yesterday's daily note",
			},
			{
				"<leader>os",
				"<cmd>ObsidianSearch<cr>",
				desc = "Search notes",
			},
			{
				"<leader>oq",
				"<cmd>ObsidianQuickSwitch<cr>",
				desc = "Quick switch between notes",
			},
			{
				"<leader>ol",
				"<cmd>ObsidianLink<cr>",
				mode = "v",
				desc = "Link selected text",
			},
			{
				"<leader>oln",
				"<cmd>ObsidianLinkNew<cr>",
				mode = "v",
				desc = "Create new note from selection",
			},
			{
				"<leader>of",
				"<cmd>ObsidianFollowLink<cr>",
				desc = "Follow link under cursor",
			},
			{
				"<leader>ow",
				"<cmd>ObsidianWorkspace<cr>",
				desc = "Switch workspace",
			},
			{
				"<leader>op",
				"<cmd>ObsidianPasteImg<cr>",
				desc = "Paste image from clipboard",
			},
			{
				"<leader>or",
				"<cmd>ObsidianRename<cr>",
				desc = "Rename note",
			},
			{
				"<leader>oi",
				"<cmd>ObsidianTemplate<cr>",
				desc = "Insert template",
			},
			{
				"<leader>og",
				"<cmd>ObsidianTags<cr>",
				desc = "Search by tags",
			},
		},
	},
}
