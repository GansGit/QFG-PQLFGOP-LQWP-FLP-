local lplr = game.Players.LocalPlayer
local cam = game:GetService("Workspace").CurrentCamera
local currCam = workspace.CurrentCamera
local HeadOff = Vector3.new(0, 0.5, 0)
local LegOff = Vector3.new(0, 3, 0)

_G.espRun = false
_G.BoxEsp = false
_G.HeaddotEsp = false
_G.HeaddotColor = Color3.new(0.639215, 0.415686, 1)
_G.BoxColour = Color3.new(1, 0.372549, 0.372549)
_G.TeamCheck = false

local function createEspElements()
    local headCircle = Drawing.new("Circle")
    headCircle.Visible = false
    headCircle.Thickness = 3
    headCircle.Transparency = 1
    headCircle.filled = false

    local boxOut = Drawing.new("Square")
    boxOut.Visible = false
    boxOut.Thickness = 3
    boxOut.Transparency = 1
    boxOut.filled = false

    local box = Drawing.new("Square")
    box.Visible = false
    box.Thickness = 3
    box.Transparency = 1
    box.filled = false

    return headCircle, boxOut, box
end

local function boxEsp(v, headCircle, boxOut, box)
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.espRun and v.Team ~= lplr.Team and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v ~= lplr and v.Character.Humanoid.Health > 0 then
            local Vector, onScreen = cam:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
            local RootPart = v.Character.HumanoidRootPart
            local Head = v.Character.Head
            local RootPosition = currCam:worldToViewportPoint(RootPart.Position)
            local HP = currCam:worldToViewportPoint(Head.Position + HeadOff)
            local LP = currCam:worldToViewportPoint(RootPart.Position - LegOff)

            if onScreen then
                if _G.BoxEsp then
                    boxOut.Color = _G.BoxColour
                    box.Color = _G.BoxColour
                    boxOut.Size = Vector2.new(2000 / RootPosition.Z, HP.Y - LP.Y)
                    boxOut.Position = Vector2.new(RootPosition.X - boxOut.Size.X / 2, RootPosition.Y - boxOut.Size.Y / 2)
                    boxOut.Visible = true
                    box.Size = Vector2.new(2000 / RootPosition.Z, HP.Y - LP.Y)
                    box.Position = Vector2.new(RootPosition.X - box.Size.X / 2, RootPosition.Y - box.Size.Y / 2)
                    box.Visible = true
                else
                    box.Visible = false
                    boxOut.Visible = false
                end
                if _G.HeaddotEsp then
                    headCircle.Color = _G.HeaddotColor
                    headCircle.Radius = 5
                    headCircle.Position = Vector2.new(RootPosition.X - boxOut.Size.X / 100, HP.Y)
                    headCircle.Visible = true
                else
                    headCircle.Visible = false
                end
            else
                box.Visible = false
                boxOut.Visible = false
                headCircle.Visible = false
            end
        else
            box.Visible = false
            boxOut.Visible = false
            headCircle.Visible = false
        end
    end)
end

local function setupPlayerEsp(v)
    local headCircle, boxOut, box = createEspElements()
    boxEsp(v, headCircle, boxOut, box)
end

for _, v in pairs(game.Players:GetChildren()) do
    setupPlayerEsp(v)
end

game.Players.PlayerAdded:Connect(setupPlayerEsp)

local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()

local window = OrionLib:MakeWindow({Name = "Gans Privat Cheat", HidePremium = false, SaveConfig = false, IntroEnabled = true, IntroText = "EzWin - Privat Cheat - Gans"})

local MainTab = window:MakeTab({Name = "Main"})

local AimTab = window:MakeTab({Name = "Aim"})

local visuals = window:MakeTab({Name = "Visuals"})

local misc = window:MakeTab({Name = "Misc"})

local extra = window:MakeTab({Name = "Extra"})

-- Visuals Settings
visuals:AddToggle({
    Name = "Enable ESP",
    Default = false,
    Callback = function(v) _G.espRun = v end
})

visuals:AddSection({Name = "Extra"}):AddToggle({
    Name = "Team Check",
    Default = false,
    Callback = function(v) _G.TeamCheck = v end
})

local BoxSection = visuals:AddSection({Name = "Box Settings"})

BoxSection:AddToggle({
    Name = "Box Esp",
    Default = false,
    Callback = function(v) _G.BoxEsp = v end
})

BoxSection:AddColorpicker({
    Name = "Box Color",
    Default = Color3.new(1, 0.372549, 0.372549),
    Callback = function(v) _G.BoxColour = v end
})

local Headdot = visuals:AddSection({Name = "Headdot Settings"})

Headdot:AddToggle({
    Name = "Headdot Esp",
    Default = false,
    Callback = function(v) _G.HeaddotEsp = v end
})

Headdot:AddColorpicker({
    Name = "Headdot Color",
    Default = Color3.new(0.639215, 0.415686, 1),
    Callback = function(v) _G.HeaddotColor = v end
})

-- Misc Settings
misc:AddTextbox({
    Name = "Speed",
    Default = "16",
    TextDisappear = true,
    Callback = function(v) game.Workspace:WaitForChild(lplr.Name):WaitForChild("Humanoid").WalkSpeed = tonumber(v) end
})

misc:AddTextbox({
    Name = "Jumpheight",
    Default = "8",
    TextDisappear = true,
    Callback = function(v) game.Workspace:WaitForChild(lplr.Name):WaitForChild("Humanoid").JumpPower = tonumber(v) end
})

-- Extra Settings
local EUF = extra:AddSection({Name = "Unload"})
EUF:AddButton({
    Name = "Unload",
    Callback = function() OrionLib:Destroy() end
})

local ESC = extra:AddSection({Name = "Credits"})
ESC:AddLabel("Discord: Gans_term")
ESC:AddLabel("TikTok: praytomasn")
ESC:AddLabel("Insta: pray2masn")

OrionLib:Init()