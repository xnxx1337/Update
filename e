-- MyLibrary (ModuleScript)
local MyLibrary = {}
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- === FONCTIONS POUR CRÉER DES ÉLÉMENTS ===

-- FENÊTRE PRINCIPALE
MyLibrary.new = function(options)
    local self = setmetatable({}, {__index = MyLibrary})

    -- ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "MyLibraryGui"
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.IgnoreGuiInset = true

    -- Fenêtre principale
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Parent = screenGui
    mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    mainFrame.BorderSizePixel = 0
    mainFrame.Position = UDim2.new(0.5, -300, 0.5, -250)
    mainFrame.Size = UDim2.new(0, 600, 0, 500)
    mainFrame.Visible = false

    -- Barre de titre
    local topBar = Instance.new("TextLabel")
    topBar.Name = "TopBar"
    topBar.Parent = mainFrame
    topBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    topBar.BorderSizePixel = 0
    topBar.Size = UDim2.new(1, 0, 0, 30)
    topBar.Font = Enum.Font.GothamSemibold
    topBar.Text = "  " .. (options.Name or "My Library")
    topBar.TextColor3 = Color3.fromRGB(255, 255, 255)
    topBar.TextXAlignment = Enum.TextXAlignment.Left

    -- Conteneur pour les onglets
    local tabContainer = Instance.new("Frame")
    tabContainer.Name = "TabContainer"
    tabContainer.Parent = mainFrame
    tabContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    tabContainer.BorderSizePixel = 0
    tabContainer.Position = UDim2.new(0, 0, 0, 30)
    tabContainer.Size = UDim2.new(0, 150, 1, -30)

    -- Contenu des onglets
    local contentContainer = Instance.new("Frame")
    contentContainer.Name = "ContentContainer"
    contentContainer.Parent = mainFrame
    contentContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    contentContainer.BorderSizePixel = 0
    contentContainer.Position = UDim2.new(0, 150, 0, 30)
    contentContainer.Size = UDim2.new(1, -150, 1, -30)

    -- Logique de drag
    local dragging = false
    local dragStart, startPos
    topBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    self.Gui = screenGui
    self.MainFrame = mainFrame
    self.TabContainer = tabContainer
    self.ContentContainer = contentContainer
    self.Tabs = {}
    self.CurrentTab = nil
    self.Options = {} -- Stocke toutes les options pour la sauvegarde
    self.Elements = {} -- Stocke les références aux éléments pour le chargement
    self.ToggleKey = options.Key or Enum.KeyCode.RightShift

    -- Logique de touche pour ouvrir/fermer
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == self.ToggleKey then
            mainFrame.Visible = not mainFrame.Visible
        end
    end)

    return self
end

