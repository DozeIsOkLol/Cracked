-- ts file was generated at discord.gg/25ms


local vu1 = game:GetService("HttpService")
local v2 = game:GetService("Players")
game:GetService("UserInputService")
local vu3 = game:GetService("StarterGui")
local vu4 = game:GetService("CoreGui")
local _ = v2.LocalPlayer
local vu5 = "http://api-bloxhub.vercel.app/api/api_login_roblox.js"
local vu6 = "https://bloxhub-dev.vercel.app/api/roblox/verify"
local v7 = loadstring(game:HttpGet("https://bloxhub-six.vercel.app/autisme.lua"))()
local vu8 = "https://bloxhub-dev.vercel.app/get-free-key"
local vu9 = "rbxassetid://71512996518950"
local vu10 = v7.bless .. v7.me .. v7.god .. "on-dev-script(903670).lua" .. v7.well .. v7.methodfatch
local vu11 = "bloxhub.key"
local vu12 = "bloxhub_time.txt"
local vu13 = 3600
local function vu22(p14)
    local vu15 = Instance.new("Frame")
    vu15.Name = "ProgressBarBG"
    vu15.Size = UDim2.new(1, - 80, 0, 8)
    vu15.Position = UDim2.new(0, 40, 1, - 30)
    vu15.BackgroundColor3 = Color3.fromRGB(44, 54, 65)
    vu15.BorderSizePixel = 0
    vu15.ZIndex = 10
    vu15.Parent = p14
    Instance.new("UICorner", vu15).CornerRadius = UDim.new(0, 4)
    local vu16 = Instance.new("Frame", vu15)
    vu16.Name = "ProgressBar"
    vu16.Size = UDim2.new(0, 0, 1, 0)
    vu16.BackgroundColor3 = Color3.fromRGB(120, 210, 130)
    vu16.BorderSizePixel = 0
    vu16.ZIndex = 11
    Instance.new("UICorner", vu16).CornerRadius = UDim.new(0, 4)
    local vu17 = Instance.new("TextLabel", vu15)
    vu17.AnchorPoint = Vector2.new(1, 1)
    vu17.Position = UDim2.new(1, 0, 0, - 10)
    vu17.Size = UDim2.new(0, 50, 0, 14)
    vu17.BackgroundTransparency = 1
    vu17.Font = Enum.Font.GothamSemibold
    vu17.Text = "0%"
    vu17.TextColor3 = Color3.fromRGB(160, 255, 180)
    vu17.TextSize = 12
    vu17.ZIndex = 12
    local vu18 = Instance.new("TextLabel", vu15)
    vu18.AnchorPoint = Vector2.new(0, 1)
    vu18.Position = UDim2.new(0, 0, 0, - 10)
    vu18.Size = UDim2.new(1, - 60, 0, 14)
    vu18.BackgroundTransparency = 1
    vu18.Font = Enum.Font.Gotham
    vu18.Text = ""
    vu18.TextColor3 = Color3.fromRGB(220, 230, 220)
    vu18.TextSize = 12
    vu18.TextXAlignment = Enum.TextXAlignment.Left
    vu18.ZIndex = 12
    return function(p19, p20)
        local v21 = math.clamp(p19, 0, 1)
        vu16:TweenSize(UDim2.new(v21, 0, 1, 0), "Out", "Quad", 0.25, true)
        vu17.Text = tostring(math.floor(v21 * 100)) .. "%"
        vu18.Text = p20 or ""
    end, function()
        vu15:Destroy()
    end
