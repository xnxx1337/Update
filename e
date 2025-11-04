-- Gui to Lua
-- Version: 3.2

-- Instances:

local plaguecheatcc = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TopBar = Instance.new("TextLabel")
local trace = Instance.new("TextLabel")
local MiscTabs = Instance.new("TextButton")
local SkinsTabs = Instance.new("TextButton")
local VisualsTabs = Instance.new("TextButton")
local RageTabs = Instance.new("TextButton")
local Section1 = Instance.new("Frame")
local SectionText1 = Instance.new("TextLabel")
local checkbox = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local SliderTrack = Instance.new("Frame") -- Renommé pour plus de clarté
local SliderHandle = Instance.new("Frame") -- Le curseur qu'on déplace
local MinusLabel = Instance.new("TextButton")
local PlusLabel = Instance.new("TextButton")
local TextLabel_2 = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local Section2 = Instance.new("Frame")
local SectionText2 = Instance.new("TextLabel")
-- AJOUT DES SECTIONS MANQUANTES POUR LES ONGLETS
local Section3 = Instance.new("Frame") -- Pour Visuals
local SectionText3 = Instance.new("TextLabel")
local Section4 = Instance.new("Frame") -- Pour Rage
local SectionText4 = Instance.new("TextLabel")
local FrameFps = Instance.new("Frame")
local trace_2 = Instance.new("TextLabel")
local TextLabel_3 = Instance.new("TextLabel")

--Properties:

plaguecheatcc.Name = "plaguecheat.cc"
plaguecheatcc.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
plaguecheatcc.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = plaguecheatcc
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.281938314, 0, 0.217088073, 0)
Frame.Size = UDim2.new(0, 692, 0, 469)
Frame.Visible = false -- Le menu commence fermé

TopBar.Name = "TopBar"
TopBar.Parent = Frame
TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
TopBar.BorderSizePixel = 0
TopBar.Position = UDim2.new(0, 0, -0.0533049032, 0)
TopBar.Size = UDim2.new(0, 692, 0, 25)
TopBar.Font = Enum.Font.SourceSans
TopBar.Text = "  Skycheat.cc - email.bomber#0"
TopBar.TextColor3 = Color3.fromRGB(255, 255, 255)
TopBar.TextSize = 14.000
TopBar.TextXAlignment = Enum.TextXAlignment.Left

trace.Name = "trace"
trace.Parent = TopBar
trace.BackgroundColor3 = Color3.fromRGB(62, 124, 186)
trace.BorderColor3 = Color3.fromRGB(0, 0, 0)
trace.BorderSizePixel = 0
trace.Position = UDim2.new(0, 0, 1, 0)
trace.Size = UDim2.new(0, 692, 0, 1)
trace.Font = Enum.Font.SourceSans
trace.Text = ""
trace.TextColor3 = Color3.fromRGB(0, 0, 0)
trace.TextSize = 14.000

RageTabs.Name = "RageTabs"
RageTabs.Parent = TopBar
RageTabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RageTabs.BackgroundTransparency = 1.000
RageTabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
RageTabs.BorderSizePixel = 0
RageTabs.Position = UDim2.new(0.783236921, 0, 0.0799999982, 0)
RageTabs.Size = UDim2.new(0, 35, 0, 21)
RageTabs.Font = Enum.Font.SourceSans
RageTabs.Text = "Rage"
RageTabs.TextColor3 = Color3.fromRGB(130, 130, 130)
RageTabs.TextSize = 14.000

VisualsTabs.Name = "VisualsTabs"
VisualsTabs.Parent = TopBar
VisualsTabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
VisualsTabs.BackgroundTransparency = 1.000
VisualsTabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
VisualsTabs.BorderSizePixel = 0
VisualsTabs.Position = UDim2.new(0.833814919, 0, 0.0799999982, 0)
VisualsTabs.Size = UDim2.new(0, 42, 0, 21)
VisualsTabs.Font = Enum.Font.SourceSans
VisualsTabs.Text = "Visuals"
VisualsTabs.TextColor3 = Color3.fromRGB(130, 130, 130)
VisualsTabs.TextSize = 14.000

SkinsTabs.Name = "SkinsTabs"
SkinsTabs.Parent = TopBar
SkinsTabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SkinsTabs.BackgroundTransparency = 1.000
SkinsTabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
SkinsTabs.BorderSizePixel = 0
SkinsTabs.Position = UDim2.new(0.8945086, 0, 0.0799999982, 0)
SkinsTabs.Size = UDim2.new(0, 33, 0, 21)
SkinsTabs.Font = Enum.Font.SourceSans
SkinsTabs.Text = "Skins"
SkinsTabs.TextColor3 = Color3.fromRGB(130, 130, 130)
SkinsTabs.TextSize = 14.000

