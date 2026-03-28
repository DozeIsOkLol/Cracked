-- [[ 👑 HUMANOID PREMIUM V4.3 - KEY REMOVED ]] --

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

-- Settings
_G.Aimbot = false
_G.ESP = false
_G.Chams = false
_G.AntiBan = false
_G.Bypass = false
_G.AimKey = Enum.UserInputType.MouseButton2 
_G.Sens = 0.15

-- [[ 🎬 INTRO ANIMATION ]] --
local IntroGui = Instance.new("ScreenGui", CoreGui)
local IntroFrame = Instance.new("Frame", IntroGui)
IntroFrame.Size = UDim2.new(0, 350, 0, 150)
IntroFrame.Position = UDim2.new(0.5, -175, 0.5, -75)
IntroFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
IntroFrame.BackgroundTransparency = 1
IntroFrame.BorderSizePixel = 0
Instance.new("UICorner", IntroFrame).CornerRadius = UDim.new(0, 15)

local IntroStroke = Instance.new("UIStroke", IntroFrame)
IntroStroke.Color = Color3.fromRGB(255, 0, 0)
IntroStroke.Thickness = 2
IntroStroke.Transparency = 1

local IntroText = Instance.new("TextLabel", IntroFrame)
IntroText.Size = UDim2.new(1, 0, 1, 0)
IntroText.BackgroundTransparency = 1
IntroText.Text = "HUMANOID DEVELOPMENT\nPREMIUM EDITION\nVERSION 4.3 PRIVATE"
IntroText.TextColor3 = Color3.new(1, 1, 1)
IntroText.Font = Enum.Font.GothamBold
IntroText.TextSize = 18
IntroText.TextTransparency = 1

task.spawn(function()
    TweenService:Create(IntroFrame, TweenInfo.new(1), {BackgroundTransparency = 0.1}):Play()
    TweenService:Create(IntroStroke, TweenInfo.new(1), {Transparency = 0}):Play()
    TweenService:Create(IntroText, TweenInfo.new(1.5), {TextTransparency = 0}):Play()
    task.wait(3.5)
    TweenService:Create(IntroText, TweenInfo.new(1), {TextTransparency = 1}):Play()
    TweenService:Create(IntroFrame, TweenInfo.new(1.5), {BackgroundTransparency = 1}):Play()
    TweenService:Create(IntroStroke, TweenInfo.new(1.5), {Transparency = 1}):Play()
    task.wait(1.5)
    IntroGui:Destroy()
end)

-- [[ 🛠️ MAIN MENU ]] --
local ScreenGui = Instance.new("ScreenGui", CoreGui)
local Main = Instance.new("Frame", ScreenGui)
Main.Name = "HumanoidPanel"
Main.Size = UDim2.new(0, 230, 0, 400)
Main.Position = UDim2.new(0.05, 0, 0.3, 0)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Visible = true  -- Shows immediately

local Corner = Instance.new("UICorner", Main); Corner.CornerRadius = UDim.new(0, 10)
local Border = Instance.new("UIStroke", Main); Border.Color = Color3.fromRGB(255, 0, 0); Border.Thickness = 1.5

local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, 0, 0, 45); Header.BackgroundColor3 = Color3.fromRGB(20, 20, 20); Header.BorderSizePixel = 0
local HeaderCorner = Instance.new("UICorner", Header); HeaderCorner.CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1, 0, 1, 0); Title.BackgroundTransparency = 1
Title.Text = "HUMANOID PREMIUM"; Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold; Title.TextSize = 16

local function CreateToggle(text, pos, varName, isBypass)
    local Btn = Instance.new("TextButton", Main)
    Btn.Size = UDim2.new(0, 190, 0, 35); Btn.Position = UDim2.new(0.5, -95, 0, pos)
    Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Btn.Text = text .. ": DISABLED"
    Btn.TextColor3 = Color3.new(1, 1, 1); Btn.Font = Enum.Font.GothamBold; Btn.TextSize = 11
    local BtnCorner = Instance.new("UICorner", Btn); BtnCorner.CornerRadius = UDim.new(0, 6)
    
    Btn.MouseButton1Click:Connect(function()
        _G[varName] = not _G[varName]
        Btn.Text = text .. ": " .. (_G[varName] and "ACTIVE" or "DISABLED")
        Btn.BackgroundColor3 = _G[varName] and Color3.fromRGB(40, 120, 40) or Color3.fromRGB(30, 30, 30)
        
        if isBypass and _G[varName] then
            pcall(function()
                local mt = getrawmetatable(game)
                setreadonly(mt, false)
                local old = mt.__namecall
                mt.__namecall = newcclosure(function(self, ...)
                    if getnamecallmethod() == "Kick" then return nil end
                    return old(self, ...)
                end)
            end)
        end
    end)
end

