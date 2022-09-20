Metrostroi.DefineSystem("81_717_NN_LastStation")
TRAIN_SYSTEM.DontAccelerateSimulation = true

function TRAIN_SYSTEM:Initialize(texName)
    self.ID = 0
end

function TRAIN_SYSTEM:Outputs()
    return {}
end

function TRAIN_SYSTEM:Inputs()
    return {"+","-"}
end
if TURBOSTROI then return end