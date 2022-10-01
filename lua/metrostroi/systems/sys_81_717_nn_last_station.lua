Metrostroi.DefineSystem("81_717_NN_LastStation")
TRAIN_SYSTEM.DontAccelerateSimulation = true

function TRAIN_SYSTEM:Initialize(texName)
    self.ID = 0

    self.TriggerNames = {
        "LastSTLeft",
        "LastSTRight",
    }
    self.Triggers = {}
    
    self.Train:LoadSystem("LastSTLeft","Relay","Switch",{bass = true })
    self.Train:LoadSystem("LastSTRight","Relay","Switch",{bass = true })
end

function TRAIN_SYSTEM:Outputs()
    return {}
end

function TRAIN_SYSTEM:Inputs()
    return {}
end
if TURBOSTROI then return end

if SERVER then
    -- function TRAIN_SYSTEM:TrigerInput(name,value)
    --     if self.Train.VB.Value < 0.5 then return end

    --     local tbl = NN_717.Lasts

    --     if tbl and name=="+" and value>0 then
    --         self.ID = self.ID+1
    --         if self.ID>#tbl then self.ID = 0 end
    --     end

    --     if tbl and name=="-" and value>0 then
    --         self.ID = self.ID-1
    --         if self.ID<0 then self.ID = #tbl end
    --     end

    --     self.Train:SetNW2String("LastStation",NN_717.Lasts[self.ID])
    -- end

    function TRAIN_SYSTEM:Trigger(name,value)
        local tbl = NN_717.Lasts

        if tbl and name=="LastSTLeft" and value then
            self.ID = self.ID+1
            if self.ID>#tbl then self.ID = 0 end
        end

        if tbl and name=="LastSTRight" and value then
            self.ID = self.ID-1
            if self.ID<0 then self.ID = #tbl end
        end

        self.Train:SetNW2String("LastStation",NN_717.Lasts[self.ID])
    end

    function TRAIN_SYSTEM:Think()
        local Power = self.Train.VB.Value > 0.5
        local Train = self.Train
        
        if Power then
            for k,v in pairs(self.TriggerNames) do
                -- print(Train[v].Value, v)
                if Train[v] and (Train[v].Value > 0.5) ~= self.Triggers[v] then
                    self:Trigger(v,Train[v].Value > 0.5)
                    self.Triggers[v] = Train[v].Value > 0.5
                end
            end
        end
    end
end
