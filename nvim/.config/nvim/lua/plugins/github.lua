return {
  {
    "projekt0n/github-nvim-theme",
    lazy = false, -- Das Theme soll sofort beim Start geladen werden
    priority = 1000, -- Höchste Priorität, damit es vor anderen Plugins aktiv ist
    config = function()
      -- Hier wird das Theme konfiguriert und aktiviert
      require("github-theme").setup({
        -- Hier kannst du bei Bedarf Optionen eintragen (siehe Dokumentation)
      })

      -- Hier wählst du den gewünschten Github-Style aus:
      -- Optionen: github_dark, github_dark_default, github_light, github_light_default,
      --           github_dark_dimmed, github_dark_high_contrast, github_light_high_contrast
      vim.cmd("colorscheme github_dark_default")
    end,
  },
}
