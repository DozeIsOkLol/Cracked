-- [[ 👑 HUMANOID PREMIUM V13 - STABLE & FAST (KEY REMOVED) ]] --

local LP = game:GetService("Players").LocalPlayer
local UIS = game:GetService("UserInputService")
local VIM = game:GetService("VirtualInputManager")
local PlayerGui = LP:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")

-- Ayarlar
_G.AutoClick = false
_G.BypassActive = false
_G.FlyActive = false
_G.FlySpeed = 50

-- [[ 🛡️ BYPASS STATUS (SOL ÜST) ]] --
if PlayerGui:FindFirstChild("HumanoidStatus") then PlayerGui.HumanoidStatus:Destroy() end
local statusSg = Instance.new("ScreenGui", PlayerGui)
statusSg.Name = "HumanoidStatus"
local statusFrame = Instance.new("Frame", statusSg)
statusFrame.Size = UDim2.new(0, 200, 0, 40)
statusFrame.Position = UDim2.new(0, 10, 0, 10)
statusFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
statusFrame.BackgroundTransparency = 0.3
Instance.new("UICorner", statusFrame)
local statusLabel = Instance.new("TextLabel", statusFrame)
statusLabel.Size = UDim2.new(1, 0, 1, 0)
statusLabel.Text = "🛡️ BYPASS: DISABLED"
statusLabel.TextColor3 = Color3.fromRGB(255, 60, 60)
statusLabel.Font = "GothamBold"
statusLabel.TextSize = 14
statusLabel.BackgroundTransparency = 1

-- [[ 🖱️ AUTO CLICK MAKRON ]] --
task.spawn(function()
    while true do
        if _G.AutoClick then
            VIM:SendMouseButtonEvent(0, 0, 0, true, game, 0)
            VIM:SendMouseButtonEvent(0, 0, 0, false, game, 0)
        end
        task.wait(0.01)
    end
end)

-- [[ 🚀 FLY SYSTEM ]] --
local function ToggleFly()
    _G.FlyActive = not _G.FlyActive
    local char = LP.Character or LP.CharacterAdded:Wait()
    local root = char:WaitForChild("HumanoidRootPart")
    
    if _G.FlyActive then
        local bg = Instance.new("BodyGyro", root)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.Name = "H_FlyGyro"
        
        local bv = Instance.new("BodyVelocity", root)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        bv.Name = "H_FlyVel"
        
        task.spawn(function()
            while _G.FlyActive do
                RunService.RenderStepped:Wait()
                bv.velocity = workspace.CurrentCamera.CFrame.LookVector * _G.FlySpeed
                bg.cframe = workspace.CurrentCamera.CFrame
            end
            if bg then bg:Destroy() end
            if bv then bv:Destroy() end
        end)
    end
end

-- [[ 🛠️ PREMIUM MENU ]] --
if PlayerGui:FindFirstChild("HumanoidMenuV13") then PlayerGui.HumanoidMenuV13:Destroy() end
local mainSg = Instance.new("ScreenGui", PlayerGui)
mainSg.Name = "HumanoidMenuV13"

local main = Instance.new("Frame", mainSg)
main.Size = UDim2.new(0, 320, 0, 300)
main.Position = UDim2.new(0.5, -160, 0.4, 0)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
main.Active = true
main.Draggable = true
Instance.new("UICorner", main)

-- Title
local premiumTitle = Instance.new("TextLabel", main)
premiumTitle.Size = UDim2.new(1, 0, 0, 40)
premiumTitle.Position = UDim2.new(0, 0, 0, 5)
premiumTitle.Text = "👑 HUMANOID PREMIUM"
premiumTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
premiumTitle.Font = "GothamBold"
premiumTitle.TextSize = 18
premiumTitle.BackgroundTransparency = 1

-- Tab Buttons
local tabs = Instance.new("Frame", main)
tabs.Size = UDim2.new(1, 0, 0, 45)
tabs.Position = UDim2.new(0, 0, 0, 45)
tabs.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
Instance.new("UICorner", tabs)

local btnMain = Instance.new("TextButton", tabs)
btnMain.Size = UDim2.new(0.5, 0, 1, 0)
btnMain.Text = "MAIN"
btnMain.TextColor3 = Color3.new(1,1,1)
btnMain.Font = "GothamBold"
btnMain.BackgroundTransparency = 1

