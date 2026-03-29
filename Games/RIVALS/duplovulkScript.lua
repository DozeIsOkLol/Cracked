--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]] --

local v8 = game:GetService("Players")
local v9 = game:GetService("UserInputService")
local v10 = game:GetService("RunService")
local v11 = game:GetService("Lighting")
local v12 = v8.LocalPlayer
local v13 = loadstring(game:HttpGet("https://raw.githubusercontent.com/PresidentZuyi/S/refs/heads/main/Ss"))()
MakeWindow(
    {
        ["Hub"] = {["Title"] = "Rivals - Official Aimbot", ["Animation"] = "Have fun!"},
        ["Key"] = {
            ["KeySystem"] = true,
            ["Title"] = "Official Rivals Aimbot",
            ["Description"] = "Join Discord For Key",
            ["KeyLink"] = "https://discord.gg/zjUWeRKy",
            ["Keys"] = {")", "jjsjssj", "dui", "sua", "RivalsNexo123"},
            ["Notifi"] = {
                ["Notifications"] = true,
                ["CorrectKey"] = "Correct",
                ["Incorrectkey"] = "False",
                ["CopyKeyLink"] = "Copied Discord Link"
            }
        }
    }
)
MinimizeButton(
    {
        ["Image"] = "rbxassetid://103775574267750",
        ["Size"] = {60, 60},
        ["Color"] = Color3.fromRGB(27 - 17, 13 - 3, 10),
        ["Corner"] = true,
        ["Stroke"] = true,
        ["StrokeColor"] = Color3.fromHSV(0.5, 766 - (468 + 297), 563 - (334 + 228))
    }
)
MakeNotifi({["Title"] = "Executed!", ["Text"] = "Boom!", ["Time"] = 16 - 11})
local v14 = MakeTab({["Name"] = "INFO"})
AddImageLabel(v14, {["Name"] = "Nexo🔗", ["Image"] = "rbxassetid://103775574267750"})
AddParagraph(v14, {"Made By Nexo!", "CREDIT"})
AddParagraph(v14, {"Official Rivals Hub", "INFO"})
AddParagraph(v14, {"This script has the Best Rivals script. Enjoy!"})
AddParagraph(v14, {"Enjoy This Amazing Script!"})
local v15 = MakeTab({["Name"] = "Main"})
local v16 = false
local v17 = false
local v18 = false
local v19 = false
local v20 = false
local v21 = false
local v22 = false
local v23 = false
local function v24(v36, v37)
    game:GetService("StarterGui"):SetCore("SendNotification", {["Title"] = v36, ["Text"] = v37, ["Duration"] = 3})