end
local function vu34()
    local vu23 = Instance.new("ScreenGui", vu4)
    vu23.Name = "BloxHubLauncherLoading"
    vu23.ResetOnSpawn = false
    vu23.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    local v24 = Instance.new("Frame", vu23)
    v24.Size = UDim2.new(1, 0, 1, 0)
    v24.BackgroundTransparency = 0.2
    v24.BackgroundColor3 = Color3.fromRGB(20, 25, 30)
    v24.ZIndex = 30
    local v25 = Instance.new("Frame", v24)
    v25.AnchorPoint = Vector2.new(0.5, 0.5)
    v25.Position = UDim2.new(0.5, 0, 0.5, 0)
    v25.Size = UDim2.new(0, 340, 0, 64)
    v25.BackgroundColor3 = Color3.fromRGB(31, 39, 48)
    v25.BorderSizePixel = 0
    v25.ZIndex = 32
    Instance.new("UICorner", v25).CornerRadius = UDim.new(0, 18)
    local v26 = Instance.new("ImageLabel", v25)
    v26.Image = vu9
    v26.Size = UDim2.new(0, 44, 0, 44)
    v26.Position = UDim2.new(0, 16, 0.5, - 22)
    v26.BackgroundTransparency = 1
    v26.ZIndex = 33
    local v27 = Instance.new("TextLabel", v25)
    v27.Size = UDim2.new(1, - 80, 0, 24)
    v27.Position = UDim2.new(0, 72, 0, 10)
    v27.BackgroundTransparency = 1
    v27.Font = Enum.Font.GothamBold
    v27.Text = "Loading BloxHub"
    v27.TextColor3 = Color3.fromRGB(180, 255, 200)
    v27.TextSize = 18
    v27.TextXAlignment = Enum.TextXAlignment.Left
    v27.ZIndex = 34
    local vu28 = Instance.new("TextLabel", v25)
    vu28.Size = UDim2.new(1, - 80, 0, 18)
    vu28.Position = UDim2.new(0, 72, 0, 32)
    vu28.BackgroundTransparency = 1
    vu28.Font = Enum.Font.Gotham
    vu28.Text = "Preparing..."
    vu28.TextColor3 = Color3.fromRGB(220, 230, 220)
    vu28.TextSize = 13
    vu28.TextXAlignment = Enum.TextXAlignment.Left
    vu28.ZIndex = 34
    local v29 = Instance.new("Frame", v25)
    v29.Size = UDim2.new(1, - 32, 0, 8)
    v29.Position = UDim2.new(0, 16, 1, - 16)
    v29.BackgroundColor3 = Color3.fromRGB(44, 54, 65)
    v29.BorderSizePixel = 0
    v29.ZIndex = 34
    Instance.new("UICorner", v29).CornerRadius = UDim.new(0, 4)
    local vu30 = Instance.new("Frame", v29)
    vu30.Size = UDim2.new(0, 0, 1, 0)
    vu30.BackgroundColor3 = Color3.fromRGB(120, 210, 130)
    vu30.BorderSizePixel = 0
    vu30.ZIndex = 35
    Instance.new("UICorner", vu30).CornerRadius = UDim.new(0, 4)
    return function(p31, p32)
        local v33 = math.clamp(p31, 0, 1)
        vu30:TweenSize(UDim2.new(v33, 0, 1, 0), "Out", "Quad", 0.25, true)
        vu28.Text = p32 or ""
    end, function()
        vu23:Destroy()
    end
end
local function vu38(p35)
    if p35 then
        p35(0.1, "Fetching key from server...")
    end
    local v36, v37 = pcall(function()
        return game:HttpGet(vu5)
    end)
    if v36 then
        if p35 then
            p35(0.35, "Key fetched successfully.")
        end
        return string.match(v37, "%S+")
    end
    warn("Failed to fetch key!")
    if p35 then
        p35(0, "Failed to fetch key!")
    end
    return nil
end
local function vu41(p39)
    if p39 then
        p39(0.08, "Checking local key...")
    end
    if isfile and (isfile(vu11) and isfile(vu12)) then
        local v40 = tonumber(readfile(vu12))
        if v40 and os.time() - v40 < vu13 then
            if p39 then
                p39(0.2, "Valid local key found.")
            end
            return readfile(vu11)
        end
    end
    if p39 then
        p39(0.08, "No valid local key found.")
    end
    return nil
end
local function vu44(p42, p43)
    if writefile then
        writefile(vu11, p42)
        writefile(vu12, tostring(os.time()))
        if p43 then
            p43(0.9, "Saving key...")
        end
    end
