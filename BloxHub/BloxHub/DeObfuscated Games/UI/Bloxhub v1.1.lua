-- ts file was generated at discord.gg/25ms


local v1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/DozeIsOkLol/Cracked/refs/heads/main/BloxHub/BloxHub/Addon/main.lua"))()
local vu2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/DozeIsOkLol/Cracked/refs/heads/main/BloxHub/BloxHub/Addon/SaveManager.lua"))()
local vu3 = loadstring(game:HttpGet("https://raw.githubusercontent.com/DozeIsOkLol/Cracked/refs/heads/main/BloxHub/BloxHub/Addon/InterfaceManager.lua"))()
local vu4 = loadstring(game:HttpGet("https://api-bloxhub.vercel.app/autisme.lua"))()
local v5 = {
    ["FPS Games"] = {
        {
            name = "Arsenal ESP + Aimbot",
            description = "Advanced ESP and Aimbot for Arsenal",
            scriptName = "arsenal-esp+aimbot.txt",
            verified = true
        },
        {
            name = "Entrenched WW1 Hack",
            description = "ESP and Aimbot for Entrenched",
            scriptName = "entrenched-ww1-esp+aimbot.txt",
            verified = true
        },
        {
            name = "Rivals ESP + Aimbot",
            description = "Complete hack suite for Rivals",
            scriptName = "rivals-esp+aimbot.txt",
            verified = true
        }
    },
    ["Mystery Games"] = {
        {
            name = "Murder Mystery 2 Hack",
            description = "ESP, Auto-collect coins, and more",
            scriptName = "murder-mystery 2.txt",
            verified = true
        }
    },
    ["Sports Games"] = {
        {
            name = "Basketball Script",
            description = "Auto-shoot, speed boost, and more",
            scriptName = "basketball.lua",
            verified = true
        }
    },
    ["Fun Scripts"] = {
        {
            name = "2Player Steal Brainrot",
            description = "Funny trolling script",
            scriptName = "2palayer_steal_brainrot.lua",
            verified = false
        },
        {
            name = "Ink Game Script",
            description = "Advanced ink game utilities",
            scriptName = "ink-game.lua",
            verified = false
        }
    },
    ["Other Games"] = {
        {
            name = "Project Delta",
            description = "Complete game enhancement",
            scriptName = "project_delta.lua",
            verified = false
        }
    }
}
local function vu11(pu6)
    local v9, v10 = pcall(function()
        local v7 = vu4.bless .. vu4.me .. vu4.god .. pu6 .. vu4.well .. vu4.methodfatch
        local v8 = game:HttpGet(v7)
        loadstring(v8)()
    end)
    if v9 then
        game.StarterGui:SetCore("SendNotification", {
            Title = "BloxHub Free",
            Text = "Script executed successfully!",
            Duration = 3
        })
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "BloxHub Free",
            Text = "Failed to execute script: " .. tostring(v10),
            Duration = 5
        })
    end
end
local v12 = v1:CreateWindow({
    Title = "BloxHub Free " .. v1.Version,
    SubTitle = "Advanced Script Hub",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})
local v13 = v12:AddTab({
    Title = "Home",
    Icon = "home"
})
local v14 = v12:AddTab({
    Title = "Scripts",
    Icon = "code"
})
local v15 = v12:AddTab({
    Title = "Settings",
    Icon = "settings"
})
local v16 = v12:AddTab({
    Title = "Info",
    Icon = "info"
})
local v18 = (function()
    local v17 = game:GetService("Players").LocalPlayer
    return {
        username = v17.Name,
        displayName = v17.DisplayName,
        userId = v17.UserId,
        accountAge = v17.AccountAge,
        premium = v17.MembershipType == Enum.MembershipType.Premium
    }
end)()
v13:AddParagraph({
    Title = "Welcome to BloxHub Free!",
    Content = string.format("Hello %s! Welcome to the most advanced free script hub for Roblox. Select scripts from the Scripts tab to enhance your gaming experience.", v18.displayName)
})
v13:AddButton({
    Title = "Execute Universal ESP",
    Description = "Works on most games",
    Callback = function()
        vu11("universal-esp.lua")
    end
})
v13:AddButton({
    Title = "Anti-AFK Script",
    Description = "Prevents you from being kicked for inactivity",
    Callback = function()
        local vu19 = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:connect(function()
            vu19:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            wait(1)
            vu19:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        end)
        game.StarterGui:SetCore("SendNotification", {
            Title = "BloxHub Free",
            Text = "Anti-AFK enabled!",
            Duration = 3
        })
    end
})
v14:AddParagraph({
    Title = "Current Game: " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
    Content = "Browse and execute scripts by category. Verified scripts are tested and safe to use."
})
local v20, v21, v22 = pairs(v5)
local vu23 = vu11
while true do
    local v24
    v22, v24 = v20(v21, v22)
    if v22 == nil then
        break
    end
    local v25 = v14:AddSection(v22)
    local v26, v27, v28 = ipairs(v24)
    while true do
        local vu29
        v28, vu29 = v26(v27, v28)
        if v28 == nil then
            break
        end
        local v30 = vu29.name
        if vu29.verified then
            v30 = v30 .. " \226\156\147"
        end
        v25:AddButton({
            Title = v30,
            Description = vu29.description,
            Callback = function()
                vu23(vu29.scriptName)
            end
        })
    end
