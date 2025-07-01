-- GRploits Injection Success Notification
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

-- Main notification frame
local notificationFrame = Instance.new("Frame")
notificationFrame.Name = "NotificationFrame"
notificationFrame.Size = UDim2.new(0, 320, 0, 100)
notificationFrame.Position = UDim2.new(1, 20, 0, 20) -- Start off-screen
notificationFrame.BackgroundColor3 = Color3.fromRGB(220, 80, 120) -- Pinkish-red
notificationFrame.BorderSizePixel = 0
notificationFrame.Parent = screenGui

-- Add corner radius
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = notificationFrame

-- Add gradient effect
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(240, 100, 140)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 60, 100))
}
gradient.Rotation = 45
gradient.Parent = notificationFrame

-- Add subtle shadow/glow effect
local shadow = Instance.new("Frame")
shadow.Name = "Shadow"
shadow.Size = UDim2.new(1, 6, 1, 6)
shadow.Position = UDim2.new(0, -3, 0, -3)
shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
shadow.BackgroundTransparency = 0.7
shadow.ZIndex = notificationFrame.ZIndex - 1
shadow.Parent = notificationFrame

local shadowCorner = Instance.new("UICorner")
shadowCorner.CornerRadius = UDim.new(0, 15)
shadowCorner.Parent = shadow

-- Title text (GRploits.com)
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, -20, 0, 35)
titleLabel.Position = UDim2.new(0, 10, 0, 10)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "GRploits.com"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = notificationFrame

-- Status text (Injected successfully)
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Size = UDim2.new(1, -20, 0, 25)
statusLabel.Position = UDim2.new(0, 10, 0, 45)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Injected successfully"
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.TextScaled = true
statusLabel.Font = Enum.Font.Gotham
statusLabel.Parent = notificationFrame

-- Success icon
local iconLabel = Instance.new("TextLabel")
iconLabel.Name = "IconLabel"
iconLabel.Size = UDim2.new(0, 30, 0, 30)
iconLabel.Position = UDim2.new(1, -40, 0, 10)
iconLabel.BackgroundTransparency = 1
iconLabel.Text = "✓"
iconLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
iconLabel.TextScaled = true
iconLabel.Font = Enum.Font.GothamBold
iconLabel.Parent = notificationFrame

-- Progress bar
local progressBar = Instance.new("Frame")
progressBar.Name = "ProgressBar"
progressBar.Size = UDim2.new(1, 0, 0, 3)
progressBar.Position = UDim2.new(0, 0, 1, -3)
progressBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
progressBar.BorderSizePixel = 0
progressBar.Parent = notificationFrame

-- Animation tweens
local slideInTween = TweenService:Create(
    notificationFrame,
    TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    {Position = UDim2.new(1, -340, 0, 20)}
)

local slideOutTween = TweenService:Create(
    notificationFrame,
    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
    {Position = UDim2.new(1, 20, 0, 20)}
)

local progressTween = TweenService:Create(
    progressBar,
    TweenInfo.new(3, Enum.EasingStyle.Linear),
    {Size = UDim2.new(0, 0, 0, 3)}
)

local fadeTween = TweenService:Create(
    notificationFrame,
    TweenInfo.new(0.3, Enum.EasingStyle.Quad),
    {BackgroundTransparency = 1}
)

-- Function to show notification
local function showNotification()
    -- Reset position and transparency
    notificationFrame.Position = UDim2.new(1, 20, 0, 20)
    notificationFrame.BackgroundTransparency = 0
    progressBar.Size = UDim2.new(1, 0, 0, 3)
    
    -- Slide in
    slideInTween:Play()
    
    -- Start progress bar after slide in completes
    slideInTween.Completed:Connect(function()
        progressTween:Play()
    end)
    
    -- Hide after progress completes
    progressTween.Completed:Connect(function()
        slideOutTween:Play()
        slideOutTween.Completed:Connect(function()
            screenGui:Destroy()
        end)
    end)
end

-- Show the notification
showNotification()

-- Optional: Add click to dismiss
notificationFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        slideOutTween:Play()
        slideOutTween.Completed:Connect(function()
            screenGui:Destroy()
        end)
    end
end)
