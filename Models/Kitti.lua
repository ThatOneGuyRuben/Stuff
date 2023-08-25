local Model = Instance.new("Model")
Model.Parent = workspace
Model.Name = "Kitti"
local Part = Instance.new("Part")
Part.Transparency = 1
Part.Anchored = true
Part.Parent = Model
Part.Name = "RushNew"
Part.Size = Vector3.new(4, 4, 4)
Part.CanCollide = false
local Attach = Instance.new("Attachment")
Attach.Parent = Part
local Particle = Instance.new("ParticleEmitter")
Particle.Parent = Attach
Particle.Texture = "rbxassetid://14555399876"
Particle.Size = NumberSequence.new{ 
NumberSequenceKeypoint.new(0, 4), 
NumberSequenceKeypoint.new(0.5, 4.25), 
NumberSequenceKeypoint.new(1, 4.2), 
}
Particle.Transparency = NumberSequence.new{ 
NumberSequenceKeypoint.new(0, 1), 
NumberSequenceKeypoint.new(0.25, 0), 
NumberSequenceKeypoint.new(1, 1), 
}
Particle.Lifetime = NumberRange.new(0.1, 0.2)
Particle.SpreadAngle = Vector2.new(-360, 360)
Particle.Speed = NumberRange.new(1, 2)
Particle.ZOffset = 4
Particle.LockedToPart = true
Particle.Rotation = NumberRange.new(-4, 4)
Particle.RotSpeed = NumberRange.new(-10,10)
Particle.Rate = 100
Particle.Squash = NumberSequence.new{
    NumberSequenceKeypoint.new(0, -0.18),
    NumberSequenceKeypoint.new(0.5, -0.2),
    NumberSequenceKeypoint.new(1, -0.19),
}
return Model
