return {
    "numToStr/Comment.nvim",
    config = function()
        local ok, comment = pcall(require, "Comment")
        if not ok then
            vim.notify("Comment.nvim is not installed.", vim.log.levels.ERROR)
            return
        end

        comment.setup({}) -- plugin is good, nothing to add
    end,
}
