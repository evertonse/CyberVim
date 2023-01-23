local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },

  open_on_tab = false,
  hijack_cursor = false,

  update_cwd = true,

  update_focused_file = {
    enable =  true,
    -- update_cwd = true, -- uncomment this line to make update cwd when focusing a tab
    update_cwd = false,
  },

  filters = {
    dotfiles = false,
    custom = {},
  },

  renderer = {
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          -- 󰀨󰗖󰕗󰰜󱖔󰁢󰪥󰮍󱍸󰊰󰮎󰗖
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 26,
    side = "left",

    number = false,
    relativenumber = false,

    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit_no_picker" },
        { key = "<leader>c", cb = tree_cb "close" },
        { key = "<leader>r", cb = tree_cb "change_root_to_node" },

        { key = "<leader>e", cb = function(node) vim.cmd(":wincmd p"); end },

        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
      },
    },
  },
}
