Metrostroi.DefineSystem("81_717_NN_RouteNumber")
TRAIN_SYSTEM.DontAccelerateSimulation = true
if TURBOSTROI then return end

function TRAIN_SYSTEM:Initialize(parameter)
    self.Max = parameter or 2
    if not TURBOSTROI then
        local num = IsValid(self.Train.Owner) and (tonumber(self.Train.Owner:GetInfo("metrostroi_route_number","61")) or 0)
        self.RouteNumber =  Format("%03d",num*(10^(3-self.Max))%1000)
        self.Train:SetNW2String("RouteNumber",self.RouteNumber)
    end
end

function TRAIN_SYSTEM:Outputs()
    return {}
end

function TRAIN_SYSTEM:Inputs()
    return {"1+","2+","3+","1-","2-","3-"}
end

if SERVER then
    function TRAIN_SYSTEM:TriggerInput(name,value)
        local Train = self.Train
        local id = tonumber(name[1])
        if name[2]=="+" and value>0 then
            local num = tonumber(self.RouteNumber[id])+1
            if num > 9 then num = 0 end
            self.RouteNumber = self.RouteNumber:SetChar(id,num)
            Train:SetNW2String("RouteNumber",self.RouteNumber)
        end
        if name[2]=="-" and value>0 then
            local num = tonumber(self.RouteNumber[id])-1
            if num < 0 then num = 9 end
            self.RouteNumber = self.RouteNumber:SetChar(id,num)
            Train:SetNW2String("RouteNumber",self.RouteNumber)
        end
    end
else
    function TRAIN_SYSTEM:ClientInitialize(parameter)
        self.Max = parameter or 2
        self.Reloaded = false
    end

    function TRAIN_SYSTEM:ClientThink()
        -- no client model

        local Train = self.Train


        self.Number = string.sub(Train:GetNW2String("RouteNumber", "000"), 0, 2)
        -- self.RouteNumber = Train:GetNW2String("RouteNumber", "000")

        -- local Train = self.Train
        -- local scents = Train.ClientEnts

        -- if self.RouteNumber ~= Train:GetNW2String("RouteNumber","000") then
        --     self.RouteNumber = Train:GetNW2String("RouteNumber","000")
        --     self.Reloaded = false
        -- end
        -- if not scents["route1"] or self.Reloaded then return end

        -- self.Reloaded = true

        -- local rn = Format("%03d",self.RouteNumber)
        -- for i=1,self.Max do
        --     if IsValid(scents["route"..i]) then
        --         scents["route"..i]:SetSkin(rn[i])
        --     end
        -- end
    end
end
