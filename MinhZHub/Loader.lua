--[[
    MinhZ Hub Loader - De-minified & Annotated
    Original comment: مرحباً يا خاسر سكيدز (Hello, loser skids)
]]

--================================================================================
--// SERVICES & INITIAL SETUP
--================================================================================
local placeId = game.PlaceId
local tweenService = game:GetService('TweenService')
local teleportService = game:GetService('TeleportService')
local coreGui = game:GetService('CoreGui')
local players = game:GetService('Players')
local userInputService = game:GetService('UserInputService')

if getgenv()['Skip-Loader'] == nil then
    getgenv()['Skip-Loader'] = false
end

--================================================================================
--// SUPPORTED GAMES
--================================================================================
local supportedGames = {
    {id = 123974602339071, name = 'Just A Baseplate'},
    {id = 88308889239232, name = 'Green Baseplate'},
    {id = 155615604, name = 'Prison Life'},
    {id = 15385224902, name = 'Murderers VS Sheriffs New Players'},
    {id = 12355337193, name = 'Murderers VS Sheriffs'}
}

--================================================================================
--// SCRIPT LOADER
--================================================================================
local function LoadMainScript(gameId)
    if gameId == 123974602339071 then
        loadstring(game:HttpGet(('aul.etalpesaB-A-tsuJ-ZhniM/niam/sdaeh/sfer/buH-ZhniM/todugn4321hniM/moc.tnetnocresubuhtig.war//:sptth'):reverse()))()
    elseif gameId == 88308889239232 then
        loadstring(game:HttpGet(('aul.etalpesaB-A-tsuJ-ZhniM/niam/sdaeh/sfer/buH-ZhniM/todugn4321hniM/moc.tnetnocresubuhtig.war//:sptth'):reverse()))()
    elseif gameId == 155615604 then
        loadstring(game:HttpGet(('aul.efiL-nosirP-ZhniM/niam/sdaeh/sfer/buH-ZhniM/todugn4321hniM/moc.tnetnocresubuhtig.war//:sptth'):reverse()))()
    elseif gameId == 15385224902 then
        loadstring(game:HttpGet(('aul.sffirehS-SV-sreredruM-ZhniM/niam/sdaeh/sfer/buH-ZhniM/todugn4321hniM/moc.tnetnocresubuhtig.war//:sptth'):reverse()))()
    elseif gameId == 12355337193 then
        loadstring(game:HttpGet(('aul.sffirehS-SV-sreredruM-ZhniM/niam/sdaeh/sfer/buH-ZhniM/todugn4321hniM/moc.tnetnocresubuhtig.war//:sptth'):reverse()))()
    end
end

-- Skip loader functionality
if getgenv()['Skip-Loader'] == true then
    local isSupported = false
    for _, gameInfo in pairs(supportedGames) do
        if gameInfo.id == placeId then
            isSupported = true
            LoadMainScript(placeId)
            break
        end
    end
    return
end

