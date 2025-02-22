return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    otps = {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "go"},
        auto_install = false,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
            disable = function(lang, buf)
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,
        },
    }
}
