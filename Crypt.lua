local CryptUi = {}
local Themes = {
    Dark = {
        Background = Color3.fromRGB(15, 15, 20),
        Text = Color3.fromRGB(240, 245, 255),
        SubText = Color3.fromRGB(170, 170, 170),
        Tab = Color3.fromRGB(30, 32, 42)
    },
    Light = {
        Background = Color3.fromRGB(245, 247, 250),
        Text = Color3.fromRGB(20, 24, 35),
        SubText = Color3.fromRGB(130, 135, 145),
        Tab = Color3.fromRGB(232, 231, 235)
    },
    Violet = {
        Background = Color3.fromRGB(22, 8, 40),
        Text = Color3.fromRGB(250, 240, 255),
        SubText = Color3.fromRGB(180, 160, 200),
        Tab = Color3.fromRGB(40, 15, 70)
    },
    Red = {
        Background = Color3.fromRGB(25, 5, 10),
        Text = Color3.fromRGB(255, 230, 235),
        SubText = Color3.fromRGB(200, 160, 170),
        Tab = Color3.fromRGB(40, 8, 15)
    },
    Blue = {
        Background = Color3.fromRGB(8, 15, 30),
        Text = Color3.fromRGB(230, 245, 255),
        SubText = Color3.fromRGB(140, 160, 190),
        Tab = Color3.fromRGB(12, 25, 50)
    },
    Green = {
        Background = Color3.fromRGB(8, 20, 12),
        Text = Color3.fromRGB(235, 255, 240),
        SubText = Color3.fromRGB(150, 180, 160),
        Tab = Color3.fromRGB(12, 35, 20)
    },
    Orange = {
        Background = Color3.fromRGB(25, 12, 5),
        Text = Color3.fromRGB(255, 240, 230),
        SubText = Color3.fromRGB(200, 170, 150),
        Tab = Color3.fromRGB(40, 20, 8)
    }
}

function CreateWindow(Config)
    Config = Config or {}
    local Theme = Themes[Config.Theme or "Dark"]
    local Title = Config.Title or "CryptUi"
    local Subtitle = Config.Subtitle or "Created by Liv"

    local plr = game.Players.LocalPlayer; local pg = plr.PlayerGui
    local uis = game:GetService("UserInputService"); local rs = game:GetService("RunService")

    if pg:FindFirstChild("CryptUi") then pg.CryptUi:Destroy() end

    local sg = Instance.new("ScreenGui", pg)
    sg.Name = "CryptUi"
    sg.ResetOnSpawn = false
    
    local Window = Instance.new("Frame", sg)
    Window.Name = "Window"
    Window.Size = UDim2.new(0.33,0,0.63,0)
    Window.Position = UDim2.new(0.5,0,0.5,0)
    Window.AnchorPoint = Vector2.new(0.5, 0.5)
    Window.BackgroundColor3 = Theme.Background
    Window.BorderSizePixel = 0
    Instance.new("UICorner", Window).CornerRadius = UDim.new(0.04, 0)

    local topbar = Instance.new("Frame", Window)
    topbar.Name = "TopBar"
    topbar.Size = UDim2.new(1,0,0.12,0)
    topbar.BackgroundTransparency = 1

    local title = Instance.new("TextLabel", topbar)
    title.Name = "Title"
    title.Size = UDim2.new(0.24,0,0,0)
    title.Position = UDim2.new(0.03,0,0.393,0)
    title.Text = Title
    title.TextColor3 = Theme.Text
    title.Font = Enum.Font.GothamBold
    title.TextSize = 19
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.BackgroundTransparency = 1

    local subtitle = Instance.new("TextLabel", topbar)
    subtitle.Name = "Subtitle"
    subtitle.Size = UDim2.new(0.24,0,0,0)
    subtitle.Position = UDim2.new(0.03,0,0.693,0)
    subtitle.Text = Subtitle
    subtitle.TextColor3 = Theme.SubText
    subtitle.Font = Enum.Font.Gotham
    subtitle.TextSize = 12
    subtitle.TextXAlignment = Enum.TextXAlignment.Left
    subtitle.BackgroundTransparency = 1

    local TabContent = Instance.new("ScrollingFrame", Window)
    TabContent.Name = "TabContent"
    TabContent.CanvasSize = UDim2.new(0,0,0,0)
    TabContent.Size = UDim2.new(1,0,0.11,0)
    TabContent.Position = UDim2.new(0,0,0.12,0)
    TabContent.ScrollingDirection = Enum.ScrollingDirection.X
    TabContent.AutomaticCanvasSize = Enum.AutomaticSize.X
    TabContent.BackgroundTransparency = 0
    TabContent.ScrollBarThickness = 0

    local TabLayout = Instance.new("UIListLayout", TabContent)
    TabLayout.FillDirection = Enum.FillDirection.Horizontal
    TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabLayout.Padding = UDim.new(0, 5)

    local TabPadding = Instance.new("UIPadding", TabContent)
    TabPadding.PaddingLeft = UDim.new(0, 5)
    TabPadding.PaddingTop = UDim.new(0, 3)

    TabLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	    TabContent.CanvasSize = UDim2.new(0,TabLayout.AbsoluteContentSize.X + TabContent.AbsoluteSize.X * 0.05,0,0)
    end)
    
    function CreateTab(ConfigTab)
        ConfigTab = ConfigTab or {}
        local TabName = ConfigTab.Name or "Tab"
        local Tab = Instance.new("Frame", TabContent)
        Tab.Name = TabName
        Tab.Size = UDim2.new(0.22,0,0.05,0)
        Tab.BackgroundColor3 = Theme.Tab
        Tab.BorderSizePixel = 0
        Instance.new("UICorner", Tab).CornerRadius = UDim.new(1, 0)
        return Tab
    end

    return Window
end

return CryptUi
