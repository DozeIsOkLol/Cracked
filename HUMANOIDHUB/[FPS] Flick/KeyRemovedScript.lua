-- [[ HUMANOID HUB V6.4 - KEY REMOVED ]] --

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- [[ ⚙️ SETTINGS ]] --
_G.Aimbot = false
_G.ShowFOV = false
_G.AutoShoot = false
_G.WallCheck = false
_G.AimbotFOV = 150
_G.Sens = 0.15
_G.ESPColor = Color3.fromRGB(255, 0, 0)
_G.BoxESP = false
_G.ShowDistance = false

-- [[ FOV CIRCLE ]] --
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 1.5
FOVCircle.Color = Color3.new(1, 1, 1)
FOVCircle.Transparency = 0.8
FOVCircle.Filled = false
FOVCircle.Visible = false

-- [[ WALLCHECK ]] --
local function IsVisible(targetPart, character)
    if not _G.WallCheck then return true end
    local rayParams = RaycastParams.new()
    rayParams.FilterType = Enum.RaycastFilterType.Exclude
    rayParams.FilterDescendantsInstances = {LocalPlayer.Character, character, Camera}
    local result = workspace:Raycast(Camera.CFrame.Position, (targetPart.Position - Camera.CFrame.Position), rayParams)
    return result == nil
end

-- [[ MAIN GUI ]] --
local ScreenGui = Instance.new("ScreenGui", CoreGui)
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 600, 0, 420)
Main.Position = UDim2.new(0.5, -300, 0.5, -210)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BackgroundTransparency = 0.2
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)

local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Color = Color3.new(1,1,1)
MainStroke.Transparency = 0.8
MainStroke.Thickness = 1.2

local Sidebar = Instance.new("Frame", Main)
Sidebar.Size = UDim2.new(0, 160, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Sidebar.BackgroundTransparency = 0.3
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 12)

local TabContainer = Instance.new("Frame", Main)
TabContainer.Size = UDim2.new(1, -170, 1, -20)
TabContainer.Position = UDim2.new(0, 165, 0, 10)
TabContainer.BackgroundTransparency = 1

local Info = Instance.new("TextLabel", Sidebar)
Info.Size = UDim2.new(1, 0, 0, 30)
Info.Position = UDim2.new(0, 0, 1, -35)
Info.Text = "Press INSERT to Toggle"
Info.TextColor3 = Color3.fromRGB(100, 100, 100)
Info.Font = Enum.Font.Gotham
Info.TextSize = 10
Info.BackgroundTransparency = 1

local function CreatePage()
    local Page = Instance.new("ScrollingFrame", TabContainer)
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.Visible = false
    Page.ScrollBarThickness = 0
    Instance.new("UIListLayout", Page).Padding = UDim.new(0, 8)
    return Page
end

local CombatPage = CreatePage()
CombatPage.Visible = true
local VisualPage = CreatePage()

local function CreateToggle(parent, title, varName)
    local Frame = Instance.new("TextButton", parent)
    Frame.Size = UDim2.new(1, -5, 0, 40)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Frame.BackgroundTransparency = 0.5
    Frame.Text = ""
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 8)

    local Txt = Instance.new("TextLabel", Frame)
    Txt.Text = "  " .. title
    Txt.Size = UDim2.new(1, 0, 1, 0)
    Txt.TextColor3 = Color3.new(1,1,1)
    Txt.Font = Enum.Font.GothamSemibold
    Txt.TextSize = 12
    Txt.BackgroundTransparency = 1
    Txt.TextXAlignment = "Left"

    local Sw = Instance.new("Frame", Frame)
    Sw.Size = UDim2.new(0, 30, 0, 15)
    Sw.Position = UDim2.new(1, -40, 0.5, -7)
    Sw.BackgroundColor3 = _G[varName] and Color3.fromRGB(0, 120, 255) or Color3.fromRGB(60, 60, 60)
    Instance.new("UICorner", Sw).CornerRadius = UDim.new(1, 0)

    local C = Instance.new("Frame", Sw)
    C.Size = UDim2.new(0, 12, 0, 12)
    C.Position = _G[varName] and UDim2.new(1, -14, 0.5, -6) or UDim2.new(0, 2, 0.5, -6)
    C.BackgroundColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", C).CornerRadius = UDim.new(1, 0)

    Frame.MouseButton1Click:Connect(function()
        _G[varName] = not _G[varName]
        TweenService:Create(C, TweenInfo.new(0.2), {Position = _G[varName] and UDim2.new(1, -14, 0.5, -6) or UDim2.new(0, 2, 0.5, -6)}):Play()
        TweenService:Create(Sw, TweenInfo.new(0.2), {BackgroundColor3 = _G[varName] and Color3.fromRGB(0, 120, 255) or Color3.fromRGB(60, 60, 60)}):Play()
    end)
