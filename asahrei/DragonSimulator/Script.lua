local DAMAGE_AMOUNT=10
local SKILL_AMOUNT=1
local player=game.Players.LocalPlayer
local remote=game.ReplicatedStorage.RemoteEvents.MainRemoteEvent
local foods=workspace:WaitForChild("Foods")
local caves=workspace:WaitForChild("MonsterCaves")
local timers=game:GetService("StarterGui"):WaitForChild("LocalTimers")
local challengeTimer=workspace:WaitForChild("ChallengeTeleportRing"):WaitForChild("ChallengeTeleport"):WaitForChild("NameGui"):WaitForChild("Frame"):WaitForChild("ChallengeTimer")
local fruitFolderNames={"Apple","Banana","Kiwi","Orange","Pear","Pineapple","Strawberry","Watermelon"}
local monsterData={{name="Wolf",timer="Wolf",cave="WolfCave"},{name="Tiger",timer="Tiger",cave="TigerCave"},{name="Lion",timer="Lion",cave="LionCave"},{name="Polar Bear",timer="Polar Bear",cave="PolarBearCave"},{name="Bear",timer="Bear",cave="BearCave"},{name="Panda",timer="Panda",cave="PandaCave"},{name="Monkey",timer="Monkey",cave="MonkeyCave"},{name="Fox",timer="Fox",cave="FoxCave"}}
local lastSpawn={}
local enabled=false
local screenGui=Instance.new("ScreenGui")
screenGui.ResetOnSpawn=false
screenGui.Parent=player:WaitForChild("PlayerGui")
local toggleButton=Instance.new("TextButton")
toggleButton.Size=UDim2.new(0,140,0,40)
toggleButton.Position=UDim2.new(0,10,0,10)
toggleButton.BackgroundColor3=Color3.fromRGB(170,0,0)
toggleButton.TextColor3=Color3.new(1,1,1)
toggleButton.Text="Farm: OFF"
toggleButton.TextScaled=true
toggleButton.Parent=screenGui
toggleButton.MouseButton1Click:Connect(function()
enabled=not enabled
toggleButton.Text="Farm: "..(enabled and "ON" or "OFF")
toggleButton.BackgroundColor3=enabled and Color3.fromRGB(0,170,0) or Color3.fromRGB(170,0,0)
local char=player.Character
if not enabled and char and char:FindFirstChild("HumanoidRootPart") then
local root=char.HumanoidRootPart
root.CFrame=CFrame.new(45,0.600000024,-78.3000412,-1,0,0,0,1,0,0,0,-1)
root.Velocity=Vector3.new(0,0,0)
root.AssemblyLinearVelocity=Vector3.new(0,0,0)
end
end)
local function getBestMonster()
local bestMonster=nil
local goldenText=challengeTimer.Text
if goldenText and goldenText:find("00:00:00") then
local monster=workspace:FindFirstChild("Golden Lion")
if monster then
local health=monster:FindFirstChild("Health")
if health and health.Value>0 then
return monster
end
else
game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("startChallenge")
end
end
local whiteTiger=workspace:FindFirstChild("White Tiger")
if whiteTiger then
local health=whiteTiger:FindFirstChild("Health")
if health and health.Value>0 then
return whiteTiger
end
end
local darkFox=workspace:FindFirstChild("Dark Fox")
if darkFox then
local health=darkFox:FindFirstChild("Health")
if health and health.Value>0 then
return darkFox
end
end
for _,data in ipairs(monsterData) do
local timerObj=timers:FindFirstChild(data.timer)
if timerObj and timerObj.Value<=0 then
local monster=workspace:FindFirstChild(data.name)
if monster then
local health=monster:FindFirstChild("Health")
if health and health.Value>0 and not bestMonster then
bestMonster=monster
end
else
if not lastSpawn[data.name] or tick()-lastSpawn[data.name]>3 then
local cave=caves:FindFirstChild(data.cave)
if cave then
local timerPart=cave:FindFirstChild("TimerPart")
if timerPart then
local timerUI=timerPart:FindFirstChild("TimerUI")
if timerUI then
remote:FireServer("spawnMonsterOnServer",timerUI)
lastSpawn[data.name]=tick()
end
end
end
end
end
end
end
return bestMonster
end
local function getBestFood()
local bestFruit=nil
local bestExp=-1
for _,folderName in ipairs(fruitFolderNames) do
local folder=foods:FindFirstChild(folderName)
if not folder then continue end
for _,fruit in ipairs(folder:GetChildren()) do
local health=fruit:FindFirstChild("Health")
local cframeVal=fruit:FindFirstChild("CFrameValue")
local dragonExp=fruit:FindFirstChild("DragonExp")
if health and cframeVal and dragonExp and health.Value>0 then
if dragonExp.Value>bestExp then
bestExp=dragonExp.Value
bestFruit=fruit
end
end
end
end
return bestFruit
end
game:GetService("RunService").Heartbeat:Connect(function()
if not enabled then return end
local char=player.Character
if not char then return end
local playerFolder=workspace:FindFirstChild(player.Name)
local bestDragon=nil
local highestLevel=-1
if playerFolder then
for _,obj in ipairs(playerFolder:GetChildren()) do
local level=obj:FindFirstChild("Level")
if level and level.Value>highestLevel then
highestLevel=level.Value
bestDragon=obj
end
end
end
local dragon=bestDragon
if not dragon then return end
local root=char:FindFirstChild("HumanoidRootPart")
if not root then return end
local target=getBestMonster()
if not target then
target=getBestFood()
end
if not target then return end
local health=target:FindFirstChild("Health")
if not health or health.Value<=0 then return end
local cfValue=target:FindFirstChild("CFrameValue")
local targetCF=cfValue and cfValue.Value or target:GetPivot()
root.CFrame=targetCF+Vector3.new(0,5,0)
for i=1,DAMAGE_AMOUNT do
remote:FireServer("dragonDamageOnServer",dragon,target)
end
for i=1,SKILL_AMOUNT do
remote:FireServer("useDragonSkill",dragon,target)
end
for _,obj in ipairs(workspace:GetDescendants()) do
if obj.Name=="SkillBlock" then
local part=obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
if part then
firetouchinterest(root,part,0)
firetouchinterest(root,part,1)
end
end
end
end)
