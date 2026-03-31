print("Apple Farm Loaded")

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Frame = Instance.new("Frame", ScreenGui)
local Button = Instance.new("TextButton", Frame)

Frame.Size = UDim2.new(0, 200, 0, 100)
Frame.Position = UDim2.new(0, 50, 0, 50)
Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)

Button.Size = UDim2.new(1, 0, 1, 0)
Button.Text = "Auto Farm: OFF"

local farming = false

Button.MouseButton1Click:Connect(function()
    farming = not farming
    Button.Text = farming and "ON" or "OFF"
end)

while task.wait(0.1) do
    if farming then
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("RemoteEvent") then
                if string.find(string.lower(v.Name),"apple") then
                    pcall(function()
                        v:FireServer()
                    end)
                end
            end
        end
    end
end
