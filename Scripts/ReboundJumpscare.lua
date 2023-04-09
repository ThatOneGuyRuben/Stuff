-- Instances

local JumpscareDaRebound = Instance.new("ScreenGui")
local ReboundJumpscare = Instance.new("Sound")
local DistortionSoundEffect = Instance.new("DistortionSoundEffect")
local PitchShiftSoundEffect = Instance.new("PitchShiftSoundEffect")
local Frame = Instance.new("Frame")
local pos = Instance.new("ImageLabel")
local face = Instance.new("ImageLabel")

--Properties

JumpscareDaRebound.Name = "JumpscareDaRebound"
JumpscareDaRebound.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
JumpscareDaRebound.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = JumpscareDaRebound
Frame.Active = true
Frame.BackgroundColor3 = Color3.fromRGB(10, 0, 100)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(1, 0, 1, 0)
Frame.Visible = true

ReboundJumpscare.Name = "ReboundJumpscare"
ReboundJumpscare.Parent = JumpscareDaRebound
ReboundJumpscare.SoundId = "rbxassetid://10914800940"
ReboundJumpscare.PlaybackSpeed = 3.000

DistortionSoundEffect.Name = "DistortionSoundEffect"
DistortionSoundEffect.Parent = ReboundJumpscare
DistortionSoundEffect.Level = 1

PitchShiftSoundEffect.Name = "PitchShiftSoundEffect"
PitchShiftSoundEffect.Parent = ReboundJumpscare
PitchShiftSoundEffect.Octave = 0.500

pos.Name = "pos"
pos.Parent = Frame
pos.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
pos.BackgroundTransparency = 1.000
pos.Position = UDim2.new(0, 0, 0, 0)
pos.Size = UDim2.new(1, 0, 1, 0)
pos.Visible = false
pos.Image = "rbxassetid://11228075605"

face.Name = "face"
face.Parent = Frame
face.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
face.BackgroundTransparency = 1.000
face.Position = UDim2.new(0.45, 0, 0.45, 0)
face.Size = UDim2.new(0.1, 0, 0.1, 0)
face.Image = "rbxassetid://11228075605"

--Setup

local TW = game:GetService("TweenService")
local TWInfoJumpscare = TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)
local TWInfoTransparency = TweenInfo.new(0.1)

local TWImagePos = TW:Create(face, TWInfoJumpscare, {Position = face.Parent.pos.Position})
local TWImageSize = TW:Create(face, TWInfoJumpscare, {Size = face.Parent.pos.Size})
local TWFrameTransparencyStart = TW:Create(Frame, TWInfoTransparency, {BackgroundTransparency = 0})
local TWFrameTransparencyEnd = TW:Create(Frame, TWInfoTransparency, {BackgroundTransparency = 1})

task.spawn(function()
	while JumpscareDaRebound do
		Frame.BackgroundColor3 = Color3.fromRGB(255,255,255)
		wait(0.1)
		Frame.BackgroundColor3 = Color3.fromRGB(10,0,100)
		wait(0.1)
	end
end)

TWFrameTransparencyStart:Play()
wait(0.05)
ReboundJumpscare.Playing = true
face.Visible = true
TWImagePos:Play()
TWImageSize:Play()
wait(0.7)
ReboundJumpscare.Playing = false
TWFrameTransparencyEnd:Play()
wait(0.05)
JumpscareDaRebound:Destroy()
