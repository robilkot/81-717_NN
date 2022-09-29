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

if SERVER then
    function TRAIN_SYSTEM:TriggerInput(name,value)
        
        local tbl = NN_717.Lasts

        if tbl and name=="+" and value>0 then
            self.ID = self.ID+1
            if self.ID>#tbl then self.ID = 0 end
        end

        if tbl and name=="-" and value>0 then
            self.ID = self.ID-1
            if self.ID<0 then self.ID = #tbl end
        end

        self.Train:SetNW2String("LastStation",NN_717.Lasts[self.ID])
    end
end
