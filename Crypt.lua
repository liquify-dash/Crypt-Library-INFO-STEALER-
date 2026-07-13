local CryptUi = {}

local function clamp(n, a, b)
    if n < a then return a end
    if n > b then return b end
    return n
end

-- Brighten a color by pushing each channel upward.
local function boost(color, amount)
    amount = amount or 0
    local r = clamp(color.R + amount, 0, 1)
    local g = clamp(color.G + amount, 0, 1)
    local b = clamp(color.B + amount, 0, 1)
    return Color3.new(r, g, b)
end

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

-- Creates a multi-layer "glow" behind a target frame.
local function applyGlow(target, baseColor, cornerRadius)
    cornerRadius = cornerRadius or UDim.new(0.04, 0)

    -- Use boosted base to make the glow more vibrant.
    local glowColor = boost(baseColor, 0.25)

    local layerCount = 4
    for i = 1, layerCount do
        local sizeGrow = i * 0.03
        local transparency = 0.45 + (i * 0.08) -- farther layers are dimmer

        local glow = Instance.new("Frame")
        glow.Name = "GlowLayer_" .. i
        glow.BackgroundColor3 = glowColor
        glow.BorderSizePixel = 0
        glow.BackgroundTransparency = transparency
        glow.ZIndex = (target.ZIndex or 1) - 1
        glow.AnchorPoint = target.AnchorPoint
        glow.Position = target.Position
        glow.Size = target.Size

        -- Expand glow slightly by inflating size/position.
        glow.Size = UDim2.new(target.Size.X.Scale + sizeGrow, target.Size.X.Offset, target.Size.Y.Scale + sizeGrow, target.Size.Y.Offset)
        glow.Position = UDim2.new(target.Position.X.Scale, target.Position.X.Offset - target.Size.X.Offset * sizeGrow, target.Position.Y.Scale, target.Position.Y.Offset - target.Size.Y.Offset * sizeGrow)

        glow.Parent = target.Parent

        local corner = Instance.new("UICorner", glow)
        corner.CornerRadius = cornerRadius

        -- Keep glow behind.
        glow.ZIndex = (target.ZIndex or 1) - 1 - i
    end
end

function CreateWindow(Config)
    Config = Config or {}
    local Theme = Themes[Config.Theme or "Dark"]

    local plr = game.Players.LocalPlayer
    local pg = plr.PlayerGui

    if pg:FindFirstChild("CryptUi") then pg.CryptUi:Destroy() end

    local sg = Instance.new("ScreenGui", pg)
    sg.Name = "CryptUi"

    local Window = Instance.new("Frame", sg)
    Window.Name = "CryptUiWindow"
    Window.Size = UDim2.new(0.33, 0, 0.63, 0)
    Window.Position = UDim2.new(0.5, 0, 0.5, 0)
    Window.AnchorPoint = Vector2.new(0.5, 0.5)
    Window.BorderSizePixel = 0
    Window.BackgroundColor3 = boost(Theme.Background, 0.08)

    -- Base glow/tint color: prefer button color (more saturated)
    local glowSource = Theme.Button or Theme.Background

    local corner = Instance.new("UICorner", Window)
    corner.CornerRadius = UDim.new(0.04, 0)

    -- Glow layers behind the window
    applyGlow(Window, glowSource, UDim.new(0.04, 0))

    -- Topbar styling (was transparent)
    local topbar = Instance.new("Frame", Window)
    topbar.Name = "TopBar"
    topbar.Size = UDim2.new(1, 0, 0.12, 0)
    topbar.BackgroundColor3 = boost(glowSource, 0.35)
    topbar.BackgroundTransparency = 1

    return Window
end

return CryptUi
