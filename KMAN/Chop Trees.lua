
local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window = Library:NewWindow("Script")
 
local Tab = Window:NewSection("Credits: TGMANKASKE")
 
Tab:CreateToggle("Inf. Money", function(no)
_G.GetWins = no
while _G.GetWins== true do
    wait() 
print("Give credits to KMAN || KontrollAll || TGMANKASKE")

local args = {
	10000 --change the quantity
}
game:GetService("ReplicatedStorage"):WaitForChild("AwardCoins"):FireServer(unpack(args))

end
end)

local Tab = Window:NewSection("Links")
 
Tab:CreateButton("Discord Group", function()
print("Give credits to KMAN || KontrollAll || TGMANKASKE")
 
setclipboard("https://discord.gg/8A6k73JqCM")
toclipboard("https://discord.gg/8A6k73JqCM")
 
end)
 
Tab:CreateButton("Youtube", function()
print("Give credits to KMAN || KontrollAll || TGMANKASKE")
 
setclipboard("https://www.youtube.com/@TGMANKASKE")
toclipboard("https://www.youtube.com/@TGMANKASKE")
 
end)