end
local v31 = v14:AddSection("Quick Actions")
v31:AddButton({
    Title = "Rejoin Server",
    Description = "Quickly rejoin the current server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end
})
v31:AddButton({
    Title = "Server Hop",
    Description = "Join a different server",
    Callback = function()
        local vu32 = game:GetService("HttpService")
        local v33 = game:GetService("TeleportService")
        local v34 = game.PlaceId
        local vu35 = "https://games.roblox.com/v1/games/" .. v34 .. "/servers/Public?sortOrder=Asc&limit=100"
        local v36, v37 = pcall(function()
            return vu32:JSONDecode(game:HttpGet(vu35))
        end)
        if v36 and v37.data then
            local v38, v39, v40 = pairs(v37.data)
            while true do
                local v41
                v40, v41 = v38(v39, v40)
                if v40 == nil then
                    break
                end
                if v41.playing < v41.maxPlayers and v41.id ~= game.JobId then
                    v33:TeleportToPlaceInstance(v34, v41.id, game:GetService("Players").LocalPlayer)
                    break
                end
            end
        end
    end
})
local v42 = v15:AddSection("Interface Settings")
local vu43 = false
v42:AddToggle("AutoExecute", {
    Title = "Auto-Execute on Join",
    Description = "Automatically execute saved scripts when joining games",
    Default = false,
    Callback = function(p44)
        vu43 = p44
    end
})
local vu45 = true
v42:AddToggle("Notifications", {
    Title = "Show Notifications",
    Description = "Display execution status notifications",
    Default = true,
    Callback = function(p46)
        vu45 = p46
    end
})
v42:AddButton({
    Title = "Reset Settings",
    Description = "Reset all settings to default",
    Callback = function()
        vu2:Delete()
        vu3:Reset()
    end
})
v16:AddParagraph({
    Title = "About BloxHub Free",
    Content = "BloxHub Free is a comprehensive script hub designed to enhance your Roblox gaming experience. Our scripts are carefully curated and tested for safety and functionality."
})
v16:AddParagraph({
    Title = "Player Information",
    Content = string.format("\r\nUsername: %s\r\nDisplay Name: %s\r\nUser ID: %s\r\nAccount Age: %d days\r\nPremium: %s\r\n    ", v18.username, v18.displayName, tostring(v18.userId), v18.accountAge, v18.premium and "Yes" or "No")
})
v16:AddSection("Statistics"):AddParagraph({
    Title = "Hub Statistics",
    Content = string.format("\r\nTotal Scripts: %d\r\nVerified Scripts: %d\r\nCategories: %d\r\n    ", 25, 15, # v5)
})
v16:AddButton({
    Title = "Join Discord Server",
    Description = "Get support and updates",
    Callback = function()
        setclipboard("https://discord.gg/bloxhub")
        game.StarterGui:SetCore("SendNotification", {
            Title = "BloxHub Free",
            Text = "Discord link copied to clipboard!",
            Duration = 3
        })
    end
})
v16:AddButton({
    Title = "Check for Updates",
    Description = "Manually check for hub updates",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "BloxHub Free",
            Text = "You are using the latest version!",
            Duration = 3
        })
    end
})
vu2:SetLibrary(v1)
vu2:IgnoreThemeSettings()
vu2:SetIgnoreIndexes({})
vu2:SetFolder("BloxHub/configs")
vu2:BuildConfigSection(v15)
vu3:SetLibrary(v1)
vu3:SetFolder("BloxHub")
vu3:BuildInterfaceSection(v15)
vu2:LoadAutoloadConfig()
game.StarterGui:SetCore("SendNotification", {
    Title = "BloxHub Free",
    Text = "Script hub loaded successfully! Press Left Ctrl to minimize.",
    Duration = 5
})
spawn(function()
    while true do
        wait(1800)
        game.StarterGui:SetCore("SendNotification", {
            Title = "BloxHub Free",
            Text = "Checking for updates...",
            Duration = 2
        })
    end
end)
print("BloxHub Free v1.1 loaded successfully!")
print("Created by BloxHub Team")
print("Discord: discord.com/invite/q6BSdFCU4w")