-- Lalen (Black Metal Mayhem) Colorscheme for Neovim
-- Based on base16-vim Black Metal Mayhem scheme
local M = {}

local config = {
    transparent_background = false,
}

function M.setup(opts)
    opts = opts or {}
    config = vim.tbl_deep_extend("force", config, opts)
    local transparent = config.transparent_background

    local base = {
        base00 = "#000000", -- Background
        base01 = "#121212",
        base02 = "#222222",
        base03 = "#333333", -- Comments
        base04 = "#999999",
        base05 = "#c1c1c1", -- Default FG
        base06 = "#999999",
        base07 = "#c1c1c1", -- Light FG
        base08 = "#5f8787", -- Red (e.g. errors)
        base09 = "#aaaaaa", -- Orange
        base0A = "#eecc6c", -- Yellow
        base0B = "#f3ecd4", -- Green
        base0C = "#aaaaaa", -- Cyan
        base0D = "#888888", -- Blue
        base0E = "#999999", -- Magenta
        base0F = "#444444", -- Brown
    }

    local cterm = {
        base00 = 0,  base01 = 10, base02 = 11, base03 = 8,
        base04 = 12, base05 = 7,  base06 = 13, base07 = 15,
        base08 = 1,  base09 = 9,  base0A = 3,  base0B = 2,
        base0C = 6,  base0D = 4,  base0E = 5,  base0F = 14,
    }

    local function hi(group, guifg, guibg, ctermfg, ctermbg, attr)
        local hl = {
            fg = guifg,
            ctermfg = ctermfg,
        }

        if not transparent then
            hl.bg = guibg
            hl.ctermbg = ctermbg
        else
            hl.bg = "NONE"
            hl.ctermbg = "NONE"
        end

        if attr then
            for _, a in ipairs(vim.split(attr, ",")) do
                hl[a] = true
            end
        end

        vim.api.nvim_set_hl(0, group, hl)
    end

    -- UI
    hi("Normal",        base.base05, base.base00, cterm.base05, cterm.base00)
    hi("Visual",        base.base05, base.base02, cterm.base05, cterm.base02)
    hi("LineNr",        base.base03, base.base01, cterm.base03, cterm.base01)
    hi("CursorLineNr",  base.base04, base.base01, cterm.base04, cterm.base01)
    hi("StatusLine",    base.base04, base.base02, cterm.base04, cterm.base02)
    hi("VertSplit",     base.base02, base.base02, cterm.base02, cterm.base02)
    hi("ColorColumn",   nil, base.base01, nil, cterm.base01)
    hi("CursorLine",    nil, base.base01, nil, cterm.base01)
    hi("Pmenu",         base.base05, base.base01, cterm.base05, cterm.base01)
    hi("PmenuSel",      base.base01, base.base0A, cterm.base01, cterm.base0A, "bold")
    hi("PmenuBorder",   base.base04, base.base01, cterm.base04, cterm.base01)

    -- Syntax
    hi("Comment",       base.base03, nil, cterm.base03, nil, "italic")
    hi("Constant",      base.base09, nil, cterm.base09, nil)
    hi("String",        base.base0B, nil, cterm.base0B, nil, "italic")
    hi("Character",     base.base08, nil, cterm.base08, nil)
    hi("Identifier",    base.base08, nil, cterm.base08, nil)
    hi("Function",      base.base0D, nil, cterm.base0D, nil)
    hi("Statement",     base.base08, nil, cterm.base08, nil)
    hi("Keyword",       base.base0E, nil, cterm.base0E, nil, "bold")
    hi("Operator",      base.base05, nil, cterm.base05, nil)
    hi("Type",          base.base0A, nil, cterm.base0A, nil)
    hi("Special",       base.base0C, nil, cterm.base0C, nil)
    hi("Delimiter",     base.base0F, nil, cterm.base0F, nil)

    -- LSP / Diagnostics
    hi("DiagnosticError", base.base08, nil, cterm.base08, nil)
    hi("DiagnosticWarn",  base.base0A, nil, cterm.base0A, nil)
    hi("DiagnosticInfo",  base.base0D, nil, cterm.base0D, nil)
    hi("DiagnosticHint",  base.base0C, nil, cterm.base0C, nil)

    -- Custom Blink groups (e.g., for cmp)
    hi("BlinkCmpMenu",     base.base05, base.base01, cterm.base05, cterm.base01)
    hi("BlinkCmpMenuSelection", base.base0A, base.base01, cterm.base01, cterm.base0A, "bold")
    hi("BlinkCmpMenuBorder",   base.base04, base.base01, cterm.base04, cterm.base01)

end

return M
