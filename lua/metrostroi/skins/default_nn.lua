Metrostroi.AddSkin("train","Def_717NNDef",{
    name = "Default",
    typ = "81-717_nn",
    textures = {
        ["717_classic1"] = "models/metrostroi_train/NN-717/NN_717_body",
    },
    postfunc = function(ent)
        local bright = math.Rand(1,1.1)
        local colType = math.Round(math.Rand(1,2))
        if colType == 1 then
            ent:SetNW2Vector("BodyColor",Vector(bright,bright,bright-(0.1-0.4*math.random())*bright))
        else
            ent:SetNW2Vector("BodyColor",Vector(bright-(0.1-0.4*math.random())*bright,bright,bright))
        end
    end,
    def=true,
})
Metrostroi.AddSkin("pass","Def_717NNDef",{
    name = "Default",
    typ = "81-717_nn",
    texures = {},
    def=true,
})
Metrostroi.AddSkin("cab","Def_717NNDef",{
    name = "Default",
    typ = "81-717_nn",
    texures = {},
    def=true,
})