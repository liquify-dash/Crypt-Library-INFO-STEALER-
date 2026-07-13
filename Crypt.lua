local CryptUi = {}

local Themes = {
    Dark = {
        Background = Color3.fromRGB(30, 30, 30),
        Text = Color3.fromRGB(255, 255, 255),
        Button = Color3.fromRGB(50, 50, 50),
        ButtonText = Color3.fromRGB(255, 255, 255)
    },
    Light = {
        Background = Color3.fromRGB(240, 240, 240),
        Text = Color3.fromRGB(0, 0, 0),
        Button = Color3.fromRGB(200, 200, 200),
        ButtonText = Color3.fromRGB(0, 0, 0)
    },
    Violet = {
        Background = Color3.fromRGB(75, 0, 130),
        Text = Color3.fromRGB(255, 255, 255),
        Button = Color3.fromRGB(138, 43, 226),
        ButtonText = Color3.fromRGB(255, 255, 255)
    },
    Red = {
        Background = Color3.fromRGB(139, 0, 0),
        Text = Color3.fromRGB(255, 255, 255),
        Button = Color3.fromRGB(178, 34, 34),
        ButtonText = Color3.fromRGB(255, 255, 255)
    }
}

function CreateWindow(Config)
    local Theme = Themes[Config.Theme] or Themes.Dark
    local plr = game.Players.LocalPlayer; local pg = plr.PlayerGui ; local uis = game:GetService("UserInputService"); local rs = game:GetService("RunService")
    if pg:FindFirstChild("CryptUi") then pg.CryptUi:Destroy() end
    local sg = Instance.new("ScreenGui", pg)
    sg.Name = "CryptUi"
    local Window = Instance.new("Frame", sg)
    Window.Name = "CryptUiWindow"
    Window.Size = UDim2.new(0.33,0,0.57,0)
    Window.Position = UDim2.new(0.5,0,0.5,0)
    Window.AnchorPoint = Vector2.new(0.5, 0.5)
    Window.BackgroundColor3 = Theme.Background
    Window.BorderSizePixel = 0

    local Title = Instance.new("TextLabel", Window)
    Title.Name = "Title"
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.Position = UDim2.new(0, 0, 0, 0)
    Title.Text = Config.Title
    Title.TextColor3 = Theme.Text
    Title.BackgroundColor3 = Theme.Button
    Title.BorderSizePixel = 0

    return Window
end

return CryptUi
