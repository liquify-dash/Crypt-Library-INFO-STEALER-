local CryptUi = {}

local Themes = {
    Dark = {
        Background = Color3.fromRGB(15, 15, 20),
        Text = Color3.fromRGB(240, 245, 255),
        Button = Color3.fromRGB(45, 48, 65),
        ButtonText = Color3.fromRGB(220, 230, 255)
    },
    Light = {
        Background = Color3.fromRGB(245, 247, 250),
        Text = Color3.fromRGB(20, 24, 35),
        Button = Color3.fromRGB(225, 230, 240),
        ButtonText = Color3.fromRGB(30, 35, 50)
    },
    Violet = {
        Background = Color3.fromRGB(22, 8, 40),
        Text = Color3.fromRGB(250, 240, 255),
        Button = Color3.fromRGB(120, 50, 200),
        ButtonText = Color3.fromRGB(255, 255, 255)
    },
    Red = {
        Background = Color3.fromRGB(25, 5, 10),
        Text = Color3.fromRGB(255, 230, 235),
        Button = Color3.fromRGB(200, 45, 65),
        ButtonText = Color3.fromRGB(255, 255, 255)
    },
    Blue = {
        Background = Color3.fromRGB(8, 15, 30),
        Text = Color3.fromRGB(230, 245, 255),
        Button = Color3.fromRGB(30, 100, 200),
        ButtonText = Color3.fromRGB(255, 255, 255)
    },
    Green = {
        Background = Color3.fromRGB(8, 20, 12),
        Text = Color3.fromRGB(235, 255, 240),
        Button = Color3.fromRGB(40, 180, 100),
        ButtonText = Color3.fromRGB(255, 255, 255)
    },
    Orange = {
        Background = Color3.fromRGB(25, 12, 5),
        Text = Color3.fromRGB(255, 240, 230),
        Button = Color3.fromRGB(255, 120, 40),
        ButtonText = Color3.fromRGB(255, 255, 255)
    }
}

function CreateWindow(Config)
    Config = Config or {}
    local Theme = Themes[Config.Theme or "Dark"]

    local plr = game.Players.LocalPlayer; local pg = plr.PlayerGui
    local uis = game:GetService("UserInputService"); local rs = game:GetService("RunService")

    if pg:FindFirstChild("CryptUi") then pg.CryptUi:Destroy() end

    local sg = Instance.new("ScreenGui", pg)
    sg.Name = "CryptUi"
    local Window = Instance.new("Frame", sg)
    Window.Name = "CryptUiWindow"
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

    return Window
end

return CryptUi
