-- ⚽ LUA HUB ⚽ | 4 FITUR PERFECT | 100% WORKING
-- Infinite Stamina | Boost Speed | Fly | Infinite Jump
-- BY LUA HUB OR ahza_12310

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- ==================== MAIN HUB ====================

local Toggles = {
    Stamina = false,
    Speed = false,
    Fly = false,
    Jump = false
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "LuaHub"
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 300, 0, 300)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainFrame.Active = true
MainFrame.Draggable = true

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = MainFrame

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Parent = MainFrame
ScrollFrame.Size = UDim2.new(1, -20, 1, -100)
ScrollFrame.Position = UDim2.new(0, 10, 0, 70)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.ScrollBarThickness = 5
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 120)

local ListLayout = Instance.new("UIListLayout")
ListLayout.Parent = ScrollFrame
ListLayout.Padding = UDim.new(0, 8)
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "⚽ LUA HUB ✅"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.Position = UDim2.new(0, 0, 0, 10)

local VerifiedLabel = Instance.new("TextLabel")
VerifiedLabel.Parent = MainFrame
VerifiedLabel.Size = UDim2.new(1, 0, 0, 20)
VerifiedLabel.Position = UDim2.new(0, 0, 0, 55)
VerifiedLabel.BackgroundTransparency = 1
VerifiedLabel.Text = "🔓 NO KEY REQUIRED - ahza_12310"
VerifiedLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
VerifiedLabel.TextScaled = true
VerifiedLabel.Font = Enum.Font.Gotham

local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = MainFrame
CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(1, -45, 0, 10)
CloseBtn.Text = "✕"
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.TextScaled = true
CloseBtn.Font = Enum.Font.GothamBold

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Toggle Creator
local function CreateToggle(name, layoutOrder)
    local Frame = Instance.new("Frame")
    Frame.Parent = ScrollFrame
    Frame.Size = UDim2.new(1, 0, 0, 45)
    Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    Frame.LayoutOrder = layoutOrder
    
    local FCorner = Instance.new("UICorner")
    FCorner.CornerRadius = UDim.new(0, 8)
    FCorner.Parent = Frame
    
    local Label = Instance.new("TextLabel")
    Label.Parent = Frame
    Label.Size = UDim2.new(1, -80, 1, 0)
    Label.Position = UDim2.new(0, 15, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = Color3.new(1, 1, 1)
    Label.TextScaled = true
    Label.Font = Enum.Font.Gotham
    Label.TextXAlignment = Enum.TextXAlignment.Left
    
    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Parent = Frame
    ToggleBtn.Size = UDim2.new(0, 65, 0, 32)
    ToggleBtn.Position = UDim2.new(1, -75, 0.5, -16)
    ToggleBtn.Text = "OFF"
    ToggleBtn.TextColor3 = Color3.new(1, 1, 1)
    ToggleBtn.TextScaled = true
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
    ToggleBtn.Font = Enum.Font.GothamBold
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 6)
    BtnCorner.Parent = ToggleBtn
    
    local enabled = false
    ToggleBtn.MouseButton1Click:Connect(function()
        enabled = not enabled
        ToggleBtn.Text = enabled and "ON" or "OFF"
        ToggleBtn.BackgroundColor3 = enabled and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(180, 0, 0)
        
        if name == "Infinite Stamina" then Toggles.Stamina = enabled end
        if name == "Boost Speed" then Toggles.Speed = enabled end
        if name == "Fly" then Toggles.Fly = enabled end
        if name == "Infinite Jump" then Toggles.Jump = enabled end
    end)
end

CreateToggle("Infinite Stamina", 1)
CreateToggle("Boost Speed", 2)
CreateToggle("Fly", 3)
CreateToggle("Infinite Jump", 4)

ListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, ListLayout.AbsoluteContentSize.Y + 20)
end)

-- ==================== FEATURES ====================

RunService.Heartbeat:Connect(function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        local hum = char.Humanoid
        if Toggles.Speed or Toggles.Stamina then
            hum.WalkSpeed = 65
        end
    end
end)

UserInputService.JumpRequest:Connect(function()
    if Toggles.Jump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- Fly System
local FlyVelocity = nil
local Keys = {W = false, A = false, S = false, D = false, Space = false, Shift = false}

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.W then Keys.W = true
    elseif input.KeyCode == Enum.KeyCode.A then Keys.A = true
    elseif input.KeyCode == Enum.KeyCode.S then Keys.S = true
    elseif input.KeyCode == Enum.KeyCode.D then Keys.D = true
    elseif input.KeyCode == Enum.KeyCode.Space then Keys.Space = true
    elseif input.KeyCode == Enum.KeyCode.LeftShift then Keys.Shift = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.W then Keys.W = false
    elseif input.KeyCode == Enum.KeyCode.A then Keys.A = false
    elseif input.KeyCode == Enum.KeyCode.S then Keys.S = false
    elseif input.KeyCode == Enum.KeyCode.D then Keys.D = false
    elseif input.KeyCode == Enum.KeyCode.Space then Keys.Space = false
    elseif input.KeyCode == Enum.KeyCode.LeftShift then Keys.Shift = false
    end
end)

RunService.Heartbeat:Connect(function()
    if Toggles.Fly and LocalPlayer.Character then
        local root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if root then
            if not FlyVelocity then
                FlyVelocity = Instance.new("BodyVelocity")
                FlyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
                FlyVelocity.Velocity = Vector3.new(0, 0, 0)
                FlyVelocity.Parent = root
            end
            
            local cam = workspace.CurrentCamera
            local move = Vector3.new(0, 0, 0)
            
            if Keys.W then move = move + cam.CFrame.LookVector end
            if Keys.S then move = move - cam.CFrame.LookVector end
            if Keys.A then move = move - cam.CFrame.RightVector end
            if Keys.D then move = move + cam.CFrame.RightVector end
            if Keys.Space then move = move + Vector3.new(0, 1, 0) end
            if Keys.Shift then move = move - Vector3.new(0, 1, 0) end
            
            FlyVelocity.Velocity = move.Unit * 45
        end
    else
        if FlyVelocity then
            FlyVelocity:Destroy()
            FlyVelocity = nil
        end
    end
end)

-- Success Notification
game.StarterGui:SetCore("SendNotification", {
    Title = "⚽ LUA HUB";
    Text = "✅ Script Loaded Successfully! All features unlocked.";
    Duration = 5;
})

print("⚽ LUA HUB loaded successfully - No key required!")
