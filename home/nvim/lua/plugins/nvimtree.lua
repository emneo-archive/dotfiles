local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set("n", "<leader>f", "<cmd>NvimTreeFocus<CR>")
  vim.keymap.set("n", "m", api.tree.change_root_to_node, { buffer = bufnr })

  -- <C-[hjkl]> to move around windows
  vim.keymap.set({ 'n', 'i', 'v' }, '<C-h>', '<C-w><C-h>', { silent = true })
  vim.keymap.set({ 'n', 'i', 'v' }, '<C-j>', '<C-w><C-j>', { silent = true })
  vim.keymap.set({ 'n', 'i', 'v' }, '<C-k>', '<C-w><C-k>', { silent = true })
  vim.keymap.set({ 'n', 'i', 'v' }, '<C-l>', '<C-w><C-l>', { silent = true })
end

local is_vt_tty = vim.fn.expand("$TERM") == "linux"

local renderer_settings = {
  [ false ] = nil,
  [ true ] = {
    icons = {
      webdev_colors = false,
      symlink_arrow = " → ",
      glyphs = {
        default = "#",
        symlink = "@",
        bookmark = ":",
        modified = ".",
        folder = {
          arrow_closed = ">",
          arrow_open = "v",
          default = "/",
          open = "/",
          empty = "/",
          empty_open = "/",
          symlink = "@",
          symlink_open = "@",
        },
        git = {
          unstaged = "x",
          staged = "&",
          unmerged = "!",
          renamed = "→",
          untracked = "*",
          deleted = "-",
          ignored = ";",
        },
      }
    }
  }
};

require("nvim-tree").setup(
{
  on_attach = on_attach,
  filters = {
    git_ignored = false,
    custom = { "^\\.git$" },
  },
  renderer = renderer_settings[is_vt_tty]
})