end

-- Create Toggles
CreateToggle(CombatPage, "Aimbot Master", "Aimbot")
CreateToggle(CombatPage, "Show FOV Circle", "ShowFOV")
CreateToggle(CombatPage, "Auto Shoot (Fixed)", "AutoShoot")
CreateToggle(CombatPage, "Wall Check (Legit)", "WallCheck")
CreateToggle(VisualPage, "Box ESP", "BoxESP")
CreateToggle(VisualPage, "Show Distance", "ShowDistance")

local function GetTarget()
    local t, d = nil, _G.AimbotFOV
    local mousePos = UIS:GetMouseLocation()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
            local hum = p.Character:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 then
                local head = p.Character.Head
                local pos, vis = Camera:WorldToViewportPoint(head.Position)
                if vis then
                    local mag = (Vector2.new(pos.X, pos.Y) - mousePos).Magnitude
                    if mag <= d and IsVisible(head, p.Character) then
                        t = head
                        d = mag
                    end
                end
            end
        end
    end
    return t
end

-- [[ RENDER LOOP ]] --
RunService.RenderStepped:Connect(function()
    FOVCircle.Visible = _G.ShowFOV and _G.Aimbot
    FOVCircle.Position = UIS:GetMouseLocation()
    FOVCircle.Radius = _G.AimbotFOV
    
    if _G.Aimbot then
        local target = GetTarget()
        if target then
            Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, target.Position), _G.Sens)
            if _G.AutoShoot then
                mouse1press()
                task.wait()
                mouse1release()
            end
        end
    end
end)

-- [[ ESP LOOP ]] --
task.spawn(function()
    while task.wait() do
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = p.Character.HumanoidRootPart
                local esp = hrp:FindFirstChild("HumanoidESP")
                
                if _G.BoxESP or _G.ShowDistance then
                    if not esp then
                        esp = Instance.new("BillboardGui", hrp)
                        esp.Name = "HumanoidESP"
                        esp.AlwaysOnTop = true
                        esp.Size = UDim2.new(4,0,5.5,0)
                        
                        local b = Instance.new("Frame", esp)
                        b.Size = UDim2.new(1,0,1,0)
                        b.BackgroundTransparency = 1
                        Instance.new("UIStroke", b).Thickness = 1.5
                        
                        local t = Instance.new("TextLabel", esp)
                        t.Size = UDim2.new(1,0,0,20)
                        t.Position = UDim2.new(0,0,-0.2,0)
                        t.BackgroundTransparency = 1
                        t.Font = Enum.Font.GothamBold
                        t.TextSize = 10
                    end
                    
                    esp.Enabled = true
                    esp.Frame.UIStroke.Color = _G.ESPColor
                    esp.Frame.Visible = _G.BoxESP
                    esp.TextLabel.Text = _G.ShowDistance and math.floor((hrp.Position - Camera.CFrame.Position).Magnitude).."m" or ""
                    esp.TextLabel.TextColor3 = _G.ESPColor
                elseif esp then
                    esp.Enabled = false
                end
            end
        end
    end
end)

-- [[ TAB SYSTEM ]] --
local function AddTab(name, page)
    local btn = Instance.new("TextButton", Sidebar)
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, 80 + (45 * (#Sidebar:GetChildren() - 2)))
    btn.BackgroundTransparency = 1
    btn.Text = "      " .. name
    btn.TextColor3 = Color3.fromRGB(150, 150, 150)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 13
    btn.TextXAlignment = "Left"
    Instance.new("UICorner", btn)
    
    btn.MouseButton1Click:Connect(function()
        for _, v in pairs(TabContainer:GetChildren()) do
            v.Visible = false
        end
        page.Visible = true
    end)
end

AddTab("Combat", CombatPage)
AddTab("Visuals", VisualPage)

-- [[ INSERT KEY TO TOGGLE MENU ]] --
UIS.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.Insert then
        Main.Visible = not Main.Visible
    end
end)

-- Show menu by default
Main.Visible = true

print("✅ HUMANOID HUB V6.4 Loaded Successfully (Key system removed)")
