--================================================================================
--// SETUP & GUI LIBRARY
--================================================================================

-- Load the "wizard" UI library from a public GitHub repository.
local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/blodbal/--back-ups-for-libs/main/wizard"))()

-- Create the main window for the cheat panel.
local Window = Lib:NewWindow("Script")

--================================================================================
--// UI CREATION & SCRIPT LOGIC
--================================================================================

-- Create a section for social links.
local LinksSection = Window:NewSection("Links")

-- Button to copy a Discord group invite link.
LinksSection:CreateButton("Discord Group", function()
    if toclipboard and setclipboard then
        setclipboard("https://discord.gg/8A6k7s3JqCMD")
    end
end)

-- Button to copy a YouTube channel link.
LinksSection:CreateButton("Youtube", function()
    if toclipboard and setclipboard then
        setclipboard("https://www.youtube.com/@TGMANKASKE")
    end
end)

-- Section to display credits for the script creator.
local CreditsSection = Window:NewSection("Credits: TGMANKASKE")

-- Main section for the cheat features.
local MainSection = Window:NewSection("Main")

-- Toggle for Infinite Coins.
MainSection:CreateToggle("Inf. Coins", function(state)
    getgenv().coins = state
    while getgenv().coins do
        -- Repeatedly fires a remote event to the server to claim rewards.
        game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Online"):WaitForChild("[C-S]GetReward"):FireServer(
            unpack({[1] = 900000, [2] = 900000, [3] = 900000, [4] = 900000, [5] = 900000})
        )
        
        -- Print a message (likely from the original script author for debugging).
        print("Give credit to KMAN | KontrolAl | TGMANKASKE")
        wait()
    end
end)

-- Button to get the best weapon in the game.
MainSection:CreateButton("Get BEST Weapon", function()
    -- Fires a remote event to buy an equipment named "Equipment28".
    game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Equipment"):WaitForChild("[C-S]TryToBuyEquipment"):FireServer(
        unpack({[1] = "Equipment28"})
    )
end)

-- Button to get a free pet.
MainSection:CreateButton("Get free pet", function()
    -- Fires the reward event, specifying "gem" as the reward type.
    -- This likely corresponds to a pet reward in the game's logic.
    game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Online"):WaitForChild("[C-S]GetReward"):FireServer(
        unpack({[1] = "gem"})
    )
end)

-- Toggle for Infinite Wins.
MainSection:CreateToggle("Inf. Wins", function(state)
    getgenv().wins = state
    while getgenv().wins do
        -- Fire a remote event to presumably register a win or claim win rewards.
        game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Online"):WaitForChild("[C-S]DefeatRewardEco"):FireServer(
            unpack({[1] = 900000, [2] = 900000, [3] = 900000, [4] = 900000, [5] = 900000})
        )
        
        -- Fire a second event, likely a confirmation or different type of reward.
        game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Eco"):FireServer(
            unpack({[1] = "ffEwgHh87tB N", [2] = "ffEwgHh87tB N"})
        )
        wait()
    end
end)
