-- ts file was generated at discord.gg/25ms

game:GetService('Workspace')

local _ReplicatedStorage = game:GetService('ReplicatedStorage')
local _TeleportService = game:GetService('TeleportService')
local _LocalPlayer = game:GetService('Players').LocalPlayer
local _meleeEvent = _ReplicatedStorage.meleeEvent
local u5 = {
    Prison = CFrame.new(459.479614, 98.039917, 2214.41626, 0.00872961991, 4.53056934e-8, -0.999961913, 3.5218169e-13, 1, 4.53074236e-8, 0.999961913, -3.9586875399999997e-10, 0.00872961991),
    ['Prison In'] = CFrame.new(819.395569, 97.9999237, 2429.32983, 0.999997079, -2.55919836e-8, -0.00241954369, 2.58199382e-8, 1, 9.41825249e-8, 0.00241954369, -9.42447187e-8, 0.999997079),
    CriminalBase = CFrame.new(-892.885864, 94.1270294, 2135.16406, 0.00960396044, 2.0725107e-8, 0.999953866, -5.53015376e-8, 1, -2.01949248e-8, -0.999953866, -5.51050334e-8, 0.00960396044),
    ['CriminalBase In'] = CFrame.new(-943.7229, 94.1287613, 2064.06396, 0.997658789, -3.10820596e-8, -0.0683880374, 2.59871591e-8, 1, -7.5389508e-8, 0.0683880374, 7.343579259999999e-8, 0.997658789),
    ['Car Spawn'] = CFrame.new(-194.069901, 53.8621101, 1891.29419, 0.999670029, 5.02411659e-8, -0.0256865229, -5.00618178e-8, 1, 7.62532171e-9, 0.0256865229, -6.3368919e-9, 0.999670029),
    ['Gurads Base'] = CFrame.new(840.884338, 99.9899826, 2272.91992, 0.999043584, 3.949153e-9, -0.0437253937, 1.19421956e-14, 1, 9.03174282e-8, 0.0437253937, -9.02310475e-8, 0.999043584),
    ['Cars Spawn Prison'] = CFrame.new(615.819641, 98.039917, 2467.44336, -0.999962151, -3.58762122e-8, 0.00869745482, -3.52822305e-8, 1, 6.84469015e-8, -0.00869745482, 6.813744590000001e-8, -0.999962151),
    test = CFrame.new(),
}
local u6 = {
    'Prison',
    'Prison In',
    'CriminalBase',
    'CriminalBase In',
    'Car Spawn',
    'Cars Spawn Prison',
    'Gurads Base',
}
local v7 = {EspDisabled = false}
local u8 = {
    Enabled = false,
    Boxes = true,
    FaceCamera = false,
    Names = true,
    TeamColor = true,
    Thickness = 1,
    AttachShift = 1,
    TeamMates = true,
    Players = true,
    Toggle = function(_) end,
}

if getexecutorname():sub(1) == 'Celery' then
    v7.EspDisabled = true
else
    u8 = loadstring(game:HttpGet('https://pastebin.com/raw/nums7qGL'))()
end

local v9 = u8

u8.Toggle(v9, false)

u8.Players = false
u8.Boxes = false
u8.Names = false
u8.TeamColor = false

local u10 = nil

pcall(function()
    u10 = loadstring(game:HttpGet('https://raw.githubusercontent.com/BaconStorage/Scripts/main/Functions.lua'))()
end)
spawn(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/BaconStorage/Scripts/main/Aimbot.lua'))()
end)

local u11 = {
    Combat = {
        killAura = false,
        killAuraGuards = false,
        killAuraInmates = false,
        killAuraNeutral = false,
        killAuraCriminals = false,
    },
    CharacterMods = {
        WalkSpeed = 16,
        JumpPower = 50,
        Noclip = false,
        InfiniteJump = false,
        TPToOldPos = false,
    },
    Misc = {
        ClickTP = false,
        ClickDestroy = false,
    },
}
local v12 = {}
local v13 = {}
local v14 = {}
local v15 = {}