end
local function vu86(pu45)
    local vu46 = Instance.new("ScreenGui", vu4)
    vu46.Name = "BloxHubKeySystemRFStyle"
    vu46.ResetOnSpawn = false
    vu46.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    local vu47 = Instance.new("Frame", vu46)
    vu47.Size = UDim2.new(0, 750, 0, 450)
    vu47.Position = UDim2.new(0.5, - 375, 0.5, - 225)
    vu47.BackgroundColor3 = Color3.fromRGB(35, 45, 50)
    vu47.BorderSizePixel = 1
    vu47.BorderColor3 = Color3.fromRGB(20, 25, 30)
    vu47.Active = true
    vu47.Draggable = true
    vu47.ClipsDescendants = true
    local v48 = Instance.new("Frame", vu47)
    v48.Size = UDim2.new(1, 0, 0, 40)
    v48.BackgroundColor3 = Color3.fromRGB(25, 30, 35)
    v48.BorderSizePixel = 0
    v48.ZIndex = 2
    local v49 = Instance.new("TextLabel", v48)
    v49.Size = UDim2.new(0, 200, 1, 0)
    v49.Position = UDim2.new(0, 15, 0, 0)
    v49.BackgroundTransparency = 1
    v49.Font = Enum.Font.GothamSemibold
    v49.Text = "BLOXHUB"
    v49.TextColor3 = Color3.fromRGB(210, 215, 220)
    v49.TextSize = 20
    v49.TextXAlignment = Enum.TextXAlignment.Left
    v49.TextYAlignment = Enum.TextYAlignment.Center
    local v50 = Instance.new("TextButton", v48)
    v50.Size = UDim2.new(0, 30, 0, 30)
    v50.Position = UDim2.new(1, - 35, 0.5, - 15)
    v50.BackgroundColor3 = Color3.fromRGB(25, 30, 35)
    v50.BorderSizePixel = 0
    v50.Font = Enum.Font.SourceSansBold
    v50.Text = "\226\156\149"
    v50.TextColor3 = Color3.fromRGB(150, 155, 160)
    v50.TextSize = 22
    v50.ZIndex = 3
    local v51 = Instance.new("TextButton", v48)
    v51.Size = UDim2.new(0, 30, 0, 30)
    v51.Position = UDim2.new(1, - 70, 0.5, - 15)
    v51.BackgroundColor3 = Color3.fromRGB(25, 30, 35)
    v51.BorderSizePixel = 0
    v51.Font = Enum.Font.SourceSansBold
    v51.Text = "\226\128\148"
    v51.TextColor3 = Color3.fromRGB(150, 155, 160)
    v51.TextSize = 22
    v51.ZIndex = 3
    local function v55(pu52, pu53, pu54)
        pu52.MouseEnter:Connect(function()
            pu52.TextColor3 = pu53
        end)
        pu52.MouseLeave:Connect(function()
            pu52.TextColor3 = pu54
        end)
    end
    v55(v50, Color3.fromRGB(231, 76, 60), Color3.fromRGB(150, 155, 160))
    v55(v51, Color3.fromRGB(200, 200, 200), Color3.fromRGB(150, 155, 160))
    local v56 = Instance.new("ImageLabel", vu47)
    v56.Size = UDim2.new(0.55, 0, 1, - v48.Size.Y.Offset)
    v56.Position = UDim2.new(0, 0, 0, v48.Size.Y.Offset)
    v56.BackgroundColor3 = Color3.fromRGB(20, 25, 30)
    v56.Image = vu9
    v56.ScaleType = Enum.ScaleType.Crop
    v56.BorderSizePixel = 0
    v56.ZIndex = 1
    local v57 = Instance.new("Frame", vu47)
    v57.Size = UDim2.new(0.45, 0, 1, - v48.Size.Y.Offset)
    v57.Position = UDim2.new(0.55, 0, 0, v48.Size.Y.Offset)
    v57.BackgroundColor3 = Color3.fromRGB(35, 45, 50)
    v57.BorderSizePixel = 0
    v57.ZIndex = 1
    local v58 = Instance.new("TextLabel", v57)
    v58.Size = UDim2.new(1, - 80, 0, 50)
    v58.Position = UDim2.new(0, 40, 0, 40)
    v58.BackgroundTransparency = 1
    v58.Font = Enum.Font.GothamSemibold
    v58.Text = "Key System"
    v58.TextColor3 = Color3.fromRGB(220, 225, 230)
    v58.TextSize = 28
    v58.TextXAlignment = Enum.TextXAlignment.Left
    v58.ZIndex = 2
    local v59 = Instance.new("TextLabel", v57)
    v59.Size = UDim2.new(1, - 80, 0, 20)
    v59.Position = UDim2.new(0, 40, 0, 70)
    v59.BackgroundTransparency = 1
    v59.Font = Enum.Font.GothamSemibold
    v59.Text = ""
    v59.TextColor3 = Color3.fromRGB(255, 185, 80)
    v59.TextSize = 14
    v59.TextXAlignment = Enum.TextXAlignment.Left
    v59.ZIndex = 2
    local v60 = Instance.new("TextLabel", v57)
    v60.Size = UDim2.new(1, - 80, 0, 20)
    v60.Position = UDim2.new(0, 40, 0, 90)
    v60.BackgroundTransparency = 1
    v60.Font = Enum.Font.Gotham
    v60.Text = "Key"
    v60.TextColor3 = Color3.fromRGB(160, 170, 175)
    v60.TextSize = 14
    v60.TextXAlignment = Enum.TextXAlignment.Left
    v60.ZIndex = 2
    local vu61 = Instance.new("TextBox", v57)
    vu61.Size = UDim2.new(1, - 80, 0, 40)
    vu61.Position = UDim2.new(0, 40, 0, 115)
    vu61.BackgroundColor3 = Color3.fromRGB(28, 38, 43)
    vu61.BorderSizePixel = 1
    vu61.BorderColor3 = Color3.fromRGB(50, 60, 65)
    vu61.Font = Enum.Font.Gotham
    vu61.PlaceholderText = "Enter your key"
    vu61.PlaceholderColor3 = Color3.fromRGB(100, 110, 115)
    vu61.Text = ""
    vu61.TextColor3 = Color3.fromRGB(210, 215, 220)
    vu61.TextSize = 16
    vu61.ClearTextOnFocus = false
    vu61.ZIndex = 2
    local v62 = Instance.new("UIPadding", vu61)
    v62.PaddingLeft = UDim.new(0, 10)
    v62.PaddingRight = UDim.new(0, 10)
    local v63 = Instance.new("TextButton", v57)
    v63.Size = UDim2.new(1, - 80, 0, 40)
    v63.Position = UDim2.new(0, 40, 0, 165)
    v63.BackgroundColor3 = Color3.fromRGB(40, 50, 55)
    v63.BorderSizePixel = 1
    v63.BorderColor3 = Color3.fromRGB(60, 70, 75)
    v63.Font = Enum.Font.GothamSemibold
    v63.Text = "SUBMIT KEY"
    v63.TextColor3 = Color3.fromRGB(220, 225, 230)
    v63.TextSize = 16
    v63.ZIndex = 2
    local v64 = Instance.new("TextButton", v57)
    v64.Size = UDim2.new(0.5, - 45, 0, 35)
    v64.Position = UDim2.new(0, 40, 0, 215)
    v64.BackgroundColor3 = Color3.fromRGB(50, 60, 65)
    v64.BorderSizePixel = 1
    v64.BorderColor3 = Color3.fromRGB(70, 80, 85)
    v64.Font = Enum.Font.Gotham
    v64.Text = "Get Key (Browser)"
    v64.TextColor3 = Color3.fromRGB(180, 190, 195)
    v64.TextSize = 13
    v64.ZIndex = 2
    local v65 = Instance.new("TextButton", v57)
    v65.Size = UDim2.new(0.5, - 45, 0, 35)
    v65.Position = UDim2.new(0.5, 5, 0, 215)
    v65.BackgroundColor3 = Color3.fromRGB(50, 60, 65)
    v65.BorderSizePixel = 1
    v65.BorderColor3 = Color3.fromRGB(70, 80, 85)
    v65.Font = Enum.Font.Gotham
    v65.Text = "Copy Link"
    v65.TextColor3 = Color3.fromRGB(180, 190, 195)
    v65.TextSize = 13
    v65.ZIndex = 2
    local vu66, v67 = vu22(v57)
    local function v72(pu68)
        local vu69 = pu68.BackgroundColor3
        local v70 = vu69
        local vu71 = vu69.Lerp(v70, Color3.new(1, 1, 1), 0.1)
        pu68.MouseEnter:Connect(function()
            pu68.BackgroundColor3 = vu71
        end)
        pu68.MouseLeave:Connect(function()
            pu68.BackgroundColor3 = vu69
        end)
    end
    v72(v63)
    v72(v64)
    v72(v65)
    v51.MouseButton1Click:Connect(function()
        vu47.Visible = not vu47.Visible
    end)
    v50.MouseButton1Click:Connect(function()
        vu46:Destroy()
    end)
    v64.MouseButton1Click:Connect(function()
        vu3:SetCore("SendNotification", {
            Title = "BloxHub",
            Text = "Opening key page in browser...",
            Duration = 5
        })
        if syn and syn.request then
            pcall(function()
                local v73 = {
                    Url = vu8,
                    Method = "GET"
                }
                syn.request(v73)
            end)
        elseif KRNL_LOADED and KRNL_LOADED.OpenURL then
            pcall(function()
                KRNL_LOADED:OpenURL(vu8)
            end)
        elseif PROXO_LOADED and PROXO_LOADED.OpenURL then
            pcall(function()
                PROXO_LOADED:OpenURL(vu8)
            end)
        elseif FLUXUS_LOADED and FLUXUS_LOADED.OpenURL then
            pcall(function()
                FLUXUS_LOADED:OpenURL(vu8)
            end)
        elseif request then
            pcall(function()
                local v74 = {
                    Url = vu8,
                    Method = "GET"
                }
                request(v74)
            end)
        elseif identifyexecutor then
            local v75, _ = identifyexecutor()
            if string.find(string.lower(v75 or ""), "synapse") then
                pcall(function()
                    local v76 = {
                        Url = vu8,
                        Method = "GET"
                    }
                    syn.request(v76)
                end)
            else
                setclipboard(vu8)
                vu3:SetCore("SendNotification", {
                    Title = "BloxHub",
                    Text = "Browser open not supported. Link copied!",
                    Duration = 5
                })
            end
        else
            setclipboard(vu8)
            vu3:SetCore("SendNotification", {
                Title = "BloxHub",
                Text = "Browser open not supported. Link copied to clipboard!",
                Duration = 5
            })
        end
    end)
    v65.MouseButton1Click:Connect(function()
        setclipboard(vu8)
        vu3:SetCore("SendNotification", {
            Title = "BloxHub",
            Text = "Link copied to clipboard!",
            Duration = 5
        })
    end)
    v63.MouseButton1Click:Connect(function()
        vu66(0.1, "Processing key...")
        local v77 = vu61.Text
        if string.gsub(v77, "%s", "") ~= "" then
            vu66(0.3, "Fetching server key...")
            local v78 = vu38(vu66)
            if v78 then
                vu66(0.7, "Checking key validity...")
                if v77 == v78 then
                    vu3:SetCore("SendNotification", {
                        Title = "BloxHub",
                        Text = "Key Verified! Loading...",
                        Duration = 1
                    })
                    vu44(v77, vu66)
                    vu66(1, "Key is valid! Continuing...")
                    wait(0.5)
                    vu46:Destroy()
                    if pu45 then
                        pu45()
                    end
                else
                    vu66(0.75, "Checking premium key...")
                    local vu79 = vu6 .. "?key=" .. vu1:UrlEncode(v77)
                    local vu80 = nil
                    local v81 = false
                    pcall(function()
                        if syn and syn.request then
                            local v82 = {
                                Url = vu79,
                                Method = "GET"
                            }
                            vu80 = syn.request(v82)
                        elseif http_request then
                            local v83 = {
                                Url = vu79,
                                Method = "GET"
                            }
                            vu80 = http_request(v83)
                        elseif request then
                            local v84 = {
                                Url = vu79,
                                Method = "GET"
                            }
                            vu80 = request(v84)
                        elseif fluxus and fluxus.request then
                            local v85 = {
                                Url = vu79,
                                Method = "GET"
                            }
                            vu80 = fluxus.request(v85)
                        end
                    end)
                    if vu80 and vu80.StatusCode == 200 then
                        v81 = vu1:JSONDecode(vu80.Body).valid and true or v81
                    end
                    if v81 then
                        vu3:SetCore("SendNotification", {
                            Title = "BloxHub",
                            Text = "Premium Key Verified! Loading...",
                            Duration = 1
                        })
                        vu44(v77, vu66)
                        vu66(1, "Premium key valid! Continuing...")
                        wait(0.5)
                        vu46:Destroy()
                        if pu45 then
                            pu45()
                        end
                    else
                        vu3:SetCore("SendNotification", {
                            Title = "BloxHub",
                            Text = "Invalid Key! Please try again.",
                            Duration = 3
                        })
                        vu66(0, "Wrong key.")
                        vu61.Text = ""
                    end
                end
            else
                vu3:SetCore("SendNotification", {
                    Title = "BloxHub",
                    Text = "Error fetching key. Try again.",
                    Duration = 5
                })
                vu66(0, "Failed to fetch key.")
            end
        else
            vu3:SetCore("SendNotification", {
                Title = "BloxHub",
                Text = "Please enter a key!",
                Duration = 3
            })
            vu66(0, "Key is empty.")
            return
        end
    end)
    return vu46, v59, vu61, vu66, v67
