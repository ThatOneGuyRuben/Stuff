function GetGitSound(GithubSnd,SoundName)
	local url=GithubSnd
	if not isfile(SoundName..".mp3") then
		writefile(SoundName..".mp3", game:HttpGet(url))
	end
	local sound=Instance.new("Sound")
	sound.SoundId=(getcustomasset or getsynasset)(SoundName..".mp3")
	return sound
end

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()


-- Create entity
local entityTable = Spawner.createEntity({
    CustomName = "Low Intelligence Specimen", -- Custom name of your entity
    Model = "https://github.com/ThatOneGuyRuben/Stuff/blob/main/Models/LowIntelligenceSpecimen.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 75, -- Percentage, 100 = default Rush speed
    DelayTime = 3.5, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    KillRange = 50,
    BackwardsMovement = true,
    BreakLights = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        3.5, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 1,
        WaitTime = 1,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        true, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://12874598437", -- Image1 url
            Image2 = "rbxassetid://12874598437", -- Image2 url
            Shake = true,
            Sound1 = {
                3619734707, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                6343741731, -- SoundId
                { Volume = 1 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 173, 59), --Color
            },
            Tease = {
                false, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"You have died to Low Intelligence Specimen.", "Pay attention to clues that hint his arrival!", "He goes backwards, Hide if he comes!"}, -- custom message
firesignal(game.ReplicatedStorage.EntityInfo.DeathHint.OnClientEvent, {"You have died to Low Intelligence Specimen.", "Pay attention to clues that hint his arrival!", "He goes backwards, Hide if he comes!"}, "Blue")
})

entityTable.Debug.OnEntitySpawned = function()
    local Ambience = GetGitSound("https://github.com/ThatOneGuyRuben/Stuff/blob/main/Sounds/LowIntelligenceSpecimenMoving.mp3?raw=true", "LowIntelligenceSpecimenMoving")
    Ambience.Name = "ti titi ti titi ti titi ti"
    Ambience.Parent = game.Workspace["Low Intelligence Specimen"].RushNew
    Ambience.Looped = true
    Ambience.Volume = 5
    Ambience.Playing = true
    local Arrived = GetGitSound("https://github.com/ThatOneGuyRuben/Stuff/blob/main/Sounds/LowIntelligenceSpecimenMoving.mp3?raw=true", "LowIntelligenceSpecimenMoving")
    Arrived.Name = "OW LAWD HE COMIN HERE BOI WE NEEDA HIDE"
    Arrived.Parent = game.Workspace
    Arrived.Looped = false
    Arrived.Volume = math.huge
    Arrived.Playing = true
end

entityTable.Debug.OnEntityDespawned = function()
    Arrived:Destroy()
end

-- Run the created entity
Spawner.runEntity(entityTable)