MiscTabs.Name = "MiscTabs"
MiscTabs.Parent = TopBar
MiscTabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MiscTabs.BackgroundTransparency = 1.000
MiscTabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
MiscTabs.BorderSizePixel = 0
MiscTabs.Position = UDim2.new(0.942196548, 0, 0.0799999982, 0)
MiscTabs.Size = UDim2.new(0, 33, 0, 21)
MiscTabs.Font = Enum.Font.SourceSans
MiscTabs.Text = "Misc"
MiscTabs.TextColor3 = Color3.fromRGB(255, 255, 255) -- Actif par défaut
MiscTabs.TextSize = 14.000

-- SECTION 1 (Misc)
Section1.Name = "Section1"
Section1.Parent = Frame
Section1.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Section1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Section1.BorderSizePixel = 0
Section1.Position = UDim2.new(0.0101156067, 0, 0.0149253728, 0)
Section1.Size = UDim2.new(0, 333, 0, 454)

SectionText1.Name = "SectionText1"
SectionText1.Parent = Section1
SectionText1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SectionText1.BackgroundTransparency = 1.000
SectionText1.BorderColor3 = Color3.fromRGB(0, 0, 0)
SectionText1.BorderSizePixel = 0
SectionText1.Position = UDim2.new(0, 0, 0.00220264308, 0)
SectionText1.Size = UDim2.new(0, 58, 0, 21)
SectionText1.Font = Enum.Font.SourceSans
SectionText1.Text = "Section 1"
SectionText1.TextColor3 = Color3.fromRGB(130, 130, 130)
SectionText1.TextSize = 14.000

checkbox.Name = "checkbox"
checkbox.Parent = Section1
checkbox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
checkbox.BorderColor3 = Color3.fromRGB(54, 54, 54)
checkbox.Position = UDim2.new(0.0690690726, 0, 0.0660792962, 0)
checkbox.Size = UDim2.new(0, 12, 0, 12)
checkbox.Font = Enum.Font.SourceSans
checkbox.Text = ""
checkbox.TextColor3 = Color3.fromRGB(0, 0, 0)
checkbox.TextSize = 14.000

TextLabel.Parent = checkbox
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(1.66666663, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 80, 0, 12)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Checkbox"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14.000
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

-- SLIDER
SliderTrack.Name = "SliderTrack"
SliderTrack.Parent = Section1
SliderTrack.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SliderTrack.BorderSizePixel = 0
SliderTrack.Position = UDim2.new(0.0690690726, 0, 0.158590302, 0)
SliderTrack.Size = UDim2.new(0, 200, 0, 6)

SliderHandle.Name = "SliderHandle"
SliderHandle.Parent = SliderTrack
SliderHandle.BackgroundColor3 = Color3.fromRGB(62, 124, 186)
SliderHandle.BorderSizePixel = 0
SliderHandle.Position = UDim2.new(0, 0, 0, 0)
SliderHandle.Size = UDim2.new(0, 100, 0, 6) -- Taille initiale (50%)
SliderHandle.Font = Enum.Font.SourceSans
SliderHandle.Text = ""
SliderHandle.TextColor3 = Color3.fromRGB(0, 0, 0)
SliderHandle.TextSize = 14.000

MinusLabel.Name = "MinusLabel"
MinusLabel.Parent = SliderTrack
MinusLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MinusLabel.BackgroundTransparency = 1.000
MinusLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
MinusLabel.BorderSizePixel = 0
MinusLabel.Position = UDim2.new(-0.05, 0, -0.5, 0)
MinusLabel.Size = UDim2.new(0, 10, 0, 14)
MinusLabel.Font = Enum.Font.SourceSans
MinusLabel.Text = "-"
MinusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
MinusLabel.TextSize = 14.000
MinusLabel.TextXAlignment = Enum.TextXAlignment.Center

PlusLabel.Name = "PlusLabel"
PlusLabel.Parent = SliderTrack
PlusLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PlusLabel.BackgroundTransparency = 1.000
PlusLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
PlusLabel.BorderSizePixel = 0
PlusLabel.Position = UDim2.new(1.05, 0, -0.5, 0)
PlusLabel.Size = UDim2.new(0, 10, 0, 14)
PlusLabel.Font = Enum.Font.SourceSans
PlusLabel.Text = "+"
PlusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
PlusLabel.TextSize = 14.000
PlusLabel.TextXAlignment = Enum.TextXAlignment.Center