end
local function vu93()
    local v87, v88 = vu34()
    v87(0.15, "Fetching script...")
    local v89, vu90 = pcall(function()
        return game:HttpGet(vu10)
    end)
    if v89 and (type(vu90) == "string" and # vu90 > 0) then
        v87(0.8, "Executing script...")
        local v91, v92 = pcall(function()
            loadstring(vu90)()
        end)
        if v91 then
            v87(1, "Done!")
        else
            v87(1, "Script Error!")
            vu3:SetCore("SendNotification", {
                Title = "BloxHub",
                Text = "Script Error: " .. tostring(v92),
                Duration = 5
            })
        end
    else
        v87(1, "Failed to fetch script!")
        vu3:SetCore("SendNotification", {
            Title = "BloxHub",
            Text = "Failed to fetch main script!",
            Duration = 5
        })
    end
    wait(1)
    v88()
end;
(function()
    local vu94, vu95, vu96, vu97, _ = vu86(vu93)
    vu97(0.05, "Initializing key system...")
    local vu98 = vu41(vu97)
    if vu98 then
        vu97(0.5, "Auto login, checking HWID...")
        vu95.Text = "Checking your key HWID..."
        vu96.Text = vu98
        task.spawn(function()
            wait(1)
            vu97(0.7, "Verifying key with server...")
            if vu98 ~= vu38(vu97) then
                local vu99 = vu6 .. "?key=" .. vu1:UrlEncode(vu98)
                local vu100 = nil
                local v101 = false
                pcall(function()
                    if syn and syn.request then
                        local v102 = {
                            Url = vu99,
                            Method = "GET"
                        }
                        vu100 = syn.request(v102)
                    elseif http_request then
                        local v103 = {
                            Url = vu99,
                            Method = "GET"
                        }
                        vu100 = http_request(v103)
                    elseif request then
                        local v104 = {
                            Url = vu99,
                            Method = "GET"
                        }
                        vu100 = request(v104)
                    elseif fluxus and fluxus.request then
                        local v105 = {
                            Url = vu99,
                            Method = "GET"
                        }
                        vu100 = fluxus.request(v105)
                    end
                end)
                if vu100 and vu100.StatusCode == 200 then
                    v101 = vu1:JSONDecode(vu100.Body).valid and true or v101
                end
                if v101 then
                    vu3:SetCore("SendNotification", {
                        Title = "BloxHub",
                        Text = "Auto-Login Premium Success! Loading...",
                        Duration = 1
                    })
                    vu44(vu98, vu97)
                    vu97(1, "Auto login premium success!")
                    wait(0.5)
                    vu94:Destroy()
                    vu93()
                else
                    vu95.Text = ""
                    vu96.Text = ""
                    vu97(0, "Auto login key is not valid!")
                end
            else
                vu3:SetCore("SendNotification", {
                    Title = "BloxHub",
                    Text = "Auto-Login Success! Loading...",
                    Duration = 1
                })
                vu44(vu98, vu97)
                vu97(1, "Auto login success!")
                wait(0.5)
                vu94:Destroy()
                vu93()
            end
        end)
    else
        vu97(0.2, "No valid local key, please input your key.")
    end
end)()