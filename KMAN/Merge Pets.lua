--[[
    Deobfuscated Source Code
    Original script by: TGMANKASKE
    Functionality: Provides a cheat GUI for a game with features for infinite spins, money, and rebirths.
]]

--================================================================================
--// SETUP & GUI LIBRARY
--================================================================================

-- Load the "wizard" UI library from its source.
-- This is a common practice for script GUIs to keep the code cleaner.
local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/blodbal/--back-ups-for-libs/main/wizard"))()

-- Create the main window for the cheat panel.
local Window = Lib:NewWindow("Script")

--================================================================================
--// UI CREATION: LINKS & CREDITS
--================================================================================

-- Create a new section in the window for social links.
local LinksSection = Window:NewSection("Links")

-- Add a button that copies a Discord invite link to the clipboard.
LinksSection:CreateButton("Discord Group", function()
    if toclipboard and setclipboard then
        setclipboard("https://discord.gg/8A6k7s3JqCMD")
    end
    print("Copied Discord link!") -- Custom message added for clarity
end)

-- Add a button that copies a YouTube channel link to the clipboard.
LinksSection:CreateButton("Youtube", function()
    if toclipboard and setclipboard then
        setclipboard("https://www.youtube.com/@TGMANKASKE")
    end
    print("Copied YouTube link!") -- Custom message added for clarity
end)

-- Add a section to display the script's credits.
local CreditsSection = Window:NewSection("Credits: TGMANKASKE")

--================================================================================
--// UI CREATION & CHEAT LOGIC
--================================================================================

-- Create the main section for the cheat functions.
local MainSection = Window:NewSection("Main")

-- Create a toggle button for "Get Spins Rewards" (Infinite Spins).
MainSection:CreateToggle("Get Spins Rewards", function(state)
    -- Use a global variable to control the loop from outside the function.
    getgenv().spins = state

    -- Start a loop that runs as long as the toggle is active.
    while getgenv().spins do
        -- Find the remote event responsible for wheel spins.
        local spinEvent = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SpinWheelPrizeEvent")

        -- Fire the event to the server to claim spin rewards repeatedly.
        -- The table contains dummy arguments that the server might expect.
        spinEvent:FireServer(unpack({ [1] = "Spins", [2] = "Spins", [3] = "Spins", [4] = "Spins" }))

        -- Wait for a short duration to prevent the game from crashing or lagging.
        wait()
    end
end)

-- Create a toggle button for "Inf. Money".
MainSection:CreateToggle("Inf. Money", function(state)
    getgenv().money = state
    while getgenv().money do
        -- Find the remote event for getting cash.
        local cashEvent = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GiveCashEvent")

        -- Fire the event with a very large number to get money.
        cashEvent:FireServer(unpack({ [1] = 9e9, [2] = 9e9, [3] = 9e9, [4] = 9e9 }))

        wait()
    end
end)

-- Create a toggle button for "Inf. Rebirth".
MainSection:CreateToggle("Inf. Rebirth", function(state)
    getgenv().rebirth = state
    while getgenv().rebirth do
        -- Find the remote event for confirming a rebirth.
        local rebirthEvent = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RebirthConfirmEvent")

        -- Fire the event to perform rebirths automatically.
        rebirthEvent:FireServer(unpack({ [1] = 1, [2] = 1, [3] = 1, [4] = 1 }))

        wait()
    end
end)