-- ONGLET
function MyLibrary:Tab(options)
    local self = setmetatable({}, {__index = MyLibrary})
    self.Parent = options.Parent
    self.CurrentTab = nil

    local tabButton = Instance.new("TextButton")
    tabButton.Parent = self.Parent.TabContainer
    tabButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    tabButton.BorderSizePixel = 0
    tabButton.Size = UDim2.new(1, 0, 0, 30)
    tabButton.Font = Enum.Font.Gotham
    tabButton.Text = options.Name or "Tab"
    tabButton.TextColor3 = Color3.fromRGB(150, 150, 150)
    tabButton.TextXAlignment = Enum.TextXAlignment.Left
    tabButton.Position = UDim2.new(0, 0, 0, 30 * #self.Parent.Tabs)

    local tabContent = Instance.new("ScrollingFrame")
    tabContent.Name = "TabContent"
    tabContent.Parent = self.Parent.ContentContainer
    tabContent.BackgroundTransparency = 1
    tabContent.BorderSizePixel = 0
    tabContent.Size = UDim2.new(1, -10, 1, -10)
    tabContent.Position = UDim2.new(0, 5, 0, 5)
    tabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabContent.ScrollBarThickness = 5
    tabContent.Visible = (#self.Parent.Tabs == 0)

    tabButton.MouseButton1Click:Connect(function()
        for _, tab in pairs(self.Parent.Tabs) do
            tab.Content.Visible = false
            tab.Button.TextColor3 = Color3.fromRGB(150, 150, 150)
        end
        tabContent.Visible = true
        tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        self.CurrentTab = {Content = tabContent, YOffset = 0}
    end)

    local tab = {Button = tabButton, Content = tabContent}
    table.insert(self.Parent.Tabs, tab)
    self.CurrentTab = {Content = tabContent, YOffset = 0}
    return self
end

-- SECTION
function MyLibrary:Section(options)
    local sectionFrame = Instance.new("Frame")
    sectionFrame.Parent = self.CurrentTab.Content
    sectionFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    sectionFrame.BorderSizePixel = 0
    sectionFrame.Size = UDim2.new(1, 0, 0, 25)
    sectionFrame.Position = UDim2.new(0, 0, 0, self.CurrentTab.YOffset)

    local sectionLabel = Instance.new("TextLabel")
    sectionLabel.Parent = sectionFrame
    sectionLabel.BackgroundTransparency = 1
    sectionLabel.Size = UDim2.new(1, 0, 1, 0)
    sectionLabel.Font = Enum.Font.GothamSemibold
    sectionLabel.Text = "  " .. (options.Name or "Section")
    sectionLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    sectionLabel.TextXAlignment = Enum.TextXAlignment.Left

    self.CurrentTab.YOffset = self.CurrentTab.YOffset + 30
    self.CurrentTab.Content.CanvasSize = UDim2.new(0, 0, 0, self.CurrentTab.YOffset + 10)
    return self
end

-- TOGGLE
function MyLibrary:Toggle(options)
    local flag = options.Flag or "toggle_" .. #self.Parent.Options
    self.Parent.Options[flag] = options.Default or false

    local toggleFrame = Instance.new("TextButton")
    toggleFrame.Parent = self.CurrentTab.Content
    toggleFrame.BackgroundTransparency = 1
    toggleFrame.Size = UDim2.new(1, 0, 0, 25)
    toggleFrame.Position = UDim2.new(0, 0, 0, self.CurrentTab.YOffset)
    toggleFrame.Text = ""
    toggleFrame.TextXAlignment = Enum.TextXAlignment.Left

    local toggleButton = Instance.new("TextButton")
    toggleButton.Parent = toggleFrame
    toggleButton.BackgroundColor3 = self.Parent.Options[flag] and Color3.fromRGB(0, 150, 255) or Color3.fromRGB(40, 40, 40)
    toggleButton.BorderSizePixel = 0
    toggleButton.Position = UDim2.new(0, 10, 0, 5)
    toggleButton.Size = UDim2.new(0, 15, 0, 15)
    toggleButton.Font = Enum.Font.SourceSans
    toggleButton.Text = ""
    toggleButton.AutoButtonColor = false

    local toggleLabel = Instance.new("TextLabel")
    toggleLabel.Parent = toggleFrame
    toggleLabel.BackgroundTransparency = 1
    toggleLabel.Position = UDim2.new(0, 35, 0, 0)
    toggleLabel.Size = UDim2.new(1, -35, 1, 0)
    toggleLabel.Font = Enum.Font.Gotham
    toggleLabel.Text = options.Name or "Toggle"
    toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleLabel.TextXAlignment = Enum.TextXAlignment.Left

    self.Parent.Elements[flag] = {Type = "Toggle", Element = toggleButton, Options = options}
    
    toggleButton.MouseButton1Click:Connect(function()
        self.Parent.Options[flag] = not self.Parent.Options[flag]
        toggleButton.BackgroundColor3 = self.Parent.Options[flag] and Color3.fromRGB(0, 150, 255) or Color3.fromRGB(40, 40, 40)
        if options.Callback then options.Callback(self.Parent.Options[flag]) end
    end)

    self.CurrentTab.YOffset = self.CurrentTab.YOffset + 30
    self.CurrentTab.Content.CanvasSize = UDim2.new(0, 0, 0, self.CurrentTab.YOffset + 10)
    return self
end

-- SLIDER
function MyLibrary:Slider(options)
    local flag = options.Flag or "slider_" .. #self.Parent.Options
    self.Parent.Options[flag] = options.Default or options.Min

    local sliderFrame = Instance.new("Frame")
    sliderFrame.Parent = self.CurrentTab.Content
    sliderFrame.BackgroundTransparency = 1
    sliderFrame.Size = UDim2.new(1, 0, 0, 40)
    sliderFrame.Position = UDim2.new(0, 0, 0, self.CurrentTab.YOffset)

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Parent = sliderFrame
    nameLabel.BackgroundTransparency = 1
    nameLabel.Position = UDim2.new(0, 10, 0, 0)
    nameLabel.Size = UDim2.new(0.5, 0, 0, 15)
    nameLabel.Font = Enum.Font.Gotham
    nameLabel.Text = options.Name or "Slider"
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left

    local valueLabel = Instance.new("TextLabel")
    valueLabel.Parent = sliderFrame
    valueLabel.BackgroundTransparency = 1
    valueLabel.Position = UDim2.new(1, -60, 0, 0)
    valueLabel.Size = UDim2.new(0, 50, 0, 15)
    valueLabel.Font = Enum.Font.Gotham
    valueLabel.Text = tostring(self.Parent.Options[flag])
    valueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right

    local sliderTrack = Instance.new("Frame")
    sliderTrack.Parent = sliderFrame
    sliderTrack.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    sliderTrack.BorderSizePixel = 0
    sliderTrack.Position = UDim2.new(0, 10, 0, 25)
    sliderTrack.Size = UDim2.new(1, -20, 0, 5)

    local sliderFill = Instance.new("Frame")
    sliderFill.Parent = sliderTrack
    sliderFill.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    sliderFill.BorderSizePixel = 0
    sliderFill.Size = UDim2.new(0, 0, 1, 0)

    local function updateSlider()
        local percent = (self.Parent.Options[flag] - options.Min) / (options.Max - options.Min)
        sliderFill:TweenSize(UDim2.new(percent, 0, 1, 0), "Out", "Quad", 0.1, true)
        valueLabel.Text = string.format("%.2f", self.Parent.Options[flag])
        if options.Callback then options.Callback(self.Parent.Options[flag]) end
    end

    self.Parent.Elements[flag] = {Type = "Slider", Element = sliderFill, Options = options, ValueLabel = valueLabel}

    local dragging = false
    sliderTrack.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local percent = math.clamp((input.Position.X - sliderTrack.AbsolutePosition.X) / sliderTrack.AbsoluteSize.X, 0, 1)
            self.Parent.Options[flag] = options.Min + (options.Max - options.Min) * percent
            updateSlider()
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    updateSlider()

    self.CurrentTab.YOffset = self.CurrentTab.YOffset + 45
    self.CurrentTab.Content.CanvasSize = UDim2.new(0, 0, 0, self.CurrentTab.YOffset + 10)
    return self
end

-- BUTTON
function MyLibrary:Button(options)
    local button = Instance.new("TextButton")
    button.Parent = self.CurrentTab.Content
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    button.BorderSizePixel = 0
    button.Size = UDim2.new(1, -20, 0, 25)
    button.Position = UDim2.new(0, 10, 0, self.CurrentTab.YOffset)
    button.Font = Enum.Font.Gotham
    button.Text = options.Name or "Button"
    button.TextColor3 = Color3.fromRGB(255, 255, 255)

    button.MouseButton1Click:Connect(function()
        if options.Callback then options.Callback() end
    end)

    self.CurrentTab.YOffset = self.CurrentTab.YOffset + 30
    self.CurrentTab.Content.CanvasSize = UDim2.new(0, 0, 0, self.CurrentTab.YOffset + 10)
    return self
end

-- KEYBIND
function MyLibrary:Keybind(options)
    local flag = options.Flag or "keybind_" .. #self.Parent.Options
    self.Parent.Options[flag] = options.Key or Enum.KeyCode.Unknown

    local keybindFrame = Instance.new("TextButton")
    keybindFrame.Parent = self.CurrentTab.Content
    keybindFrame.BackgroundTransparency = 1
    keybindFrame.Size = UDim2.new(1, 0, 0, 25)
    keybindFrame.Position = UDim2.new(0, 0, 0, self.CurrentTab.YOffset)
    keybindFrame.Text = ""
    keybindFrame.TextXAlignment = Enum.TextXAlignment.Left

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Parent = keybindFrame
    nameLabel.BackgroundTransparency = 1
    nameLabel.Position = UDim2.new(0, 10, 0, 0)
    nameLabel.Size = UDim2.new(0.5, 0, 1, 0)
    nameLabel.Font = Enum.Font.Gotham
    nameLabel.Text = options.Name or "Keybind"
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left

    local keyButton = Instance.new("TextButton")
    keyButton.Parent = keybindFrame
    keyButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    keyButton.BorderSizePixel = 0
    keyButton.Position = UDim2.new(1, -80, 0, 2.5)
    keyButton.Size = UDim2.new(0, 70, 0, 20)
    keyButton.Font = Enum.Font.Gotham
    keyButton.Text = "[" .. tostring(self.Parent.Options[flag]):gsub("Enum.KeyCode.", "") .. "]"
    keyButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    keyButton.TextSize = 12.000

    self.Parent.Elements[flag] = {Type = "Keybind", Element = keyButton, Options = options}

    local waitingForKey = false
    keyButton.MouseButton1Click:Connect(function()
        if not waitingForKey then
            waitingForKey = true
            keyButton.Text = "[...]"
            
            local connection
            connection = UserInputService.InputBegan:Connect(function(input)
                if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.MouseButton2 then
                    self.Parent.Options[flag] = input.KeyCode
                    keyButton.Text = "[" .. tostring(input.KeyCode):gsub("Enum.KeyCode.", "") .. "]"
                    if options.Callback then options.Callback(input.KeyCode) end
                    waitingForKey = false
                    connection:Disconnect()
                end
            end)
        end
    end)

    self.CurrentTab.YOffset = self.CurrentTab.YOffset + 30
    self.CurrentTab.Content.CanvasSize = UDim2.new(0, 0, 0, self.CurrentTab.YOffset + 10)
    return self
end

-- SAVE / LOAD
function MyLibrary:SaveConfig()
    local json = HttpService:JSONEncode(self.Options)
    writefile("MyLibraryConfig.json", json)
end

function MyLibrary:LoadConfig()
    if not isfile("MyLibraryConfig.json") then return end
    local json = readfile("MyLibraryConfig.json")
    local loadedOptions = HttpService:JSONDecode(json)
    
    for flag, value in pairs(loadedOptions) do
        if self.Elements[flag] then
            self.Options[flag] = value
            local elementData = self.Elements[flag]
            
            if elementData.Type == "Toggle" then
                elementData.Element.BackgroundColor3 = value and Color3.fromRGB(0, 150, 255) or Color3.fromRGB(40, 40, 40)
                if elementData.Options.Callback then elementData.Options.Callback(value) end
            elseif elementData.Type == "Slider" then
                local percent = (value - elementData.Options.Min) / (elementData.Options.Max - elementData.Options.Min)
                elementData.Element:TweenSize(UDim2.new(percent, 0, 1, 0), "Out", "Quad", 0.1, true)
                elementData.ValueLabel.Text = string.format("%.2f", value)
                if elementData.Options.Callback then elementData.Options.Callback(value) end
            elseif elementData.Type == "Keybind" then
                elementData.Element.Text = "[" .. tostring(value):gsub("Enum.KeyCode.", "") .. "]"
                if elementData.Options.Callback then elementData.Options.Callback(value) end
            end
        end
    end
end

return MyLibrary
