AddEventHandler(CAT_CORE_CONFIG.EVENTS.PlayerLoaded[CAT_CORE_CONFIG.FRAMEWORK], function(Player)
    if (CAT_CORE_CONFIG.FRAMEWORK == "QB") then
        CAT_CORE.Player.CreatePlayerData(Player.PlayerData.source)
    else
        CAT_CORE.Player.CreatePlayerData(Player)
    end
end)