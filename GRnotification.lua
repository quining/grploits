-- Modern Sleek GRploits Notification
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GRploitsNotification"
screenGui.Parent = playerGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main container with glassmorphism effect
local container = Instance.new("Frame")
container.Name = "Container"
container.Size = UDim2.new(0, 380, 0, 85)
container.Position = UDim2.new(1, 20, 0, 20)
container.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
container.BackgroundTransparency = 0.1
container.BorderSizePixel = 0
container.Parent = screenGui

-- Modern rounded corners
local containerCorner = Instance.new("UICorner")
containerCorner.CornerRadius = UDim.new(0, 16)
containerCorner.Parent = container

-- Glassmorphism blur effect (simulated with gradient)
local glassEffect = Instance.new("Frame")
glassEffect.Size = UDim2.new(1, 0, 1, 0)
glassEffect.Position = UDim2.new(0, 0, 0, 0)
glassEffect.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
glassEffect.BackgroundTransparency = 0.95
glassEffect.Parent = container

local glassCorner = Instance.new("UICorner")
glassCorner.CornerRadius = UDim.new(0, 16)
glassCorner.Parent = glassEffect

-- Accent border (neon pink)
local accentBorder = Instance.new("Frame")
accentBorder.Name = "AccentBorder"
accentBorder.Size = UDim2.new(1, 4, 1, 4)
accentBorder.Position = UDim2.new(0, -2, 0, -2)
accentBorder.BackgroundColor3 = Color3.fromRGB(255, 20, 147)
accentBorder.BackgroundTransparency = 0.3
accentBorder.ZIndex = container.ZIndex - 1
accentBorder.Parent = container

local borderCorner = Instance.new("UICorner")
borderCorner.CornerRadius = UDim.new(0, 18)
borderCorner.Parent = accentBorder

-- Animated gradient accent
local accentGradient = Instance.new("UIGradient")
accentGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 20, 147)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(220, 60, 180)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 20, 147))
}
accentGradient.Rotation = 0
accentGradient.Parent = accentBorder

-- Glow effect
local outerGlow = Instance.new("Frame")
outerGlow.Name = "OuterGlow"
outerGlow.Size = UDim2.new(1, 20, 1, 20)
outerGlow.Position = UDim2.new(0, -10, 0, -10)
outerGlow.BackgroundColor3 = Color3.fromRGB(255, 20, 147)
outerGlow.BackgroundTransparency = 0.8
outerGlow.ZIndex = container.ZIndex - 2
outerGlow.Parent = container

local glowCorner = Instance.new("UICorner")
glowCorner.CornerRadius = UDim.new(0, 26)
glowCorner.Parent = outerGlow

-- Left accent bar
local leftAccent = Instance.new("Frame")
leftAccent.Name = "LeftAccent"
leftAccent.Size = UDim2.new(0, 4, 1, 0)
leftAccent.Position = UDim2.new(0, 0, 0, 0)
leftAccent.BackgroundColor3 = Color3.fromRGB(255, 20, 147)
leftAccent.BorderSizePixel = 0
leftAccent.Parent = container

local leftAccentCorner = Instance.new("UICorner")
leftAccentCorner.CornerRadius = UDim.new(0, 16)
leftAccentCorner.Parent = leftAccent

-- Icon container (modern geometric design)
local iconContainer = Instance.new("Frame")
iconContainer.Name = "IconContainer"
iconContainer.Size = UDim2.new(0, 50, 0, 50)
iconContainer.Position = UDim2.new(0, 20, 0, 17.5)
iconContainer.BackgroundColor3 = Color3.fromRGB(255, 20, 147)
iconContainer.BackgroundTransparency = 0.1
iconContainer.Parent = container

local iconCorner = Instance.new("UICorner")
iconCorner.CornerRadius = UDim.new(0, 12)
iconCorner.Parent = iconContainer

