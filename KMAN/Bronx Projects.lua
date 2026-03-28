--[[
    Deobfuscated Source Code
    Original script by: TGMANKASKE
    Functionality: A cheat GUI for a game, providing infinite money, wins, and a specific weapon.
]]

--================================================================================
--// SETUP & GUI LIBRARY
--================================================================================

-- Load the "wizard" UI library from its source on GitHub.
local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/blodbal/--back-ups-for-libs/main/wizard"))()

-- Create the main window for the cheat panel, titled "Script".
local Window = Lib:NewWindow("Script")

--================================================================================
--// UI CREATION: LINKS & CREDITS
--================================================================================

-- Create a new section in the window for social links and other information.
local LinksSection = Window:NewSection("Links")

-- Add a button that copies the creator's Discord group link to the user's clipboard.
LinksSection:CreateButton("Discord Group", function()
    -- Check if the clipboard functions are available in the executor.
    if toclipboard and setclipboard then
        setclipboard("https://discord.gg/8A6k7s3JqCMD")
    end
end)

-- Add a button that copies the creator's YouTube channel link to the clipboard.
LinksSection:CreateButton("Youtube", function()
    if toclipboard and setclipboard then
        setclipboard("https://www.youtube.com/@TGMANKASKE")
    end
end)

-- Create a section to display the script's credits.
local CreditsSection = Window:NewSection("Credits: TGMANKASKE")

--================================================================================
--// UI CREATION & CHEAT LOGIC
--================================================================================

-- Create the main section where the cheat functions will be located.
local MainSection = Window:NewSection("Main")

--[[
    Toggle for Infinite Money.
    When activated, it repeatedly fires a remote event to grant the player a large sum of cash.
]]
MainSection:CreateToggle("Inf. Money", function(state)
    getgenv().money = state -- Use a global variable to control the loop.
    while getgenv().money do
        -- The arguments are likely dummy values, with the server only checking that the event was fired.
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer(unpack({
            [1] = 80,
            [2] = 80,
            [3] = 80,
            [4] = 80
        }))

        -- Fire a second event, which might be the primary cash-giving function.
        game:GetService("ReplicatedStorage").Remotes.GiveCashEvent:FireServer(unpack({
            [1] = 9000000000, -- A very large number
            [2] = 9000000000,
            [3] = 9000000000,
            [4] = 9000000000
        }))
        wait() -- Wait briefly to avoid crashing.
    end
end)

--[[
    Toggle for getting a Glock 23.
    When activated, it repeatedly fires the reward event with the weapon name.
]]
MainSection:CreateToggle("Get Glock 23", function(state)
    getgenv().Glock23 = state
    while getgenv().Glock23 do
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer(unpack({
            [1] = "Glock 23"
        }))
        wait(0.3) -- A slightly longer wait, as this might be a one-time reward.
    end
end)

--[[
    Toggle for getting infinite wins.
    When activated, it sends various reward types to the server.
]]
MainSection:CreateToggle("Get Wins", function(state)
    getgenv().wins = state
    while getgenv().wins do
        -- Fires the reward event with several different prize types.
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer(unpack({
            [1] = "Gems",
            [2] = "Gems",
            [3] = "Gems",
            [4] = "Gems"
        }))
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer(unpack({
            [1] = "Spins",
            [2] = "Spins",
            [3] = "Spins",
            [4] = "Spins"
        }))
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer(unpack({
            [1] = "Wins",
            [2] = "Wins",
            [3] = "Wins",
            [4] = "Wins"
        }))
        wait()
    end
end)