getgenv().DefaultColor = Color3.fromRGB(0, 91, 177)
getgenv().UIlib = ''

function v13.init(_)
    spawn(function()
        game:GetService('RunService').Heartbeat:Connect(function()
            if _LocalPlayer.Character ~= nil and game:GetService('Players').LocalPlayer.Character:FindFirstChild('Humanoid') ~= nil then
                spawn(function()
                    if tonumber(u11.CharacterMods.WalkSpeed) > tonumber(16) then
                        game:GetService('Players').LocalPlayer.Character.Humanoid.WalkSpeed = u11.CharacterMods.WalkSpeed
                    end
                end)

                game:GetService('Players').LocalPlayer.Character.Humanoid.JumpPower = u11.CharacterMods.JumpPower
            end
        end)
        game:GetService('RunService').Heartbeat:Connect(function()
            if _LocalPlayer.Character ~= nil then
                local v16 = next
                local v17, v18 = game:GetService('Players').LocalPlayer.Character:GetDescendants()

                while true do
                    local v19

                    v18, v19 = v16(v17, v18)

                    if v18 == nil then
                        break
                    end
                    if u11.CharacterMods.Noclip and (v19:IsA('BasePart') or v19:IsA('Part') and v19.Parent == game:GetService('Players').LocalPlayer.Character) then
                        v19.CanCollide = false
                    end
                end
            end
        end)
    end)
    spawn(function()
        while game:GetService('RunService').Heartbeat:wait() do
            if u11.Combat.killAura == true then
                local v20, v21, v22 = pairs(game:GetService('Players'):GetChildren())

                while true do
                    local v23

                    v22, v23 = v20(v21, v22)

                    if v22 == nil then
                        break
                    end
                    if v23.Name ~= game.Players.LocalPlayer.Name then
                        _meleeEvent:FireServer(v23)
                    end
                end
            end
            if u11.Combat.killAuraGuards == true then
                local v24, v25, v26 = pairs(game:GetService('Teams').Guards:GetPlayers())

                while true do
                    local v27

                    v26, v27 = v24(v25, v26)

                    if v26 == nil then
                        break
                    end
                    if v27.Name ~= game.Players.LocalPlayer.Name then
                        _meleeEvent:FireServer(v27)
                    end
                end
            end
            if u11.Combat.killAuraInmates == true then
                local v28, v29, v30 = pairs(game:GetService('Teams').Inmates:GetPlayers())

                while true do
                    local v31

                    v30, v31 = v28(v29, v30)

                    if v30 == nil then
                        break
                    end
                    if v31.Name ~= game.Players.LocalPlayer.Name then
                        _meleeEvent:FireServer(v31)
                    end
                end
            end
            if u11.Combat.killAuraNeutral == true then
                local v32, v33, v34 = pairs(game:GetService('Teams').Neutral:GetPlayers())

                while true do
                    local v35

                    v34, v35 = v32(v33, v34)

                    if v34 == nil then
                        break
                    end
                    if v35.Name ~= game.Players.LocalPlayer.Name then
                        _meleeEvent:FireServer(v35)
                    end
                end
            end
            if u11.Combat.killAuraCriminals == true then
                local v36, v37, v38 = pairs(game:GetService('Teams').Criminals:GetPlayers())

                while true do
                    local v39

                    v38, v39 = v36(v37, v38)

                    if v38 == nil then
                        break
                    end
                    if v39.Name ~= game.Players.LocalPlayer.Name then
                        _meleeEvent:FireServer(v39)
                    end
                end
            end
        end
    end)
