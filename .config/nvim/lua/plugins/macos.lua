return {
    -- follow system them
    {
        "cormacrelf/dark-notify",
        lazy = false,
        priority = 1000,
        config = function()
            require("dark_notify").run()
        end,
    },
}
