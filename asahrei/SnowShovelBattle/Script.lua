if game.PlaceId ~= 127718588961610 then
    print("[oxblood] Stop Being Ret@rded.")
    return
end
print("[oxblood] Loaded For Snow Shovel Battle.")
print("[oxblood] If You Enjoyed This Script, Add @zt6h On Discord!")
local setupCompleted = false
local awaitingPetFill = false
local rebirthFrame = 0
local L = game:GetService("Players")
local P = L.LocalPlayer
local TS = game:GetService("TweenService")
local U = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local REP = game:GetService("ReplicatedStorage")
local Events = REP:WaitForChild("Event")
local PEV = REP:WaitForChild("PEV")
local S = Instance.new("ScreenGui", P.PlayerGui)
S.ResetOnSpawn = false
S.Name = "[oxblood]"
S.DisplayOrder = 999
local B = Instance.new("TextButton", S)
local C = Instance.new("UICorner", B)
local G = Instance.new("UIGradient", B)
local K = Instance.new("UIStroke", B)
local cR = Color3.fromRGB(120, 10, 10)
local cG = Color3.fromRGB(20, 80, 20)
B.Size = UDim2.new(0, 110, 0, 40)
B.Position = UDim2.new(0, 20, 0, 20)
B.Text = "OFF"
B.TextColor3 = Color3.new(1, 1, 1)
B.Font = Enum.Font.GothamBold
B.TextSize = 16
B.AutoButtonColor = false
B.BackgroundColor3 = cR
C.CornerRadius = UDim.new(0, 8)
K.Thickness = 2
K.Color = Color3.fromRGB(20, 20, 20)
K.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.Rotation = 45
G.Color = ColorSequence.new(Color3.new(1, 1, 1), Color3.new(0.4, 0.4, 0.4))
local T = false
local d = false
local m = false
local dS
local sP
local function setOn()
    if not setupCompleted then
        awaitingPetFill = false
    end
    B.Text = "ON"
    TS:Create(B, TweenInfo.new(0.3), {BackgroundColor3 = cG}):Play()
end
local function setOff()
    B.Text = "OFF"
    TS:Create(B, TweenInfo.new(0.3), {BackgroundColor3 = cR}):Play()
end
local function toggleState()
    T = not T
    if T then
        setOn()
    else
        setOff()
    end
end
local function doOneTimeSetup()
    local ls = P:FindFirstChild("leaderstats")
    local money = ls and ls:FindFirstChild("Money")
    local cashVal = money and money.Value or 0
    repeat
        task.wait(0.1)
        ls = P:FindFirstChild("leaderstats")
        money = ls and ls:FindFirstChild("Money")
        cashVal = money and money.Value or 0
    until cashVal > 99000000000000000000000
    local dp = workspace:FindFirstChild("DisplayPowers")
    if dp then
        for _, sh in ipairs(dp:GetChildren()) do
            Events:WaitForChild("BuyPower"):FireServer(sh.Name, 62500000)
        end
    end
    Events:WaitForChild("EquipEffect"):FireServer("Giantcane", P.Character)
    local petsFolder = P:FindFirstChild("Pets")
    if petsFolder then
        for _, pet in ipairs(petsFolder:GetChildren()) do
            PEV:WaitForChild("EQ"):FireServer(pet.Name)
        end
    end
    local enchantedList = {
        {600000, 0.15},
        {1200000, 0.15},
        {3750000, 0.15},
        {4500000, 0.15},
        {6000000, 0.15},
        {6750000, 0.15},
        {7500000, 0.15},
        {8250000, 0.15},
        {9000000, 0.15},
        {12000000, 0.15},
        {15000000, 0.15}
    }
    for _, data in ipairs(enchantedList) do
        Events:WaitForChild("Enchanted"):FireServer(unpack(data))
        task.wait(0.025)
    end
    setupCompleted = true
end
local function activeLoop()
    pcall(
        function()
            local ls = P:FindFirstChild("leaderstats")
            if ls then
                Events:FindFirstChild("Train"):FireServer(1000000000000000000000)
                Events:FindFirstChild("WinGain"):FireServer(1e308)
            end
            local curP = P:FindFirstChild("CurrentPets")
            if curP then
                local diff = 500 - curP.Value
                if not awaitingPetFill and diff > 0 then
                    for i = 1, diff do
                        PEV:WaitForChild("CRAFT"):FireServer("Soul Warden", "Big")
                    end
                    awaitingPetFill = true
                elseif awaitingPetFill and curP.Value >= 500 then
                    awaitingPetFill = false
                end
            end
            if setupCompleted then
                rebirthFrame = rebirthFrame + 1
                if rebirthFrame >= 4 then
                    rebirthFrame = 0
                    Events:FindFirstChild("HealthAdd"):FireServer(1e308)
                end
            elseif T and not setupCompleted then
                task.spawn(doOneTimeSetup)
            end
        end
    )
end
B.InputBegan:Connect(
    function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            d = true
            m = false
            dS = i.Position
            sP = B.Position
        end
    end
)
U.InputChanged:Connect(
    function(i)
        if d and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
            local dL = i.Position - dS
            if dL.Magnitude > 5 then
                m = true
            end
            TS:Create(
                B,
                TweenInfo.new(0.15),
                {Position = UDim2.new(sP.X.Scale, sP.X.Offset + dL.X, sP.Y.Scale, sP.Y.Offset + dL.Y)}
            ):Play()
        end
    end
)
U.InputEnded:Connect(
    function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            if d then
                d = false
                if not m then
                    toggleState()
                end
            end
        end
    end
)
RS.RenderStepped:Connect(
    function()
        if T then
            activeLoop()
        end
    end
)
