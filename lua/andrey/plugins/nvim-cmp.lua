return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer", -- source for text in buffer
        "hrsh7th/cmp-path", -- source for file system paths
        "L3MON4D3/LuaSnip", -- snippet engine
        "rafamadriz/friendly-snippets", -- collection of snippets
        "onsails/lspkind.nvim", -- vs-code like pictograms
    },
    config = function()
        local cmp_ok, cmp = pcall(require, "cmp")
        if not cmp_ok then
            vim.notify("nvim-cmp is not installed.", vim.log.levels.ERROR)
            return
        end

        local luasnip_ok, luasnip = pcall(require, "luasnip")
        if not luasnip_ok then
            vim.notify("LuaSnip is not installed.", vim.log.levels.ERROR)
            return
        end

        local lspkind_ok, lspkind = pcall(require, "lspkind")
        if not lspkind_ok then
            vim.notify("lspkind.nvim is not installed.", vim.log.levels.ERROR)
            return
        end

        -- load vscode style snippets from installed plugins (e.g. friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            completion = {
                autocomplete = false 
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            -- key mappings for completion menu
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- scroll up the documents 4 rows
                ["<C-f>"] = cmp.mapping.scroll_docs(4), -- scroll down the documents 4 rows
                ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                ["<C-e>"] = cmp.mapping.abort(), -- close completion window
                ["<CR>"] = cmp.mapping.confirm({ 
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true
                }),
            }),

            sources = cmp.config.sources({
                { name = "nvim_lsp" }, -- lsp servers
                { name = "luasnip" }, -- luasnip snippets
                { name = "path" }, -- file system paths
            }),

            formatting = {
                format = lspkind.cmp_format({
                    maxwidth = 50,
                    ellipsis_char = "...", -- truncate long item names
                }),
            },
        })
    end,
}