TextLabel_2.Parent = SliderTrack
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.5, -21, 1.5, 0)
TextLabel_2.Size = UDim2.new(0, 42, 0, 14)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "50"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextSize = 12.000

TextButton.Parent = Section1
TextButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextButton.BorderColor3 = Color3.fromRGB(62, 124, 186)
TextButton.Position = UDim2.new(0.0690690726, 0, 0.254845836, 0)
TextButton.Size = UDim2.new(0, 231, 0, 31)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Print Button"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 14.000

-- SECTION 2 (Skins)
Section2.Name = "Section2"
Section2.Parent = Frame
Section2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Section2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Section2.BorderSizePixel = 0
Section2.Position = UDim2.new(0.510115623, 0, 0.0149253728, 0)
Section2.Size = UDim2.new(0, 332, 0, 454)
Section2.Visible = false -- Caché par défaut

SectionText2.Name = "SectionText2"
SectionText2.Parent = Section2
SectionText2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SectionText2.BackgroundTransparency = 1.000
SectionText2.BorderColor3 = Color3.fromRGB(0, 0, 0)
SectionText2.BorderSizePixel = 0
SectionText2.Size = UDim2.new(0, 58, 0, 21)
SectionText2.Font = Enum.Font.SourceSans
SectionText2.Text = "Section 2"
SectionText2.TextColor3 = Color3.fromRGB(130, 130, 130)
SectionText2.TextSize = 14.000

-- SECTION 3 (Visuals) - NOUVEAU
Section3.Name = "Section3"
Section3.Parent = Frame
Section3.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Section3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Section3.BorderSizePixel = 0
Section3.Position = UDim2.new(0.0101156067, 0, 0.0149253728, 0)
Section3.Size = UDim2.new(0, 333, 0, 454)
Section3.Visible = false

SectionText3.Name = "SectionText3"
SectionText3.Parent = Section3
SectionText3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SectionText3.BackgroundTransparency = 1.000
SectionText3.BorderColor3 = Color3.fromRGB(0, 0, 0)
SectionText3.BorderSizePixel = 0
SectionText3.Position = UDim2.new(0, 0, 0.00220264308, 0)
SectionText3.Size = UDim2.new(0, 58, 0, 21)
SectionText3.Font = Enum.Font.SourceSans
SectionText3.Text = "Section 3"
SectionText3.TextColor3 = Color3.fromRGB(130, 130, 130)
SectionText3.TextSize = 14.000

-- SECTION 4 (Rage) - NOUVEAU
Section4.Name = "Section4"
Section4.Parent = Frame
Section4.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Section4.BorderColor3 = Color3.fromRGB(0, 0, 0)
Section4.BorderSizePixel = 0
Section4.Position = UDim2.new(0.510115623, 0, 0.0149253728, 0)
Section4.Size = UDim2.new(0, 332, 0, 454)
Section4.Visible = false

SectionText4.Name = "SectionText4"
SectionText4.Parent = Section4
SectionText4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SectionText4.BackgroundTransparency = 1.000
SectionText4.BorderColor3 = Color3.fromRGB(0, 0, 0)
SectionText4.BorderSizePixel = 0
SectionText4.Size = UDim2.new(0, 58, 0, 21)
SectionText4.Font = Enum.Font.SourceSans
SectionText4.Text = "Section 4"
SectionText4.TextColor3 = Color3.fromRGB(130, 130, 130)
SectionText4.TextSize = 14.000

-- FPS COUNTER
FrameFps.Name = "FrameFps"
FrameFps.Parent = plaguecheatcc
FrameFps.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
FrameFps.BorderColor3 = Color3.fromRGB(0, 0, 0)
FrameFps.BorderSizePixel = 0
FrameFps.Position = UDim2.new(0.0201638266, 0, 0.0504587255, 0)
FrameFps.Size = UDim2.new(0, 224, 0, 23)

trace_2.Name = "trace"
trace_2.Parent = FrameFps
trace_2.BackgroundColor3 = Color3.fromRGB(62, 124, 186)
trace_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
trace_2.BorderSizePixel = 0
trace_2.Position = UDim2.new(0, 0, -0.0476190336, 0)
trace_2.Size = UDim2.new(0, 224, 0, 1)
trace_2.Font = Enum.Font.SourceSans
trace_2.Text = ""
trace_2.TextColor3 = Color3.fromRGB(0, 0, 0)
trace_2.TextSize = 14.000

