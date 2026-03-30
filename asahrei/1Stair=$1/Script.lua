if game.PlaceId~=139510705441326 then
print("[oxblood] Stop Being Ret@rded.")
return
end
print("[oxblood] Loaded For 1 Stair = 1 Second.")
print("[oxblood] If You Enjoyed This Script, Add @zt6h On Discord!")
local cam=workspace.CurrentCamera
local targetColor=Color3.fromRGB(30,188,19)
local lastCF,lastCamCF,lastVel,lastRotVel=nil,nil,Vector3.zero,Vector3.zero
local plotNumber=nil
local plotFolder=nil
local rebirthEvent=nil
local L=game:GetService("Players")
local P=L.LocalPlayer
local TS=game:GetService("TweenService")
local U=game:GetService("UserInputService")
local RS=game:GetService("RunService")
local REP=game:GetService("ReplicatedStorage")
local S=Instance.new("ScreenGui",P.PlayerGui)
S.ResetOnSpawn=false
S.Name="[oxblood]"
S.DisplayOrder=999
local B=Instance.new("TextButton",S)
local C=Instance.new("UICorner",B)
local G=Instance.new("UIGradient",B)
local K=Instance.new("UIStroke",B)
local cR=Color3.fromRGB(120,10,10)
local cG=Color3.fromRGB(20,80,20)
B.Size=UDim2.new(0,110,0,40)
B.Position=UDim2.new(0,20,0,20)
B.Text="OFF"
B.TextColor3=Color3.new(1,1,1)
B.Font=Enum.Font.GothamBold
B.TextSize=16
B.AutoButtonColor=false
B.BackgroundColor3=cR
C.CornerRadius=UDim.new(0,8)
K.Thickness=2
K.Color=Color3.fromRGB(20,20,20)
K.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
G.Rotation=45
G.Color=ColorSequence.new(Color3.new(1,1,1),Color3.new(0.4,0.4,0.4))
local T=false
local d=false
local m=false
local dS
local sP
local function setOn()
plotNumber=nil
plotFolder=nil
rebirthEvent=nil
lastCF,lastCamCF,lastVel,lastRotVel=nil,nil,Vector3.zero,Vector3.zero
B.Text="ON"
TS:Create(B,TweenInfo.new(0.3),{BackgroundColor3=cG}):Play()
end
local function setOff()
B.Text="OFF"
TS:Create(B,TweenInfo.new(0.3),{BackgroundColor3=cR}):Play()
end
local function toggleState()
T=not T
if T then setOn() else setOff() end
end
local function activeLoop()
pcall(function()
local char=P.Character
if not char then return end
local root=char:FindFirstChild("HumanoidRootPart")
if not root then return end
if not plotFolder or not rebirthEvent then
plotNumber=tostring(P:WaitForChild("PlotNumber").Value)
plotFolder=workspace.Plots:FindFirstChild(plotNumber)
rebirthEvent=REP:WaitForChild("RebirthEvent")
end
if plotFolder then
for _,level in ipairs(plotFolder:GetChildren()) do
if level:IsA("Folder") then
for _,button in ipairs(level:GetChildren()) do
local part=button:FindFirstChild("Part")
if part and not string.find(button.Name,"Robux") and part.Color==targetColor then
firetouchinterest(root,part,0)
firetouchinterest(root,part,1)
end
end
end
end
end
local internal=P:FindFirstChild("InternalFolder")
local stats=P:FindFirstChild("leaderstats")
if internal and stats then
local cost=internal:FindFirstChild("RebirthCost")
local cash=stats:FindFirstChild("Cash")
if cost and cash and cash.Value>=cost.Value then
rebirthEvent:FireServer()
end
end
if not lastCF then
lastCF,lastCamCF=root.CFrame,cam.CFrame
lastVel,lastRotVel=root.AssemblyLinearVelocity,root.AssemblyAngularVelocity
return
end
local dist=(root.Position-lastCF.Position).Magnitude
if dist>5 then
root.CFrame=lastCF
cam.CFrame=lastCamCF
root.AssemblyLinearVelocity=lastVel
root.AssemblyAngularVelocity=lastRotVel
for _,part in ipairs(char:GetChildren()) do
if part:IsA("BasePart") then
part.AssemblyLinearVelocity=Vector3.zero
part.AssemblyAngularVelocity=Vector3.zero
end
end
else
lastCF,lastCamCF=root.CFrame,cam.CFrame
lastVel,lastRotVel=root.AssemblyLinearVelocity,root.AssemblyAngularVelocity
end
end)
end
B.InputBegan:Connect(function(i)
if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
d=true
m=false
dS=i.Position
sP=B.Position
end
end)
U.InputChanged:Connect(function(i)
if d and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
local dL=i.Position-dS
if dL.Magnitude>5 then m=true end
TS:Create(B,TweenInfo.new(0.15),{Position=UDim2.new(sP.X.Scale,sP.X.Offset+dL.X,sP.Y.Scale,sP.Y.Offset+dL.Y)}):Play()
end
end)
U.InputEnded:Connect(function(i)
if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
if d then
d=false
if not m then toggleState() end
end
end
end)
RS.RenderStepped:Connect(function()
if T then activeLoop() end
end)