end
v10.Stepped:Connect(
    function()
        if (v16 and v12.Character) then
            for v58, v59 in pairs(v12.Character:GetDescendants()) do
                if v59:IsA("BasePart") then
                    v59.CanCollide = false
                end
            end
        end
    end
)
AddButton(
    v15,
    {
        ["Name"] = "No Clip",
        ["Callback"] = function()
            local v38 = 0 - 0
            while true do
                if (v38 == (0 - 0)) then
                    v16 = not v16
                    v24("No Clip", (v16 and "Activated!") or "Deactivated!")
                    break
                end
            end
        end
    }
)
v9.JumpRequest:Connect(
    function()
        if v17 then
            local v49 = 0 + 0
            local v50
            while true do
                if (v49 == 0) then
                    v50 = v12.Character and v12.Character:FindFirstChildOfClass("Humanoid")
                    if v50 then
                        v50:ChangeState("Jumping")
                    end
                    break
                end
            end
        end
    end
)
AddButton(
    v15,
    {
        ["Name"] = "Infinite Jump",
        ["Callback"] = function()
            local v39 = 0
            while true do
                if (v39 == (0 - 0)) then
                    v17 = not v17
                    v24("Infinite Jump", (v17 and "Activated!") or "Deactivated!")
                    break
                end
            end
        end
    }
)
local v25 = 50
local v26 = false
local v27 = false
local v28 = false
local v29 = false
local v30 = false
local v31 = false
AddButton(
    v15,
    {
        ["Name"] = "Fly",
        ["Callback"] = function()
            local v40 = 0
            while true do
                if (v40 == (0 + 0)) then
                    v18 = not v18
                    v24("Fly", (v18 and "Activated!") or "Deactivated!")
                    break
                end
            end
        end
    }
)
v9.InputBegan:Connect(
    function(v41, v42)
        local v43 = 0 + 0
        local v44
        while true do
            if (v43 == (0 - 0)) then
                v44 = 0 + 0
                while true do
                    if (v44 == (164 - (92 + 71))) then
                        if (v41.KeyCode == Enum.KeyCode.LeftShift) then
                            v27 = true
                        end
                        if (v41.KeyCode == Enum.KeyCode.W) then
                            v28 = true
                        end
                        v44 = 1 + 1
                    end
                    if ((4 - 1) == v44) then
                        if (v41.KeyCode == Enum.KeyCode.D) then
                            v31 = true
                        end
                        break
                    end
                    if (v44 == 2) then
                        if (v41.KeyCode == Enum.KeyCode.S) then
                            v29 = true
                        end
                        if (v41.KeyCode == Enum.KeyCode.A) then
                            v30 = true
                        end
                        v44 = 768 - (574 + 191)
                    end
                    if (v44 == (0 + 0)) then
                        if v42 then
                            return
                        end
                        if (v41.KeyCode == Enum.KeyCode.Space) then
                            v26 = true
                        end
                        v44 = 1
                    end
                end
                break
            end
        end
    end
)
v9.InputEnded:Connect(
    function(v45, v46)
        if v46 then
            return
        end
        if (v45.KeyCode == Enum.KeyCode.Space) then
            v26 = false
        end
        if (v45.KeyCode == Enum.KeyCode.LeftShift) then
            v27 = false
        end
        if (v45.KeyCode == Enum.KeyCode.W) then
            v28 = false
        end
        if (v45.KeyCode == Enum.KeyCode.S) then
            v29 = false
        end
        if (v45.KeyCode == Enum.KeyCode.A) then
            v30 = false
        end
        if (v45.KeyCode == Enum.KeyCode.D) then
            v31 = false
        end
    end
)
v10.RenderStepped:Connect(
    function()
        if (v18 and v12.Character and v12.Character:FindFirstChild("HumanoidRootPart")) then
            local v51 = 0
            local v52
            local v53
            while true do
                if (v51 == (4 - 2)) then
                    if v28 then
                        v53 = v53 + (v52.CFrame.LookVector * v25)
                    end
                    if v29 then
                        v53 = v53 - (v52.CFrame.LookVector * v25)
                    end
                    v51 = 3
                end
                if (v51 == 0) then
                    v52 = v12.Character.HumanoidRootPart
                    v53 = Vector3.new()
                    v51 = 1 + 0
                end
                if (v51 == (850 - (254 + 595))) then
                    if v26 then
                        v53 = v53 + Vector3.new(126 - (55 + 71), v25, 0 - 0)
                    end
                    if v27 then
                        v53 = v53 + Vector3.new(1790 - (573 + 1217), -v25, 0 - 0)
                    end
                    v51 = 1 + 1
                end
                if (v51 == (5 - 1)) then
                    v52.Velocity = v53
                    break
                end
                if (v51 == (942 - (714 + 225))) then
                    if v30 then
                        v53 = v53 - (v52.CFrame.RightVector * v25)
                    end
                    if v31 then
                        v53 = v53 + (v52.CFrame.RightVector * v25)
                    end
                    v51 = 11 - 7
                end
            end
        end
    end
)
AddButton(
    v15,
    {["Name"] = "ESP", ["Callback"] = function()
            v19 = not v19
            v24("ESP", (v19 and "Activated!") or "Deactivated!")
        end}
)
task.spawn(
    function()
        while task.wait(1 - 0) do
            if v19 then
                for v60, v61 in pairs(v8:GetPlayers()) do
                    if ((v61 ~= v12) and v61.Character and v61.Character:FindFirstChild("Head")) then
                        if not v61.Character.Head:FindFirstChild("ESP") then
                            local v70 = 0
                            local v71
                            local v72
                            while true do
                                if (v70 == (1 + 2)) then
                                    v72.Text = v61.Name
                                    v72.BackgroundTransparency = 1 - 0
                                    v70 = 810 - (118 + 688)
                                end
                                if (v70 == (50 - (25 + 23))) then
                                    v72 = Instance.new("TextLabel", v71)
                                    v72.Size = UDim2.new(1 + 0, 0, 1887 - (927 + 959), 0)
                                    v70 = 10 - 7
                                end
                                if (v70 == (736 - (16 + 716))) then
                                    v72.TextColor3 = Color3.new(1 - 0, 97 - (11 + 86), 0)
                                    break
                                end
                                if ((2 - 1) == v70) then
                                    v71.Size = UDim2.new(0, 385 - (175 + 110), 0 - 0, 197 - 157)
                                    v71.AlwaysOnTop = true
                                    v70 = 2
                                end
                                if (v70 == (1796 - (503 + 1293))) then
                                    v71 = Instance.new("BillboardGui", v61.Character.Head)
                                    v71.Name = "ESP"
                                    v70 = 2 - 1
                                end
                            end
                        end
                    end
                end
            else
                for v62, v63 in pairs(v8:GetPlayers()) do
                    if (v63.Character and v63.Character:FindFirstChild("Head")) then
                        local v68 = 0 + 0
                        local v69
                        while true do
                            if (v68 == (1061 - (810 + 251))) then
                                v69 = v63.Character.Head:FindFirstChild("ESP")
                                if v69 then
                                    v69:Destroy()
                                end
                                break
                            end
                        end
                    end
                end
            end
        end
    end
)
AddButton(
    v15,
    {
        ["Name"] = "WalkSpeed",
        ["Callback"] = function()
            local v47 = 0
            while true do
                if (v47 == (1 + 0)) then
                    v24("WalkSpeed", (v20 and "Activated!") or "Deactivated!")
                    break
                end
                if (v47 == 0) then
                    v20 = not v20
                    if (v12.Character and v12.Character:FindFirstChildOfClass("Humanoid")) then
                        v12.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = (v20 and (16 + 34)) or 16
                    end
                    v47 = 1
                end
            end
        end
    }
)
AddButton(
    v15,
    {["Name"] = "JumpPower", ["Callback"] = function()
            v21 = not v21
            if (v12.Character and v12.Character:FindFirstChildOfClass("Humanoid")) then
                v12.Character:FindFirstChildOfClass("Humanoid").JumpPower = (v21 and 100) or 50
            end
            v24("JumpPower", (v21 and "Activated!") or "Deactivated!")
        end}
)
AddButton(
    v15,
    {
        ["Name"] = "FullBright",
        ["Callback"] = function()
            v22 = not v22
            if v22 then
                local v55 = 0
                local v56
                while true do
                    if (v55 == (0 + 0)) then
                        v56 = 533 - (43 + 490)
                        while true do
                            if (v56 == (734 - (711 + 22))) then
                                v11.FogEnd = 386820 - 286820
                                break
                            end
                            if (0 == v56) then
                                v11.Brightness = 2
                                v11.ClockTime = 873 - (240 + 619)
                                v56 = 1 + 0
                            end
                        end
                        break
                    end
                end
            else
                v11.Brightness = 1 - 0
            end
            v24("FullBright", (v22 and "Activated!") or "Deactivated!")
        end
    }
)
AddButton(
    v15,
    {["Name"] = "FPS Booster", ["Callback"] = function()
            v23 = not v23
            v24("FPS Booster", (v23 and "Activated!") or "Deactivated!")
        end}
)
local v32 = MakeTab({["Name"] = "Rivals"})
AddParagraph(
    v32,
    {"This is the Official Rivals Hub", "Works for PC and Mobile, Universal UI.\nClick the button below to continue!"}
)
AddButton(
    v32,
    {["Name"] = "Click me!", ["Callback"] = function()
            v24("Rivals", "Button clicked!")
            loadstring(game:HttpGet("https://rawscripts.net/raw/RIVALS-BEST-WORKING-AIMBOT-FOR-112806", true))()
        end}
)
