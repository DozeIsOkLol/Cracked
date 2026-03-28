local player = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")

local function getSword()
    if player.Character then
        return player.Character:FindFirstChild("Sword")
    end
    return nil
end

local function isInRange(targetCharacter, range)
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
        return false
    end
    
    local myPosition = player.Character.HumanoidRootPart.Position
    local targetPosition = targetCharacter:FindFirstChild("HumanoidRootPart") and targetCharacter.HumanoidRootPart.Position
    
    if targetPosition then
        local distance = (myPosition - targetPosition).Magnitude
        return distance <= range
    end
    return false
end

local function hitPlayer(targetPlayer)
    local sword = getSword()
    if not sword or not sword:FindFirstChild("Remote") then return end
    
    local remote = sword.Remote
    
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
        if isInRange(targetPlayer.Character, 50) then
            local args = {
                "Hit",
                targetPlayer.Character.Humanoid
            }
            
            remote:FireServer(unpack(args))
        end
    end
end

local connection
connection = RunService.Heartbeat:Connect(function()
    local sword = getSword()
    
    if not sword or not player.Character then
        return
    end
    
    for _, targetPlayer in ipairs(game:GetService("Players"):GetPlayers()) do
        if targetPlayer ~= player then
            hitPlayer(targetPlayer)
        end
    end
end)
