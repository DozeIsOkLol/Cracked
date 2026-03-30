-- AsahreiHub | Universal Auto-Detector & Loader
-- Supports ALL requested games from Cracked/asahrei (DozeIsOkLol/Cracked)
-- Games:
--   • 1 Stair = $1/s          (139510705441326)
--   • Jail Tycoon             (5775214331)
--   • Strike Back [Season 1]  (124143542106350)
--   • Super Hero Tycoon       (574407221)
--   • Dragon Simulator        (2324069335)

local AsahreiHub = {}

function AsahreiHub:Notify(title, text, duration)
    game.StarterGui:SetCore("SendNotification", {
        Title = title or "AsahreiHub";
        Text = text or "Loaded!";
        Duration = duration or 8;
    })
end

print("🔥 AsahreiHub Loaded! Auto-detecting game...")

local placeId = game.PlaceId
local success, gameInfo = pcall(function()
    return game:GetService("MarketplaceService"):GetProductInfo(placeId)
end)
local gameName = success and gameInfo.Name or "Unknown Game"

-- Game database
local supportedGames = {
    [139510705441326] = { name = "1 Stair = $1/s",          folder = "1Stair=$1",         script = "Script.lua" },
    [5775214331]      = { name = "Jail Tycoon",             folder = "JailTycoon",        script = "Script.lua.lua" },
    [124143542106350] = { name = "Strike Back [Season 1]",  folder = "StrikeBack[Season1]", script = "Script.lua" },
    [574407221]       = { name = "Super Hero Tycoon",       folder = "SuperHeroTycoon",   script = "Script.lua" },
    [2324069335]      = { name = "Dragon Simulator",        folder = "DragonSimulator",   script = "Script1.lua" },
}

local gameData = supportedGames[placeId]

if gameData then
    print("✅ Detected: " .. gameName .. " (" .. gameData.name .. ")")
    AsahreiHub:Notify("AsahreiHub", "Detected " .. gameData.name .. "!\nLoading script... 🔥", 6)
    
    local url = "https://raw.githubusercontent.com/DozeIsOkLol/Cracked/main/asahrei/" .. gameData.folder .. "/" .. gameData.script
    
    local loadSuccess, err = pcall(function()
        loadstring(game:HttpGet(url, true))()
    end)
    
    if loadSuccess then
        print("🚀 " .. gameData.name .. " script loaded successfully!")
        AsahreiHub:Notify("AsahreiHub", gameData.name .. " script injected!\nEnjoy the hub 🐉", 10)
    else
        warn("❌ Failed to load script for " .. gameData.name .. ": " .. tostring(err))
        AsahreiHub:Notify("AsahreiHub", "Failed to inject script.\nCheck your executor or internet.", 8)
    end
else
    print("❌ Game not supported: " .. gameName .. " (PlaceId: " .. placeId .. ")")
    AsahreiHub:Notify("AsahreiHub", "Game not supported yet.\nSupported games are listed in the script.", 10)
    warn("AsahreiHub only supports the 5 games above right now. Add more in the 'supportedGames' table!")
end
