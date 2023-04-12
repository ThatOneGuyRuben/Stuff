local PlayerSV = game.Players
local Player = PlayerSV.LocalPlayer
local Humanoid = Player.Character.Humanoid

local Creator = {}

Creator.CustomDialogue = function(Config)
    local Text = Config.DialogueText
    local DeathCause = Config.DeathCause
    local Color = Config.Color
    if Color == "Blue" then
        firesignal(game.ReplicatedStorage.EntityInfo.DeathHint.OnClientEvent, Text, "Blue")
    elseif Color == "Yellow" then
        firesignal(game.ReplicatedStorage.EntityInfo.DeathHint.OnClientEvent, Text, "Yellow")
    end
    if DeathCause then
        game.ReplicatedStorage.GameStats["Player_".. Player.Name].Total.DeathCause.Value = DeathCause
    end
    Humanoid.Health = 0
end

return Creator