--================================================================================
--// LOADING SCREEN UI
--================================================================================
local function ShowLoadingScreen()
    if coreGui:FindFirstChild('MinhZLoading') then
        coreGui.MinhZLoading:Destroy()
    end

    local loadingGui = Instance.new('ScreenGui', coreGui)
    loadingGui.Name = 'MinhZLoading'

    local mainFrame = Instance.new('Frame', loadingGui)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20, 18, 30)
    mainFrame.BackgroundTransparency = 0.1
    mainFrame.Position = UDim2.new(0.5, -180, 0.5, -85)
    mainFrame.Size = UDim2.new(0, 360, 0, 170)

    local corner = Instance.new('UICorner', mainFrame)
    corner.CornerRadius = UDim.new(0, 15)

    local gradient = Instance.new('UIGradient', mainFrame)
    gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 25, 45)), ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 18, 30))}
    gradient.Rotation = 45

    local closeButton = Instance.new('TextButton', mainFrame)
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -35, 0, 5)
    closeButton.Text = 'X'
    closeButton.Font = Enum.Font.GothamBold
    closeButton.TextSize = 18
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
    closeButton.TextColor3 = Color3.new(1, 1, 1)
    closeButton.BorderSizePixel = 0
    Instance.new('UICorner', closeButton).CornerRadius = UDim.new(0, 15)
    closeButton.MouseButton1Click:Connect(function()
        loadingGui:Destroy()
    end)

    local titleLabel = Instance.new('TextLabel', mainFrame)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Size = UDim2.new(1, -40, 0, 40)
    titleLabel.Position = UDim2.new(0, 20, 0, 0)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Text = '⚡ MinhZ Hub Loader ⚡'
    titleLabel.TextColor3 = Color3.fromRGB(200, 80, 180)
    titleLabel.TextSize = 24
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local statusLabel = Instance.new('TextLabel', mainFrame)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Position = UDim2.new(0, 0, 0.35, 0)
    statusLabel.Size = UDim2.new(1, 0, 0, 20)
    statusLabel.Font = Enum.Font.Gotham
    statusLabel.Text = 'Starting...'
    statusLabel.TextColor3 = Color3.new(1, 1, 1)
    statusLabel.TextSize = 13

    local percentageLabel = Instance.new('TextLabel', mainFrame)
    percentageLabel.BackgroundTransparency = 1
    percentageLabel.Position = UDim2.new(0, 0, 0.5, 0)
    percentageLabel.Size = UDim2.new(1, 0, 0, 20)
    percentageLabel.Font = Enum.Font.GothamBold
    percentageLabel.Text = '0%'
    percentageLabel.TextColor3 = Color3.fromRGB(200, 80, 180)
    percentageLabel.TextSize = 16

    local progressBarBg = Instance.new('Frame', mainFrame)
    progressBarBg.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
    progressBarBg.BackgroundTransparency = 0.5
    progressBarBg.Position = UDim2.new(0.08, 0, 0.7, 0)
    progressBarBg.Size = UDim2.new(0.84, 0, 0, 8)
    progressBarBg.BorderSizePixel = 0
    Instance.new('UICorner', progressBarBg).CornerRadius = UDim.new(0, 4)

    local progressBarFill = Instance.new('Frame', progressBarBg)
    progressBarFill.BackgroundColor3 = Color3.fromRGB(200, 80, 180)
    progressBarFill.Size = UDim2.new(0, 0, 1, 0)
    progressBarFill.BorderSizePixel = 0
    Instance.new('UICorner', progressBarFill).CornerRadius = UDim.new(0, 4)

    local fillGradient = Instance.new('UIGradient', progressBarFill)
    fillGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 80, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 100, 255))}

    -- Draggable functionality
    local isDragging, dragStart, frameStart
    titleLabel.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = true
            dragStart = input.Position
            frameStart = mainFrame.Position
        end
    end)
    userInputService.InputChanged:Connect(function(input)
        if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(frameStart.X.Scale, frameStart.X.Offset + delta.X, frameStart.Y.Scale, frameStart.Y.Offset + delta.Y)
        end
    end)
    userInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = false
        end
    end)

    -- UI update logic
    local currentPercentage = 0
    local function UpdateUI(targetPercentage, text, delay)
        statusLabel.Text = text
        if delay then task.wait(delay) end
        
        local startPercentage = currentPercentage
        local steps = (targetPercentage - startPercentage) * 2
        local increment = (targetPercentage - startPercentage) / steps
        
        for i = 1, steps do
            currentPercentage = startPercentage + (increment * i)
            if currentPercentage > targetPercentage then currentPercentage = targetPercentage end
            
            percentageLabel.Text = math.floor(currentPercentage) .. '%'
            progressBarFill.Size = UDim2.new(currentPercentage / 100, 0, 1, 0)
            task.wait(0.015)
        end
        
        currentPercentage = targetPercentage
        percentageLabel.Text = currentPercentage .. '%'
        progressBarFill.Size = UDim2.new(currentPercentage / 100, 0, 1, 0)
    end

    -- Loading sequence
    UpdateUI(22, 'Wait For Loading..')
    UpdateUI(46, 'Check For New Update...')
    UpdateUI(78, 'Check Game...', 2)

    local matchedGame = false
    for _, gameInfo in pairs(supportedGames) do
        if gameInfo.id == placeId then
            matchedGame = gameInfo
            break
        end
    end

    if matchedGame then
        UpdateUI(98, 'Game Found!')
        UpdateUI(100, 'Enjoy!!')
        task.wait(0.5)
        loadingGui:Destroy()
        LoadMainScript(placeId)
    else
        -- Handle unsupported game
        statusLabel.Text = '⚠️ Your Game Is Not Supported'
        statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        percentageLabel.Text = 'FAILED'
        percentageLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        
        -- Create buttons for unsupported state
        local buttonFrame = Instance.new('Frame', mainFrame)
        buttonFrame.Size = UDim2.new(0.9, 0, 0, 32)
        buttonFrame.Position = UDim2.new(0.05, 0, 0.78, 0)
        buttonFrame.BackgroundTransparency = 1

        local viewGamesButton = Instance.new('TextButton', buttonFrame)
        viewGamesButton.Size = UDim2.new(0.48, 0, 1, 0)
        viewGamesButton.Position = UDim2.new(0, 0, 0, 0)
        viewGamesButton.Text = '📋 View Games'
        viewGamesButton.Font = Enum.Font.GothamBold
        viewGamesButton.BackgroundColor3 = Color3.fromRGB(200, 80, 180)
        viewGamesButton.TextColor3 = Color3.new(1, 1, 1)
        viewGamesButton.TextSize = 11
        viewGamesButton.BorderSizePixel = 0
        Instance.new('UICorner', viewGamesButton).CornerRadius = UDim.new(0, 6)

        local discordButton = Instance.new('TextButton', buttonFrame)
        discordButton.Size = UDim2.new(0.48, 0, 1, 0)
        discordButton.Position = UDim2.new(0.52, 0, 0, 0)
        discordButton.Text = '💬 Discord'
        discordButton.Font = Enum.Font.GothamBold
        discordButton.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
        discordButton.TextColor3 = Color3.new(1, 1, 1)
        discordButton.TextSize = 11
        discordButton.BorderSizePixel = 0
        Instance.new('UICorner', discordButton).CornerRadius = UDim.new(0, 6)

        discordButton.MouseButton1Click:Connect(function()
            setclipboard('https://discord.gg/q2DzqWgpTC')
            discordButton.Text = '✅ Copied!'
            task.wait(1.5)
            discordButton.Text = '💬 Discord'
        end)
        
        viewGamesButton.MouseButton1Click:Connect(function()
            -- Hide old elements
            viewGamesButton.Visible = false
            discordButton.Visible = false
            statusLabel.Visible = false
            percentageLabel.Visible = false
            progressBarBg.Visible = false
            titleLabel.Text = '📋 Supported Games'
            titleLabel.Position = UDim2.new(0, 20, 0, 0)
            titleLabel.TextXAlignment = Enum.TextXAlignment.Left

            -- Animate frame expansion
            local expandAnimation = tweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {Size = UDim2.new(0, 380, 0, 320), Position = UDim2.new(0.5, -190, 0.5, -160)})
            expandAnimation:Play()
            expandAnimation.Completed:Wait()
            
            -- Create game list
            local gameListFrame = Instance.new('ScrollingFrame', mainFrame)
            gameListFrame.Name = 'GameList'
            gameListFrame.Size = UDim2.new(0.92, 0, 0.65, 0)
            gameListFrame.Position = UDim2.new(0.04, 0, 0.18, 0)
            gameListFrame.BackgroundTransparency = 1
            gameListFrame.BorderSizePixel = 0
            gameListFrame.ScrollBarThickness = 4
            gameListFrame.ScrollBarImageColor3 = Color3.fromRGB(200, 80, 180)
            gameListFrame.CanvasSize = UDim2.new(0, 0, 0, #supportedGames * 52)
            
            for i, gameInfo in pairs(supportedGames) do
                local gameEntry = Instance.new('Frame', gameListFrame)
                gameEntry.Size = UDim2.new(0.96, 0, 0, 46)
                gameEntry.Position = UDim2.new(0.02, 0, 0, (i - 1) * 52)
                gameEntry.BackgroundColor3 = Color3.fromRGB(38, 30, 50)
                gameEntry.BorderSizePixel = 0
                Instance.new('UICorner', gameEntry).CornerRadius = UDim.new(0, 8)

                local gameName = Instance.new('TextLabel', gameEntry)
                gameName.Text = gameInfo.name
                gameName.Size = UDim2.new(0.58, 0, 1, 0)
                gameName.TextColor3 = Color3.new(1, 1, 1)
                gameName.Font = Enum.Font.GothamBold
                gameName.TextSize = 12
                gameName.BackgroundTransparency = 1
                gameName.TextXAlignment = Enum.TextXAlignment.Left
                gameName.Position = UDim2.new(0.05, 0, 0, 0)

                local joinButton = Instance.new('TextButton', gameEntry)
                joinButton.Text = 'JOIN'
                joinButton.Size = UDim2.new(0.3, 0, 0.65, 0)
                joinButton.Position = UDim2.new(0.66, 0, 0.175, 0)
                joinButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
                joinButton.Font = Enum.Font.GothamBold
                joinButton.TextColor3 = Color3.new(1, 1, 1)
                joinButton.TextSize = 11
                joinButton.BorderSizePixel = 0
                Instance.new('UICorner', joinButton).CornerRadius = UDim.new(0, 6)

                joinButton.MouseEnter:Connect(function() tweenService:Create(joinButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 230, 120)}):Play() end)
                joinButton.MouseLeave:Connect(function() tweenService:Create(joinButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 200, 100)}):Play() end)
                joinButton.MouseButton1Click:Connect(function()
                    joinButton.Text = 'Joining...'
                    joinButton.BackgroundColor3 = Color3.fromRGB(255, 150, 0)
                    teleportService:Teleport(gameInfo.id, players.LocalPlayer)
                end)
            end

            local backButton = Instance.new('TextButton', mainFrame)
            backButton.Name = 'BackBtn'
            backButton.Size = UDim2.new(0.4, 0, 0, 32)
            backButton.Position = UDim2.new(0.3, 0, 0.88, 0)
            backButton.Text = '← Back'
            backButton.Font = Enum.Font.GothamBold
            backButton.BackgroundColor3 = Color3.fromRGB(60, 50, 70)
            backButton.TextColor3 = Color3.new(1, 1, 1)
            backButton.TextSize = 12
            backButton.BorderSizePixel = 0
            Instance.new('UICorner', backButton).CornerRadius = UDim.new(0, 6)

            backButton.MouseButton1Click:Connect(function()
                if gameListFrame then gameListFrame:Destroy() end
                if backButton then backButton:Destroy() end

                titleLabel.Text = '⚡ MinhZ Hub Loader ⚡'
                titleLabel.Position = UDim2.new(0, 20, 0, 0)
                titleLabel.TextXAlignment = Enum.TextXAlignment.Left

                local shrinkAnimation = tweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {Size = UDim2.new(0, 360, 0, 170), Position = UDim2.new(0.5, -180, 0.5, -85)})
                shrinkAnimation:Play()
                shrinkAnimation.Completed:Wait()

                statusLabel.Visible = true
                percentageLabel.Visible = true
                progressBarBg.Visible = true
                viewGamesButton.Visible = true
                discordButton.Visible = true
            end)
        end)
    end
end

ShowLoadingScreen()