TextLabel_3.Parent = FrameFps
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0, 0, 0.260869235, 0)
TextLabel_3.Size = UDim2.new(0, 224, 0, 10)
TextLabel_3.Font = Enum.Font.SourceSans
TextLabel_3.Text = "  SkyCheat.cc | fps : 0 | Overlay : OFF"
TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.TextSize = 14.000
TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left


-- Scripts:

local function UI_Controller() -- Fonction principale pour toute la logique
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local HttpService = game:GetService("HttpService")
    local TweenService = game:GetService("TweenService")
    
    local mainFrame = Frame
    local topBar = TopBar
    local fpsLabel = TextLabel_3
    
    -- === SYSTÈME DE SAUVEGARDE ===
    local Options = {}
    local ConfigFileName = "plaguecheat_config.json"

    local function SaveConfig()
        local success, encoded = pcall(function()
            return HttpService:JSONEncode(Options)
        end)
        if success then
            writefile(ConfigFileName, encoded)
            print("Configuration sauvegardée !")
        else
            warn("Erreur lors de la sauvegarde de la config :", encoded)
        end
    end

    local function LoadConfig()
        if not isfile(ConfigFileName) then
            print("Aucune configuration trouvée.")
            return
        end
        local success, decoded = pcall(function()
            return HttpService:JSONDecode(readfile(ConfigFileName))
        end)
        if success and type(decoded) == "table" then
            Options = decoded
            print("Configuration chargée !")
            
            -- Mettre à jour l'UI avec les valeurs chargées
            checkbox.BackgroundColor3 = Options.checkbox_state and Color3.fromRGB(0, 162, 255) or Color3.fromRGB(25, 25, 25)
            updateSlider(Options.slider_value)
            if Options.menu_key then
                MenuKeybindButton.Text = "[" .. tostring(Options.menu_key):gsub("Enum.KeyCode.", "") .. "]"
            end
        else
            warn("Erreur lors du chargement de la config :", decoded)
        end
    end

    -- === DRAG & TOGGLE (déjà là, juste un peu nettoyé) ===
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

    -- === FONCTIONNALITÉ DES ONGLETS ===
    local tabs = {
        RageTabs = {Button = RageTabs, Section = Section4},
        VisualsTabs = {Button = VisualsTabs, Section = Section3},
        SkinsTabs = {Button = SkinsTabs, Section = Section2},
        MiscTabs = {Button = MiscTabs, Section = Section1}
    }

    local function switchTab(tabName)
        for name, data in pairs(tabs) do
            data.Section.Visible = (name == tabName)
            data.Button.TextColor3 = (name == tabName) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(130, 130, 130)
        end
    end

    for name, data in pairs(tabs) do
        data.Button.MouseButton1Click:Connect(function()
            switchTab(name)
        end)
    end
    switchTab("MiscTabs") -- Assure que le premier onglet est bien sélectionné

    -- === FONCTIONNALITÉ CHECKBOX ===
    Options.checkbox_state = false -- Valeur par défaut
    checkbox.MouseButton1Click:Connect(function()
        Options.checkbox_state = not Options.checkbox_state
        checkbox.BackgroundColor3 = Options.checkbox_state and Color3.fromRGB(0, 162, 255) or Color3.fromRGB(25, 25, 25)
        print("Checkbox est maintenant:", Options.checkbox_state)
        SaveConfig() -- Sauvegarde à chaque changement
    end)

    -- === FONCTIONNALITÉ SLIDER ===
    local sliderMin = 0
    local sliderMax = 100
    Options.slider_value = 50 -- Valeur par défaut
    
    local function updateSlider(val)
        Options.slider_value = math.clamp(val, sliderMin, sliderMax)
        local percent = (Options.slider_value - sliderMin) / (sliderMax - sliderMin)
        local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(SliderHandle, tweenInfo, {Size = UDim2.new(percent, 0, 1, 0)})
        tween:Play()
        TextLabel_2.Text = tostring(math.floor(Options.slider_value))
        print("Slider value:", Options.slider_value)
        SaveConfig() -- Sauvegarde à chaque changement
    end
    
    SliderTrack.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local moveConnection
            local releaseConnection
            
            moveConnection = UserInputService.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    local mousePos = input.Position
                    local sliderPos = SliderTrack.AbsolutePosition
                    local sliderSize = SliderTrack.AbsoluteSize
                    local percent = math.clamp((mousePos.X - sliderPos.X) / sliderSize.X, 0, 1)
                    updateSlider(sliderMin + (sliderMax - sliderMin) * percent)
                end
            end)
            
            releaseConnection = UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    moveConnection:Disconnect()
                    releaseConnection:Disconnect()
                end
            end)
        end
    end)

    MinusLabel.MouseButton1Click:Connect(function() updateSlider(Options.slider_value - 1) end)
    PlusLabel.MouseButton1Click:Connect(function() updateSlider(Options.slider_value + 1) end)

    -- === FONCTIONNALITÉ BOUTON ===
    TextButton.MouseButton1Click:Connect(function()
        print("Le bouton a été cliqué !")
    end)

    -- === AJOUT DES BOUTONS SAVE/LOAD/KEYBIND DANS SECTION 1 ===
    local SaveButton = Instance.new("TextButton")
    SaveButton.Parent = Section1
    SaveButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    SaveButton.BorderColor3 = Color3.fromRGB(62, 124, 186)
    SaveButton.Position = UDim2.new(0.0690690726, 0, 0.35, 0)
    SaveButton.Size = UDim2.new(0, 100, 0, 25)
    SaveButton.Font = Enum.Font.SourceSans
    SaveButton.Text = "Save"
    SaveButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    SaveButton.TextSize = 14.000
    SaveButton.MouseButton1Click:Connect(SaveConfig)

    local LoadButton = Instance.new("TextButton")
    LoadButton.Parent = Section1
    LoadButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    LoadButton.BorderColor3 = Color3.fromRGB(62, 124, 186)
    LoadButton.Position = UDim2.new(0.0690690726, 110, 0.35, 0)
    LoadButton.Size = UDim2.new(0, 100, 0, 25)
    LoadButton.Font = Enum.Font.SourceSans
    LoadButton.Text = "Load"
    LoadButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    LoadButton.TextSize = 14.000
    LoadButton.MouseButton1Click:Connect(LoadConfig)

    local MenuKeybindLabel = Instance.new("TextLabel")
    MenuKeybindLabel.Parent = Section1
    MenuKeybindLabel.BackgroundTransparency = 1
    MenuKeybindLabel.Position = UDim2.new(0.0690690726, 0, 0.42, 0)
    MenuKeybindLabel.Size = UDim2.new(0, 100, 0, 20)
    MenuKeybindLabel.Font = Enum.Font.SourceSans
    MenuKeybindLabel.Text = "Menu Keybind"
    MenuKeybindLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    MenuKeybindLabel.TextSize = 14.000
    MenuKeybindLabel.TextXAlignment = Enum.TextXAlignment.Left

    local MenuKeybindButton = Instance.new("TextButton")
    MenuKeybindButton.Parent = Section1
    MenuKeybindButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    MenuKeybindButton.BorderSizePixel = 0
    MenuKeybindButton.Position = UDim2.new(0.0690690726, 110, 0.42, 0)
    MenuKeybindButton.Size = UDim2.new(0, 100, 0, 20)
    MenuKeybindButton.Font = Enum.Font.SourceSans
    MenuKeybindButton.Text = "[L]"
    MenuKeybindButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    MenuKeybindButton.TextSize = 12.000

    local waitingForKey = false
    MenuKeybindButton.MouseButton1Click:Connect(function()
        if not waitingForKey then
            waitingForKey = true
            MenuKeybindButton.Text = "[...]"
            
            local connection
            connection = UserInputService.InputBegan:Connect(function(input)
                if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.MouseButton2 then
                    Options.menu_key = input.KeyCode
                    MenuKeybindButton.Text = "[" .. tostring(input.KeyCode):gsub("Enum.KeyCode.", "") .. "]"
                    print("La touche pour ouvrir le menu est maintenant:", input.KeyCode)
                    SaveConfig()
                    waitingForKey = false
                    connection:Disconnect()
                end
            end)
        end
    end)

    -- === LOGIQUE DE TOUCHE POUR OUVRIR/FERMER (AVEC KEYBIND DYNAMIQUE) ===
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        local keyToCheck = Options.menu_key or Enum.KeyCode.L
        if input.KeyCode == keyToCheck then
            mainFrame.Visible = not mainFrame.Visible
        end
    end)

    -- === FPS COUNTER & OVERLAY STATUS ===
    local fps = 0
    local lastTick = tick()
    RunService.Heartbeat:Connect(function()
        local now = tick()
        local delta = now - lastTick
        fps = math.floor(1 / delta)
        lastTick = now
        
        local overlayStatus = mainFrame.Visible and "ON" or "OFF"
        fpsLabel.Text = string.format("  SkyCheat.cc | fps : %d | Overlay : %s", fps, overlayStatus)
    end)

    -- Charger la configuration au démarrage
    LoadConfig()
end
coroutine.wrap(UI_Controller)()
