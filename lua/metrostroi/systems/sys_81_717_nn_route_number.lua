Metrostroi.DefineSystem("81_717_NN_RouteNumber")
TRAIN_SYSTEM.DontAccelerateSimulation = true

function TRAIN_SYSTEM:Initialize(parameter)
    if TURBOSTROI then return end

    self.Max = parameter or 2
    
    local num = IsValid(self.Train.Owner) and (tonumber(self.Train.Owner:GetInfo("metrostroi_route_number","61")) or 0)
    self.RouteNumber =  Format("%03d",num*(10^(3-self.Max))%1000)
    self.Train:SetNW2String("RouteNumber",self.RouteNumber)
        

    self.TriggerNames = {
        "RouteNumFirstUp",
        "RouteNumFirstDown",
        "RouteNumSecondUp",
        "RouteNumSecondDown",
    }
    self.Triggers = {}
    

end

function TRAIN_SYSTEM:Outputs()
    return {}
end

function TRAIN_SYSTEM:Inputs()
    return {}
end
if TURBOSTROI then return end

if SERVER then
    
    function TRAIN_SYSTEM:Trigger(name,value)
        if not value then return end

        local Train = self.Train

        if name == "RouteNumFirstUp" then
            local id = 2

            local num = tonumber(self.RouteNumber[id])+1
            if num > 9 then num = 0 end
            self.RouteNumber = self.RouteNumber:SetChar(id,num)
            Train:SetNW2String("RouteNumber",self.RouteNumber)
        end

        if name == "RouteNumSecondUp" then
            local id = 1

            local num = tonumber(self.RouteNumber[id])+1
            if num > 9 then num = 0 end
            self.RouteNumber = self.RouteNumber:SetChar(id,num)
            Train:SetNW2String("RouteNumber",self.RouteNumber)
        end

        if name == "RouteNumFirstDown" then
            local id = 2

            local num = tonumber(self.RouteNumber[id])-1
            if num < 0 then num = 9 end
            self.RouteNumber = self.RouteNumber:SetChar(id,num)
            Train:SetNW2String("RouteNumber",self.RouteNumber)
        end

        if name == "RouteNumSecondDown" then
            local id = 1

            local num = tonumber(self.RouteNumber[id])-1
            if num < 0 then num = 9 end
            self.RouteNumber = self.RouteNumber:SetChar(id,num)
            Train:SetNW2String("RouteNumber",self.RouteNumber)
        end
    end

    function TRAIN_SYSTEM:Think()
        local Power = self.Train.VB.Value > 0.5
        local Train = self.Train
        
        if Power then
            for k,v in pairs(self.TriggerNames) do
                if Train[v] and (Train[v].Value > 0.5) ~= self.Triggers[v] then
                    self:Trigger(v,Train[v].Value > 0.5)
                    self.Triggers[v] = Train[v].Value > 0.5
                end
            end
        end
    end
else
    function TRAIN_SYSTEM:ClientInitialize(parameter)
        
    end

    function TRAIN_SYSTEM:ClientThink()
        local Train = self.Train

        self.Number = string.sub(Train:GetNW2String("RouteNumber", "000"), 0, 2)
    end
end
