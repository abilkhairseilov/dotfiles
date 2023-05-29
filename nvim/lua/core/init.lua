require("core.set")
require("core.remap")

-- DO NOT INCLUDE THIS
-- vim.opt.rtp:append("~/personal/streamer-tools")
-- DO NOT INCLUDE THIS

local augroup = vim.api.nvim_create_augroup
local CoreGroup = augroup('Core', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = CoreGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
vim.cmd[[
let g:deoplete#enable_at_startup = 1
]]
