{ settings, pkgs, ... }:

with settings;
let
	plugin = pkg: conf: {
		plugin = pkg;
		config = conf;
		type = "lua";
	};
	nvim-treesitter-pkg = (pkgs.vimPlugins.nvim-treesitter.withPlugins
		(plugins:
			with plugins; [
				bash
				c
				cpp
				css
				d
				diff
				gitattributes
				gitcommit
				gitignore
				git_config
				git_rebase
				ini
				json
				lua
				make
				nix
			]
		)
	);
in
{
	enable = true;
	defaultEditor = true;
	viAlias = true;

	plugins = with pkgs.vimPlugins; [
		#(plugin bufferline-nvim ''
		#	require "bufferline".setup {}
		#'')
		(plugin catppuccin-nvim ''
			require "catppuccin".setup {
				--transparent_background = true
			}
			vim.cmd.colorscheme "catppuccin"
		'')
		(plugin lualine-nvim ''
			require "lualine".setup {
				options = {
					theme = "catppuccin",
					section_separators = ""
				},
				sections = {
					lualine_a = {"mode"},
					lualine_b = {"branch", "diff", "diagnostics"},
					lualine_c = {"filename", "lsp_progress"},
					lualine_x = {"filetype", "searchcount", "selectioncount"},
					lualine_y = {"progress"},
					lualine_z = {"location"}
				}
			}
		'')
		(plugin nvim-cmp ''
			local cmp = require "cmp"
			local luasnip = require "luasnip"
			local select_opts = { behavior = cmp.SelectBehavior.Select }
			
			cmp.setup {
				confirmation = {
					default_behavior = cmp.ConfirmBehavior.Replace
				},
				formatting = {
					fields = { "abbr", "kind", "menu" },
					format = require "lspkind".cmp_format {
						with_text = true
					}
				},
				mapping = {
					-- Ctrl-e to close
					["<C-e>"] = function(fallback)
						cmp.close()
						fallback()
					end,
					-- Return to confirm
					["<cr>"] = cmp.mapping.confirm(),
					-- Tab to select the next item
					["<tab>"] = cmp.mapping({
						i = function(fallback)
							if not cmp.select_next_item() and not luasnip.jump(1) then
								fallback()
							end
						end,
						c = cmp.mapping.select_next_item(),
					}),
					-- Shift-Tab to select the previous item
					["<s-tab>"] = cmp.mapping({
						i = function(fallback)
							if not cmp.select_prev_item() and not luasnip.jump(-1) then
								fallback()
							end
						end,
						c = cmp.mapping.select_prev_item(),
					})
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end
				},
				sources = {
					{ name = "buffer", keyword_length = 3 },
					{ name = "cmdline" },
					{ name = "luasnip" },
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "treesitter" }
				},
			}
			-- `/` cmdline setup.
			cmp.setup.cmdline('/', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" }
				}
			})
			-- `:` cmdline setup.
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" }
				}, {
					{
						name = "cmdline",
						option = {
							ignore_cmds = { "Man", '!' }
						}
					}
				})
			})
		'')
		(plugin nvim-lspconfig ''
			local lspconfig = require "lspconfig"
			lspconfig.clangd.setup {}
			lspconfig.serve_d.setup {}
		'')
		(plugin nvim-treesitter-pkg ''
			require "nvim-treesitter.configs".setup {
				auto_install = true,
				endwise = {
					enable = true,
				},
				highlight = {
					enable = true,
				},
				parser_install_dir = "~/.local/share/tree-sitter"
			}
			require "nvim-treesitter.install".update { with_sync = true }
		'')
		(plugin presence-nvim ''
			require "presence".setup {}
		'')
		cmp-buffer
		cmp-cmdline
		cmp-nvim-lsp
		cmp-path
		cmp-treesitter
		cmp_luasnip
		friendly-snippets
		lualine-lsp-progress
		luasnip
		lspkind-nvim
		nvim-treesitter-context
		nvim-treesitter-endwise
		nvim-web-devicons
		plenary-nvim
		vim-css-color
	];

	extraLuaConfig = ''
---- Shortcuts ----

local g = vim.g
local o = vim.o
local api = vim.api
local cmd = vim.cmd


---- Preferences ----

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 300

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- Better editor UI
o.background = "dark"
o.number = true
o.numberwidth = 5
o.relativenumber = true
o.signcolumn = "yes:2"
o.cursorline = true

-- Better editing experience
o.cindent = true
o.autoindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = -1 -- If negative, shiftwidth value is used
o.completeopt = "menu,menuone,preview"

-- Appearance
local accent = 99 -- cterm colour
api.nvim_set_hl(0, "Pmenu", {ctermfg = accent})
api.nvim_set_hl(0, "PmenuSel", {ctermbg = accent})
api.nvim_set_hl(0, "Search", {ctermfg = 15, ctermbg = 25})
api.nvim_set_hl(0, "LineNr", {ctermfg = accent})
api.nvim_set_hl(0, "CursorLine", {ctermbg = 235})
api.nvim_set_hl(0, "CursorColumn", {ctermbg = 235})
-- Don"t show mode hints (because lualine is better)
cmd.set "noshowmode"

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- Remember 50 items in commandline history
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Preserve view while jumping
o.jumpoptions = "view"


---- Key bindings ----

local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

map('n', "<C-h>", "<C-w>h")
map('n', "<C-j>", "<C-w>j")
map('n', "<C-k>", "<C-w>k")
map('n', "<C-l>", "<C-w>l")
	'';
}
