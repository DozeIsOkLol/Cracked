local remote=game.ReplicatedStorage.RemoteEvents.MainRemoteEvent
local caves=workspace:WaitForChild("MonsterCaves")
local caveNames={"WolfCave","TigerCave","LionCave","PolarBearCave","BearCave","PandaCave","MonkeyCave","FoxCave"}
while true do
for _,name in ipairs(caveNames) do
local cave=caves:FindFirstChild(name)
if cave then
local timerPart=cave:FindFirstChild("TimerPart")
if timerPart then
local timerUI=timerPart:FindFirstChild("TimerUI")
if timerUI then
remote:FireServer("spawnMonsterOnServer",timerUI)
end
end
end
end
task.wait(3)
end
print("Monster auto-spawn loop active")