-- Modern checkmark icon
local checkIcon = Instance.new("TextLabel")
checkIcon.Name = "CheckIcon"
checkIcon.Size = UDim2.new(1, 0, 1, 0)
checkIcon.Position = UDim2.new(0, 0, 0, 0)
checkIcon.BackgroundTransparency = 1
checkIcon.Text = "✓"
checkIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
checkIcon.TextScaled = true
checkIcon.Font = Enum.Font.GothamBold
checkIcon.Parent = iconContainer

-- Title with modern typography
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(0, 200, 0, 25)
titleLabel.Position = UDim2.new(0, 85, 0, 15)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "GRploits.com"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = container

-- Status with subtle styling
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Size = UDim2.new(0, 200, 0, 20)
statusLabel.Position = UDim2.new(0, 85, 0, 42)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Injected successfully"
statusLabel.TextColor3 = Color3.fromRGB(180, 180, 190)
statusLabel.TextScaled = true
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Parent = container

-- Modern close button
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -40, 0, 10)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundTransparency = 0.9
closeButton.Text = "×"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextScaled = true
closeButton.Font = Enum.Font.GothamBold
closeButton.Parent = container

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeButton

-- Animated progress indicator
local progressContainer = Instance.new("Frame")
progressContainer.Name = "ProgressContainer"
progressContainer.Size = UDim2.new(1, -20, 0, 2)
progressContainer.Position = UDim2.new(0, 10, 1, -8)
progressContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
progressContainer.BackgroundTransparency = 0.9
progressContainer.Parent = container

local progressCorner = Instance.new("UICorner")
progressCorner.CornerRadius = UDim.new(0, 1)
progressCorner.Parent = progressContainer

local progressBar = Instance.new("Frame")
progressBar.Name = "ProgressBar"
progressBar.Size = UDim2.new(1, 0, 1, 0)
progressBar.Position = UDim2.new(0, 0, 0, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(255, 20, 147)
progressBar.BorderSizePixel = 0
progressBar.Parent = progressContainer

local progressBarCorner = Instance.new("UICorner")
progressBarCorner.CornerRadius = UDim.new(0, 1)
progressBarCorner.Parent = progressBar

-- Modern animations
local slideInTween = TweenService:Create(
    container,
    TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
    {Position = UDim2.new(1, -400, 0, 20)}
)

local slideOutTween = TweenService:Create(
    container,
    TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
    {Position = UDim2.new(1, 20, 0, 20)}
)

local progressTween = TweenService:Create(
    progressBar,
    TweenInfo.new(4, Enum.EasingStyle.Linear),
    {Size = UDim2.new(0, 0, 1, 0)}
)

local iconPopTween = TweenService:Create(
    iconContainer,
    TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0.2),
    {Size = UDim2.new(0, 50, 0, 50)}
)

-- Gradient animation
local gradientTween = TweenService:Create(
    accentGradient,
    TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true),
    {Rotation = 360}
)

-- Glow pulse effect
local glowTween = TweenService:Create(
    outerGlow,
    TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
    {BackgroundTransparency = 0.95}
)

-- Close button hover effect
closeButton.MouseEnter:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.7}):Play()
end)

closeButton.MouseLeave:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.9}):Play()
end)

-- Function to show notification
local function showNotification()
    -- Start icon smaller for pop effect
    iconContainer.Size = UDim2.new(0, 0, 0, 0)
    
    -- Start animations
    slideInTween:Play()
    gradientTween:Play()
    glowTween:Play()
    
    -- Icon pop after slide in
    slideInTween.Completed:Connect(function()
        iconPopTween:Play()
        progressTween:Play()
    end)
    
    -- Auto-hide after progress completes
    progressTween.Completed:Connect(function()
        slideOutTween:Play()
        slideOutTween.Completed:Connect(function()
            screenGui:Destroy()
        end)
    end)
end

-- Close button functionality
closeButton.MouseButton1Click:Connect(function()
    slideOutTween:Play()
    slideOutTween.Completed:Connect(function()
        screenGui:Destroy()
    end)
end)

-- Show the notification
showNotification()
