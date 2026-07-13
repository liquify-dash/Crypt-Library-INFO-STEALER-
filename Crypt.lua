local CryptUi = {}
local Themes = {
    Dark = {
        Background = Color3.fromRGB(15, 15, 20),
        Text = Color3.fromRGB(240, 245, 255),
        SubText = Color3.fromRGB(170, 170, 170),
        Button = Color3.fromRGB(45, 48, 65),
        ButtonText = Color3.fromRGB(220, 230, 255)
    },
    Light = {
        Background = Color3.fromRGB(245, 247, 250),
        Text = Color3.fromRGB(20, 24, 35),
        SubText = Color3.fromRGB(130, 135, 145),
        Button = Color3.fromRGB(225, 230, 240),
        ButtonText = Color3.fromRGB(30, 35, 50)
    },
    Violet = {
        Background = Color3.fromRGB(22, 8, 40),
        Text = Color3.fromRGB(250, 240, 255),
        SubText = Color3.fromRGB(180, 160, 200),
        Button = Color3.fromRGB(120, 50, 200),
        ButtonText = Color3.fromRGB(255, 255, 255)
    },
    Red = {
        Background = Color3.fromRGB(25, 5, 10),
        Text = Color3.fromRGB(255, 230, 235),
        SubText = Color3.fromRGB(200, 160, 170),
        Button = Color3.fromRGB(200, 45, 65),
        ButtonText = Color3.fromRGB(255, 255, 255)
    },
    Blue = {
        Background = Color3.fromRGB(8, 15, 30),
        Text = Color3.fromRGB(230, 245, 255),
        SubText = Color3.fromRGB(140, 160, 190),
        Button = Color3.fromRGB(30, 100, 200),
        ButtonText = Color3.fromRGB(255, 255, 255)
    },
    Green = {
        Background = Color3.fromRGB(8, 20, 12),
        Text = Color3.fromRGB(235, 255, 240),
        SubText = Color3.fromRGB(150, 180, 160),
        Button = Color3.fromRGB(40, 180, 100),
        ButtonText = Color3.fromRGB(255, 255, 255)
    },
    Orange = {
        Background = Color3.fromRGB(25, 12, 5),
        Text = Color3.fromRGB(255, 240, 230),
        SubText = Color3.fromRGB(200, 170, 150),
        Button = Color3.fromRGB(255, 120, 40),
        ButtonText = Color3.fromRGB(255, 255, 255)
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

    return Window
end

return CryptUi
