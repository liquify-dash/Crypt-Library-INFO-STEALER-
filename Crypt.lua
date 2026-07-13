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
    }
}

local function CreateWindow(Config)
    local Window = Instance.new("Frame")
    Window.Name = "CryptUiWindow"
    Window.Size = UDim2.new(0.33,0,0.57,0)
    Window.Position = UDim2.new(0.5,0,0.5,0)
    Window.AnchorPoint = Vector2.new(0.5, 0.5)
    Window.BackgroundColor3 = Themes[Config.Theme].Background
    Window.BorderSizePixel = 0

    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.Position = UDim2.new(0, 0, 0, 0)
    Title.Text = Config.Title
    Title.TextColor3 = Themes[Config.Theme].Text
    Title.BackgroundColor3 = Themes[Config.Theme].Button
    Title.BorderSizePixel = 0
    Title.Parent = Window

    return Window
end

return CryptUi