end
function v14.init(_)
    repeat
        game:GetService('RunService').Heartbeat:wait()
    until game.Players.LocalPlayer.Character
    repeat
        game:GetService('RunService').Heartbeat:wait()
    until game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')

    local u40 = nil
    local u41 = nil

    u41 = game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
        u40 = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

        u41:Disconnect()
    end)

    game.Players.LocalPlayer.CharacterAdded:Connect(function(p42)
        repeat
            game:GetService('RunService').Heartbeat:wait()
        until p42
        repeat
            game:GetService('RunService').Heartbeat:wait()
        until p42:FindFirstChild('Humanoid')

        p42.Humanoid.Died:Connect(function()
            u40 = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

            u41:Disconnect()
        end)
    end)
    game.Players.LocalPlayer.CharacterAdded:Connect(function(p43)
        repeat
            game:GetService('RunService').Heartbeat:wait()
        until p43
        repeat
            game:GetService('RunService').Heartbeat:wait()
        until p43:FindFirstChild('HumanoidRootPart')

        if u11.CharacterMods.TPToOldPos then
            p43:FindFirstChild('HumanoidRootPart').CFrame = u40
        end
    end)
end
function v12.init(_)
    function Teleport(p44)
        if _LocalPlayer.Character ~= nil then
            game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = p44
        end
    end
    function RejoinServer()
        _TeleportService:Teleport(game.PlaceId)
    end
    function FirstPersonEnabled(p45)
        if p45 == true then
            game.Players.LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
        else
            game.Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic
        end
    end
    function GunMod()
        local v46 = next
        local v47, v48 = getgc(true)

        while true do
            local v49

            v48, v49 = v46(v47, v48)

            if v48 == nil then
                break
            end
            if type(v49) == 'table' and rawget(v49, 'FireRate') then
                v49.FireRate = 0
                v49.AutoFire = true
            end
        end
    end
    function OpenGate()
        if _LocalPlayer.Character ~= nil then
            local _CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            local _CFrame2 = game.Workspace.Prison_ITEMS.buttons['Prison Gate']['Prison Gate'].CFrame

            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _CFrame2

            wait(0.2)

            local v52 = {
                game.Workspace.Prison_ITEMS.buttons['Prison Gate']['Prison Gate'],
            }

            workspace:FindFirstChild('Remote'):FindFirstChild('ItemHandler'):InvokeServer(unpack(v52))
            wait(0.1)

            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _CFrame
        end
    end
    function GiveAllGuns()
        pcall(function()
            local _Noclip = u11.CharacterMods.Noclip

            u11.CharacterMods.Noclip = false

            local _CFrame3 = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Prison_ITEMS.giver['Remington 870'].ITEMPICKUP.CFrame

            wait(0.2)

            local v55 = {
                game.Workspace.Prison_ITEMS.giver['Remington 870'].ITEMPICKUP,
            }

            workspace:FindFirstChild('Remote'):FindFirstChild('ItemHandler'):InvokeServer(unpack(v55))
            wait(0.2)

            local v56 = {
                game.Workspace.Prison_ITEMS.giver.M9.ITEMPICKUP,
            }

            workspace:FindFirstChild('Remote'):FindFirstChild('ItemHandler'):InvokeServer(unpack(v56))

            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Prison_ITEMS.giver['AK-47'].ITEMPICKUP.CFrame

            wait(0.2)

            local v57 = {
                game.Workspace.Prison_ITEMS.giver['AK-47'].ITEMPICKUP,
            }

            workspace:FindFirstChild('Remote'):FindFirstChild('ItemHandler'):InvokeServer(unpack(v57))
            wait(0.1)

            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _CFrame3

            wait(3)

            u11.CharacterMods.Noclip = _Noclip
        end)
    end

    local u58 = game.Players.LocalPlayer:GetMouse()
    local _UserInputService = game:GetService('UserInputService')

    _UserInputService.InputBegan:Connect(function(p60)
        if p60.UserInputType == Enum.UserInputType.MouseButton1 and (u11.Misc.ClickTP and u58.Target) then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(u58.Hit.x, u58.Hit.y + 5, u58.Hit.z)
        end
        if p60.UserInputType == Enum.UserInputType.MouseButton1 and (u11.Misc.ClickDestroy and u58.Target) then
            u58.Target:Destroy()
        end
    end)
    _UserInputService.InputBegan:Connect(function(p61)
        if p61.KeyCode == Enum.KeyCode.Space and (u11.CharacterMods.InfiniteJump and u58.Target) then
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)
        end
    end)
