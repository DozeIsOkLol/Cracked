-- ⚽ LUA HUB ⚽ | 4 FITUR PERFECT | 100% WORKING
-- Infinite Stamina | Boost Speed | Fly | Infinite Jump
-- BY LUA HUB OR ahza_12310
-- KEY: thankyouforscript

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- LINK URL DAN CORRECT KEY
local LINK_URL = "https://link-center.net/3757213/4TEAwxbFdNls"
local CORRECT_KEY = "thankyouforscript"
local keyVerified = false

-- AUTO COPY LINK
setclipboard(LINK_URL)
print("🔗 Link copied to clipboard: " .. LINK_URL)

-- KEY INPUT GUI (TAMPIL DULUAN)
local KeyGui = Instance.new("ScreenGui")
KeyGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
KeyGui.Name = "LuaHubKey"
KeyGui.ResetOnSpawn = false

local KeyFrame = Instance.new("Frame")
KeyFrame.Parent = KeyGui
KeyFrame.Size = UDim2.new(0, 420, 0, 260)
KeyFrame.Position = UDim2.new(0.5, -210, 0.5, -130)
KeyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
KeyFrame.Active = true
KeyFrame.Draggable = true
KeyFrame.BorderSizePixel = 0

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 16)
KeyCorner.Parent = KeyFrame

-- Shine effect
local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 45)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(25, 25, 40)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 30))
}
Gradient.Rotation = 45
Gradient.Parent = KeyFrame

-- Logo
local Logo = Instance.new("TextLabel")
Logo.Parent = KeyFrame
Logo.Size = UDim2.new(1, 0, 0, 80)
Logo.Position = UDim2.new(0, 0, 0, 10)
Logo.BackgroundTransparency = 1
Logo.Text = "🔐 LUA HUB KEY"
Logo.TextColor3 = Color3.fromRGB(70, 210, 255)
Logo.TextScaled = true
Logo.Font = Enum.Font.GothamBold

-- Roblox Follow Info
local FollowLabel = Instance.new("TextLabel")
FollowLabel.Parent = KeyFrame
FollowLabel.Size = UDim2.new(1, -40, 0, 50)
FollowLabel.Position = UDim2.new(0, 20, 0, 85)
FollowLabel.BackgroundTransparency = 1
FollowLabel.Text = "BY LUA HUB OR ahza_12310"
FollowLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
FollowLabel.TextScaled = true
FollowLabel.Font = Enum.Font.Gotham
FollowLabel.TextSize = 14

-- Key Input Box
local KeyInput = Instance.new("TextBox")
KeyInput.Parent = KeyFrame
KeyInput.Size = UDim2.new(0.6, 0, 0, 45)
KeyInput.Position = UDim2.new(0.06, 0, 0, 145)
KeyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
KeyInput.Text = ""
KeyInput.PlaceholderText = "Masukkan key dari web..."
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextScaled = true
KeyInput.Font = Enum.Font.GothamBold

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 10)
InputCorner.Parent = KeyInput

-- COPY BUTTON (BARU DITAMBAHKAN)
local CopyBtn = Instance.new("TextButton")
CopyBtn.Parent = KeyFrame
CopyBtn.Size = UDim2.new(0, 70, 0, 45)
CopyBtn.Position = UDim2.new(0.68, 0, 0, 145)
CopyBtn.Text = "📋 COPY"
CopyBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
CopyBtn.TextColor3 = Color3.new(1, 1, 1)
CopyBtn.TextScaled = true
CopyBtn.Font = Enum.Font.GothamBold

local CopyCorner = Instance.new("UICorner")
CopyCorner.CornerRadius = UDim.new(0, 10)
CopyCorner.Parent = CopyBtn

CopyBtn.MouseButton1Click:Connect(function()
    setclipboard(LINK_URL)
    CopyBtn.Text = "✅ COPIED!"
    CopyBtn.BackgroundColor3 = Color3.fromRGB(0, 220, 0)
    wait(1)
    CopyBtn.Text = "📋 COPY"
    CopyBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
end)

-- Submit Button (posisi disesuaikan)
local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Parent = KeyFrame
SubmitBtn.Size = UDim2.new(0.88, 0, 0, 50)
SubmitBtn.Position = UDim2.new(0.06, 0, 0, 200)
SubmitBtn.Text = "🔑 VERIFY KEY"
SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
SubmitBtn.TextColor3 = Color3.new(1, 1, 1)
SubmitBtn.TextScaled = true
SubmitBtn.Font = Enum.Font.GothamBold

local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0, 10)
SubmitCorner.Parent = SubmitBtn

-- Status Label
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = KeyFrame
StatusLabel.Size = UDim2.new(1, -20, 0, 30)
StatusLabel.Position = UDim2.new(0, 10, 1, -30)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Link auto copied! Klik COPY untuk copy lagi"
StatusLabel.TextColor3 = Color3.fromRGB(150, 150, 170)
StatusLabel.TextScaled = true
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 12

-- KEY VERIFICATION
SubmitBtn.MouseButton1Click:Connect(function()
    local inputKey = KeyInput.Text
    
    if inputKey == CORRECT_KEY then
        keyVerified = true
        KeyGui:Destroy()
        wait(0.5)
        loadMainHub() -- Load main hub setelah verifikasi
    else
        KeyInput.Text = ""
        KeyInput.PlaceholderText = "❌ KEY SALAH! Coba lagi"
        StatusLabel.Text = "Key salah! Ambil dari web resmi"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        wait(2)
        KeyInput.PlaceholderText = "Masukkan key dari web..."
        StatusLabel.Text = "Link auto copied! Klik COPY untuk copy lagi"
        StatusLabel.TextColor3 = Color3.fromRGB(150, 150, 170)
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    end
end)

-- Enter key support
KeyInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        SubmitBtn.MouseButton1Click:Fire()
    end
end)

-- MAIN HUB FUNCTION (BARU DIPANGGIL SETELAH KEY BENAR)
function loadMainHub()
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
    VerifiedLabel.Text = "🔓 KEY VERIFIED - ahza_12310"
    VerifiedLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    VerifiedLabel.TextScaled = true
    VerifiedLabel.Font = Enum.Font.Gotham
    VerifiedLabel.TextSize = 12

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

    -- Toggle Function (sama kayak sebelumnya)
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

    -- ALL FEATURES (sama kayak sebelumnya - 100% working)
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
        Text = "🔓 Verified by ahza_12310 - All features unlocked!";
        Duration = 5;
    })
end

print("🔐 LUA HUB - Key required! Visit web for key.")
