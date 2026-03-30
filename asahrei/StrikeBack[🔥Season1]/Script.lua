if game.PlaceId~=124143542106350 then
print("[oxblood] Stop Being Ret@rded.")
return
end
print("[oxblood] Loaded For Strike Back.")
print("[oxblood] If You Enjoyed This Script, Add @zt6h On Discord!")
local lastTime=0
local L=game:GetService("Players")
local P=L.LocalPlayer
local TS=game:GetService("TweenService")
local U=game:GetService("UserInputService")
local RS=game:GetService("RunService")
local REP=game:GetService("ReplicatedStorage")
local REMOTES=REP:WaitForChild("Remotes")
local purchaseRemote=REMOTES:WaitForChild("PurchaseChestKeyFunction")
local openRemote=REMOTES:WaitForChild("OpenChestFunction")
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
game:GetService("ReplicatedStorage").Remotes.FastPurchaseGrenadeFunction:InvokeServer(0/0)
lastTime=0
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
local now=tick()
if now-lastTime>=0.1 then
lastTime=now
local purchaseArgs={1,25000}
purchaseRemote:InvokeServer(unpack(purchaseArgs))
local openArgs={1,false}
openRemote:InvokeServer(unpack(openArgs))
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