end
function v15.init(_)
    local u62 = loadstring(game:HttpGet('https://pastebin.com/raw/pQ9nc9Ti'))()

    u62:ChangeUIName('Bacon Hub')

    local v63 = 'Bacon Hub Free Edition/Prison Life'
    local u64 = v63 .. '/Configs/'

    if not isfolder(v63) then
        makefolder(v63)
    end
    if not isfolder(u64) then
        makefolder(u64)
    end

    local _HttpService = game:GetService('HttpService')

    local function u68(p66)
        local v67 = _HttpService:JSONEncode(u62.flags)

        writefile(u64 .. p66 .. '.json', v67)
    end
    local function u76(p69)
        local v70 = u64 .. p69 .. '.json'

        if isfile(v70) then
            local v71 = _HttpService:JSONDecode((readfile(v70)))
            local v72, v73, v74 = pairs(v71)

            while true do
                local v75

                v74, v75 = v72(v73, v74)

                if v74 == nil then
                    break
                end
                if tostring(v74) ~= 'Select Config' then
                    u62.flags[tostring(v74)] = v75
                end
            end
        end
    end

    local _PrisonLife = u62:CreateSection('Prison Life')
    local _Visual = u62:CreateSection('Visual')
    local _Aimbot = u62:CreateSection('Aimbot')
    local _Settings = u62:CreateSection('Settings')

    _Visual:Toggle('Esp Enabled', function(p81)
        u8:Toggle(p81)
    end)
    _Visual:Toggle('Player Esp', function(p82)
        u8.Players = p82
    end)
    _Visual:Label('Esp Settings')
    _Visual:Toggle('Name Esp', function(p83)
        u8.Names = p83
    end)
    _Visual:Toggle('Box Esp', function(p84)
        u8.Boxes = p84
    end)
    _Visual:Toggle('Tracers Esp', function(p85)
        u8.Tracers = p85
    end)
    _Visual:Toggle('Team Color', function(p86)
        u8.TeamColor = p86
    end)
    _Visual:ColorPicker('Esp Color', Color3.fromRGB(255, 255, 255), function(p87)
        u8.Color = p87
    end)
    _Visual:Slider('FOV', {
        min = 1,
        max = 120,
        value = 70,
    }, function(p88)
        game:GetService('Workspace').CurrentCamera.FieldOfView = p88
    end)
    _Aimbot:Toggle('Aimbot Enabled', function(p89)
        getgenv().aimbot = p89
    end)
    _Aimbot:Label('Aimbot Settings')
    _Aimbot:Toggle('Team Check', function(p90)
        getgenv().teamcheck = p90
    end)
    _Aimbot:Toggle('Visible Check', function(p91)
        getgenv().teamcheck = p91
    end)
    _Aimbot:Toggle('Show FOV', function(p92)
        getgenv().showfov = p92
    end)
    _Aimbot:Slider('FOV Size', {
        min = 30,
        max = 800,
        value = 120,
    }, function(_)
        getgenv().fov = value
    end)
    _Aimbot:Slider('FOV Thickness', {
        min = 1,
        max = 5,
        value = 1,
    }, function(_)
        getgenv().fovThickness = value
    end)
    _Aimbot:ColorPicker('FOV Color', Color3.fromRGB(255, 255, 255), function(p93)
        getgenv().fovcolor = p93
    end)
    _PrisonLife:Label('Combat Cheats')
    _PrisonLife:Toggle('Kill Aura (Guards)', function(p94)
        u11.Combat.killAuraGuards = p94
    end)
    _PrisonLife:Toggle('Kill Aura (Inmates)', function(p95)
        u11.Combat.killAuraInmates = p95
    end)
    _PrisonLife:Toggle('Kill Aura (Neutral)', function(p96)
        u11.Combat.killAuraNeutral = p96
    end)
    _PrisonLife:Toggle('Kill Aura (Criminals)', function(p97)
        u11.Combat.killAuraCriminals = p97
    end)
    _PrisonLife:Toggle('Kill Aura', function(p98)
        u11.Combat.killAura = p98
    end)
    _PrisonLife:Button('Give All Guns', function()
        GiveAllGuns()
    end)
    _PrisonLife:Button('Gun Mod', function()
        GunMod()
    end)
    _PrisonLife:Label('Character Cheats')
    _PrisonLife:Slider('WalkSpeed', {
        min = 16,
        max = 300,
    }, function(p99)
        u11.CharacterMods.WalkSpeed = p99
    end)
    _PrisonLife:Slider('JumpPower', {
        min = 50,
        max = 500,
    }, function(p100)
        u11.CharacterMods.JumpPower = p100
    end)
    _PrisonLife:Toggle('Noclip', function(p101)
        u11.CharacterMods.Noclip = p101
    end)
    _PrisonLife:Toggle('Infinite Jump', function(p102)
        u11.CharacterMods.InfiniteJump = p102
    end)
    _PrisonLife:Toggle('TP To Old Position', function(p103)
        u11.CharacterMods.TPToOldPos = p103
    end)
    _PrisonLife:Label('Misc')
    _PrisonLife:Toggle('Click TP', function(p104)
        u11.Misc.ClickTP = p104
    end)
    _PrisonLife:Toggle('Click Destroy', function(p105)
        u11.Misc.ClickDestroy = p105
    end)
    _PrisonLife:Button('Rejoin Server', function()
        RejoinServer()
    end)
    _PrisonLife:Button('Open Prison Gate', function()
        OpenGate()
    end)
    _PrisonLife:Label('Teleports')

    local v106 = next
    local v107 = u6
    local v108 = nil

    local function u116()
        local v109 = {}
        local v110 = u64

        if not isfolder(v110) then
            makefolder(v110)
        end

        local v111 = listfiles(v110)
        local v112, v113, v114 = ipairs(v111)

        while true do
            local v115

            v114, v115 = v112(v113, v114)

            if v114 == nil then
                break
            end
            if v115:match('%.json$') then
                table.insert(v109, v115:match('([^/]+)%.json$'))
            end
        end

        return v109
    end
    local function u119(p117)
        local v118 = u64 .. p117 .. '.json'

        if not isfile(v118) then
            return false
        end

        delfile(v118)

        return true
    end

    while true do
        local u120

        v108, u120 = v106(v107, v108)

        if v108 == nil then
            break
        end

        _PrisonLife:Button(u120, function()
            Teleport(u5[tostring(u120)])
        end)
    end

    _Settings:Label('Discord')
    _Settings:Button('Join Discord', function()
        local _httpspastebincomrawL0jJwJnJ = game:HttpGet('https://pastebin.com/raw/L0jJwJnJ')

        u10.JoinDiscord(_httpspastebincomrawL0jJwJnJ)
    end)
    _Settings:Button('Copy Discord Invite', function()
        local v122 = 'discord.gg/' .. game:HttpGet('https://pastebin.com/raw/L0jJwJnJ')

        setclipboard(v122)
    end)
    _Settings:Label('Configs')

    local u123 = ''
    local _SelectConfig = _Settings:Dropdown('Select Config', u116(), function(p124)
        u123 = p124
    end)

    _Settings:Box('Config Name', function(p126)
        u123 = p126
    end)
    _Settings:Button('Save Config', function()
        u68(u123)
    end)
    _Settings:Button('Load Config', function()
        u76(u123)
    end)
    _Settings:Button('Refresh Configs', function()
        _SelectConfig:Update(u116())
    end)
    _Settings:Button('Delete Config', function()
        if u119(u123) then
            _SelectConfig:Update(u116())
        end
    end)
    u62:Ready()
end

v12:init()
v13:init()
v14:init()
v15:init()