-- Aim Key Changer
local IsChangingKey = false
local KeyBtn = Instance.new("TextButton", Main)
KeyBtn.Size = UDim2.new(0, 190, 0, 35); KeyBtn.Position = UDim2.new(0.5, -95, 0, 285)
KeyBtn.BackgroundColor3 = Color3.fromRGB(50, 20, 20)
KeyBtn.Text = "AIM KEY: MouseButton2"
KeyBtn.TextColor3 = Color3.new(1, 1, 1); KeyBtn.Font = Enum.Font.GothamBold; KeyBtn.TextSize = 11
Instance.new("UICorner", KeyBtn).CornerRadius = UDim.new(0, 6)

KeyBtn.MouseButton1Click:Connect(function()
    IsChangingKey = true
    KeyBtn.Text = "PRESS ANY KEY..."
end)

UIS.InputBegan:Connect(function(input)
    if IsChangingKey then
        if input.UserInputType == Enum.UserInputType.Keyboard then
            _G.AimKey = input.KeyCode
            KeyBtn.Text = "AIM KEY: " .. tostring(input.KeyCode.Name)
        elseif input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
            _G.AimKey = input.UserInputType
            KeyBtn.Text = "AIM KEY: " .. tostring(input.UserInputType.Name)
        end
        IsChangingKey = false
    end
end)

-- Create Toggles
CreateToggle("AIMBOT (MASTER)", 60, "Aimbot")
CreateToggle("PLAYER ESP", 105, "ESP")
CreateToggle("PLAYER CHAMS", 150, "Chams")
CreateToggle("KICK BYPASS", 195, "Bypass", true)
CreateToggle("ANTI-BAN LOOP", 240, "AntiBan")

local Footer = Instance.new("TextLabel", Main)
Footer.Size = UDim2.new(1, 0, 0, 40); Footer.Position = UDim2.new(0, 0, 1, -45)
Footer.Text = "INSERT: MENU | KEYBIND: SET CUSTOM\nDEVELOPED BY HUMANOID"
Footer.TextColor3 = Color3.fromRGB(100, 100, 100); Footer.TextSize = 9; Footer.BackgroundTransparency = 1; Footer.Font = Enum.Font.Gotham

-- [[ 🎯 MAIN ENGINE ]] --
local function GetTarget()
    local target, dist = nil, math.huge
    local mouse = UIS:GetMouseLocation()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
            local hum = p.Character:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 then
                local head = p.Character.Head
                local pos, vis = Camera:WorldToViewportPoint(head.Position)
                if vis then
                    local mag = (Vector2.new(pos.X, pos.Y) - mouse).Magnitude
                    if mag < dist then 
                        target = head
                        dist = mag 
                    end
                end
            end
        end
    end
    return target
end

RunService.RenderStepped:Connect(function()
    local isPressed = false
    if _G.AimKey.Name:find("MouseButton") then
        isPressed = UIS:IsMouseButtonPressed(_G.AimKey)
    else
        isPressed = UIS:IsKeyDown(_G.AimKey)
    end

    if _G.Aimbot and isPressed then
        local target = GetTarget()
        if target then
            Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, target.Position), _G.Sens)
        end
    end

    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local char = p.Character
            local hl = char:FindFirstChild("HumanoidChams")
            
            if _G.Chams then
                if not hl then
                    hl = Instance.new("Highlight", char)
                    hl.Name = "HumanoidChams"
                    hl.FillColor = Color3.fromRGB(255, 0, 0)
                    hl.FillTransparency = 0.5
                    hl.DepthMode = "AlwaysOnTop"
                end
            elseif hl then 
                hl:Destroy() 
            end
            
            local head = char:FindFirstChild("Head")
            if head then
                local tag = head:FindFirstChild("HumanoidTag")
                if _G.ESP then
                    if not tag then
                        tag = Instance.new("BillboardGui", head)
                        tag.Name = "HumanoidTag"
                        tag.AlwaysOnTop = true
                        tag.Size = UDim2.new(0, 50, 0, 8)
                        tag.StudsOffset = Vector3.new(0, 3, 0)
                        
                        local b = Instance.new("Frame", tag)
                        b.Size = UDim2.new(1, 0, 1, 0)
                        b.BackgroundColor3 = Color3.new(0,0,0)
                        
                        local f = Instance.new("Frame", b)
                        f.Name = "Fill"
                        f.Size = UDim2.new(1,0,1,0)
                        f.BackgroundColor3 = Color3.new(0,1,0)
                        f.BorderSizePixel = 0
                        
                        Instance.new("UICorner", b)
                        Instance.new("UICorner", f)
                    end
                    
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum then 
                        tag.Frame.Fill.Size = UDim2.new(hum.Health/hum.MaxHealth, 0, 1, 0) 
                    end
                elseif tag then 
                    tag:Destroy() 
                end
            end
        end
    end
end)

-- Toggle Menu with INSERT
UIS.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.Insert then 
        Main.Visible = not Main.Visible 
    end
end)

print("✅ HUMANOID PREMIUM V4.3 Loaded Successfully (Key system removed)")