local btnFly = Instance.new("TextButton", tabs)
btnFly.Size = UDim2.new(0.5, 0, 1, 0)
btnFly.Position = UDim2.new(0.5, 0, 0, 0)
btnFly.Text = "FLY SETTINGS"
btnFly.TextColor3 = Color3.new(1,1,1)
btnFly.Font = "GothamBold"
btnFly.BackgroundTransparency = 1

-- Pages
local pMain = Instance.new("Frame", main)
pMain.Size = UDim2.new(1, 0, 0.7, 0)
pMain.Position = UDim2.new(0, 0, 0.3, 0)
pMain.BackgroundTransparency = 1

local pFly = Instance.new("Frame", main)
pFly.Size = UDim2.new(1, 0, 0.7, 0)
pFly.Position = UDim2.new(0, 0, 0.3, 0)
pFly.BackgroundTransparency = 1
pFly.Visible = false

local function createB(txt, pos, parent)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(0.85, 0, 0, 40)
    b.Position = pos
    b.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    b.Text = txt
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = "GothamBold"
    Instance.new("UICorner", b)
    return b
end

local cBtn = createB("AUTO CLICK (T): OFF", UDim2.new(0.075, 0, 0.1, 0), pMain)
local bBtn = createB("ENABLE BYPASS", UDim2.new(0.075, 0, 0.35, 0), pMain)
local fBtn = createB("FLY MODE: OFF", UDim2.new(0.075, 0, 0.1, 0), pFly)

local sBox = Instance.new("TextBox", pFly)
sBox.Size = UDim2.new(0.85, 0, 0, 40)
sBox.Position = UDim2.new(0.075, 0, 0.4, 0)
sBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
sBox.Text = "SPEED: 50"
sBox.TextColor3 = Color3.new(1,1,1)
sBox.Font = "GothamBold"
Instance.new("UICorner", sBox)

-- Visual Update Function
local function updateVisuals()
    cBtn.Text = "AUTO CLICK (T): " .. (_G.AutoClick and "ON" or "OFF")
    cBtn.BackgroundColor3 = _G.AutoClick and Color3.fromRGB(0, 150, 80) or Color3.fromRGB(40, 40, 50)
    
    fBtn.Text = "FLY MODE: " .. (_G.FlyActive and "ON" or "OFF")
    fBtn.BackgroundColor3 = _G.FlyActive and Color3.fromRGB(0, 100, 200) or Color3.fromRGB(40, 40, 50)
end

-- Tab Switching
btnMain.MouseButton1Click:Connect(function()
    pMain.Visible = true
    pFly.Visible = false
end)

btnFly.MouseButton1Click:Connect(function()
    pMain.Visible = false
    pFly.Visible = true
end)

-- Button Logic
cBtn.MouseButton1Click:Connect(function()
    _G.AutoClick = not _G.AutoClick
    updateVisuals()
end)

fBtn.MouseButton1Click:Connect(function()
    ToggleFly()
    updateVisuals()
end)

bBtn.MouseButton1Click:Connect(function()
    _G.BypassActive = not _G.BypassActive
    statusLabel.Text = _G.BypassActive and "🛡️ BYPASS: ENABLED" or "🛡️ BYPASS: DISABLED"
    statusLabel.TextColor3 = _G.BypassActive and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(255, 60, 60)
    
    if _G.BypassActive then
        LP.Idled:Connect(function()
            VIM:SendKeyEvent(true, "Space", false, game)
            task.wait()
            VIM:SendKeyEvent(false, "Space", false, game)
        end)
    end
end)

sBox.FocusLost:Connect(function()
    _G.FlySpeed = tonumber(sBox.Text:match("%d+")) or 50
    sBox.Text = "SPEED: " .. _G.FlySpeed
end)

-- Keybinds
UIS.InputBegan:Connect(function(i, c)
    if c then return end
    if i.KeyCode == Enum.KeyCode.T then 
        _G.AutoClick = not _G.AutoClick 
        updateVisuals()
    elseif i.KeyCode == Enum.KeyCode.Insert then 
        main.Visible = not main.Visible 
    end
end)

-- Show menu by default
main.Visible = true

print("👑 HUMANOID PREMIUM V13 LOADED! (Key system removed)")
