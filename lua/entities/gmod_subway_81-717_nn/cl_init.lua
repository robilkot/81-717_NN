--------------------------------------------------------------------------------
-- All the models, materials, sounds belong to their corresponding authors. Permission is granted to only distribute these models through Garry's Mod Steam Workshop and the official Metrostroi GitHub accounts for use with Garry's Mod and Metrostroi Subway Simulator.
--
-- It is forbidden to use any of these models, materials, sounds and other content for any commercial purposes without an explicit permission from the authors. It is forbidden to make any changes in these files in any derivative projects without an explicit permission from the author.
--
-- The following models are (C) 2015-2018 oldy (Aleksandr Kravchenko). All rights reserved.
-- models\metrostroi_train\81-502:
-- - 81-502  (Ema-502 head)
-- - 81-501  (Em-501 intermediate)
-- models\metrostroi_train\81-702:
-- - 81-702  (D head)
-- - 81-702  (D intermediate)
-- models\metrostroi_train\81-703:
-- - 81-703  (E head)
-- - 81-508  (E intermediate)
-- models\metrostroi_train\81-707:
-- - 81-707  (Ezh head)
-- - 81-708  (Ezh1 intermediate)
-- models\metrostroi_train\81-710:
-- - 81-710  (Ezh3 head)
-- - 81-508T (Em-508T intermediate)
-- models\metrostroi_train\81-717:
-- - 81-717  (Moscow head)
-- - 81-714  (Moscow intermediate)
-- - 81-717  (St. Petersburg head)
-- - 81-714  (St. Petersburg intermediate)
-- models\metrostroi_train\81-718:
-- - 81-718  (TISU head)
-- - 81-719  (TISU intermediate)
-- models\metrostroi_train\81-720:
-- - 81-720  (Yauza head)
-- - 81-721  (Yauza intermediate)
-- - 81-722  (Yubileyniy head)
-- models\metrostroi_train\81-722:
-- - 81-723  (Yubileyniy intermediate motor)
-- - 81-724  (Yubileyniy intermediate trailer)
--------------------------------------------------------------------------------
include("shared.lua")

--------------------------------------------------------------------------------
ENT.ClientProps = {}
ENT.ButtonMap = {}
ENT.AutoAnims = {}
ENT.ClientSounds = {}

ENT.ClientProps["salon"] = {
    model = "models/metrostroi_train/NN-717/NN_717_int.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hide=2,
}
ENT.ClientProps["body_additional"] = {
    model = "models/metrostroi_train/81-717/717_body_additional.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hide=2,
}
ENT.ClientProps["schemes"] = {
    model = "models/metrostroi_train/NN-717/NN_schemes.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hide=2,
    callback = function(ent)
        ent.PassSchemesDone = false
    end,
}
-- ENT.ClientProps["destination"] = {
--     model = "models/metrostroi_train/81-717/labels/destination.mdl",
--     pos = Vector(-0.5,0,0),
--     ang = Angle(0,0,0),
--     hide=2,
--     callback = function(ent)
--         ent.LastStation.Reloaded = false
--     end,
-- }
-- ENT.ClientProps["destination1"] = {
--     model = "models/metrostroi_train/81-717/labels/destination.mdl",
--     pos = Vector(-0.3,0,0),
--     ang = Angle(0,0,0),
--     hide=2,
--     callback = function(ent)
--         ent.LastStation.Reloaded = false
--     end,
-- }
ENT.ButtonMap["EMU"] = {
    pos = Vector(457.6,30,40),
    ang = Angle(0,270,90),
    width = 400,
    height = 150,
    scale = 0.0625,
    buttons = {
        {ID = "LastSTLeftSet",x=95, y=118.8, radius=8, tooltip = "??????: ???????????????????? ????????????????",model = {
            model = "models/metrostroi_train/81-720/button_round.mdl",
            var="LastSTLeft",speed=12, vmin=0, vmax=0.9,
            sndvol = 0.5,snd = function(val) return val and "pnm_button1_on" or "pnm_button1_off" end,
            sndmin = 50,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "LastSTRightSet",x=95+47, y=118.8, radius=8, tooltip = "??????: ?????????????????? ????????????????",model = {
            model = "models/metrostroi_train/81-720/button_round.mdl",
            var="LastSTRight",speed=12, vmin=0, vmax=0.9,
            sndvol = 0.5,snd = function(val) return val and "pnm_button1_on" or "pnm_button1_off" end,
            sndmin = 50,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "RouteNumFirstUpSet",x=95+31, y=100, radius=8, tooltip = "??????: ???????????????? ???????????? ??????????",model = {
            model = "models/metrostroi_train/81-720/button_round.mdl",
            var="RouteNumFirstUp",speed=12, vmin=0, vmax=0.9,
            sndvol = 0.5,snd = function(val) return val and "pnm_button1_on" or "pnm_button1_off" end,
            sndmin = 50,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "RouteNumFirstDownSet",x=95+31, y=100+18.8*2, radius=8, tooltip = "??????: ???????????????? ???????????? ??????????",model = {
            model = "models/metrostroi_train/81-720/button_round.mdl",
            var="RouteNumFirstDown",speed=12, vmin=0, vmax=0.9,
            sndvol = 0.5,snd = function(val) return val and "pnm_button1_on" or "pnm_button1_off" end,
            sndmin = 50,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "RouteNumSecondUpSet",x=95+16, y=100, radius=8, tooltip = "??????: ???????????????? ???????????? ??????????",model = {
            model = "models/metrostroi_train/81-720/button_round.mdl",
            var="RouteNumSecondUp",speed=12, vmin=0, vmax=0.9,
            sndvol = 0.5,snd = function(val) return val and "pnm_button1_on" or "pnm_button1_off" end,
            sndmin = 50,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "RouteNumSecondDownSet",x=95+16, y=100+18.8*2, radius=8, tooltip = "??????: ???????????????? ???????????? ??????????",model = {
            model = "models/metrostroi_train/81-720/button_round.mdl",
            var="RouteNumSecondDown",speed=12, vmin=0, vmax=0.9,
            sndvol = 0.5,snd = function(val) return val and "pnm_button1_on" or "pnm_button1_off" end,
            sndmin = 50,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        -- {ID = "LastStation-",x=000,y=0,w=438,h=205, tooltip=""},
        -- {ID = "LastStation+",x=438,y=0,w=438,h=205, tooltip=""},
    }
}
ENT.ClientProps["EMU_route_number_1"] = {
    model = "models/metrostroi_train/81-717/segments/segment_spb.mdl",
    pos = Vector(457.7,22.2,32.6),
    ang = Angle(90,180,0),
    color = Color(175,250,20),
    scale = 0.8,
    hideseat=1,
}
ENT.ClientProps["EMU_route_number_2"] = {
    model = "models/metrostroi_train/81-717/segments/segment_spb.mdl",
    pos = Vector(457.7,23,32.6),
    ang = Angle(90,180,0),
    color = Color(175,250,20),
    scale = 0.8,
    hideseat=1,
}
ENT.ClientProps["brake_valve_334"] = {
    model = "models/metrostroi_train/81-717/brake_valves/334.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hideseat=1,
}
ENT.ClientProps["brake_valve_013"] = {
    model = "models/metrostroi_train/81-717/brake_valves/013.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hideseat=1,
}
ENT.ClientProps["lamps1"] = {
    model = "models/metrostroi_train/81-540b/minsk_lamp_type4.mdl",
    pos = Vector(-100+9,0,0.1),
    ang = Angle(0,90,0),
    hide=1.5,
}
-- ENT.ClientProps["lamps1"] = {
--     model = "models/metrostroi_train/81-540b/minsk_lamp_type4_int.mdl",
--     pos = Vector(-27,0,0),
--     ang = Angle(0,90,0),
--     hide=1.5,
-- }

-- ENT.ClientProps["handrails_old"] = {
--     model = "models/metrostroi_train/81-717/handlers_old.mdl",
--     pos = Vector(0,0,0),
--     ang = Angle(0,0,0),
--     hide=1.5,
-- }
-- ENT.ClientProps["handrails_new"] = {
--     model = "models/metrostroi_train/81-717/handlers_new.mdl",
--     pos = Vector(0,0,0),
--     ang = Angle(0,0,0),
--     hide=1.5,
-- }

ENT.ClientProps["mask_nn"] = {
    model = "models/metrostroi_train/NN-717/NN_717_mask.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    nohide=true,
}

-- ENT.ClientProps["mask22_mvm"] = {
--     model = "models/metrostroi_train/81-717/mask_22.mdl",
--     pos = Vector(0,0,0),
--     ang = Angle(0,0,0),
--     nohide=true,
-- }
-- ENT.ClientProps["mask222_mvm"] = {
--     model = "models/metrostroi_train/81-717/mask_222.mdl",
--     pos = Vector(0,0,0),
--     ang = Angle(0,0,0),
--     nohide=true,
-- }
-- ENT.ClientProps["mask222_lvz"] = {
--     model = "models/metrostroi_train/81-717/mask_spb_222.mdl",
--     pos = Vector(0,0,0),
--     ang = Angle(0,0,0),
--     nohide=true,
-- }
-- ENT.ClientProps["mask141_mvm"] = {
--     model = "models/metrostroi_train/81-717/mask_141.mdl",
--     pos = Vector(0,0,0),
--     ang = Angle(0,0,0),
--     nohide=true,
-- }
/*

ENT.ClientProps["Headlights222_1"] = {
    model = "models/metrostroi_train/81-717/lamps/headlights_222_group1.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    nohide=true,
}
ENT.ClientProps["Headlights222_2"] = {
    model = "models/metrostroi_train/81-717/lamps/headlights_222_group2.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    nohide=true,
}
ENT.ClientProps["Headlights141_1"] = {
    model = "models/metrostroi_train/81-717/lamps/headlights_141_group1.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    nohide=true,
}
ENT.ClientProps["Headlights141_2"] = {
    model = "models/metrostroi_train/81-717/lamps/headlights_141_group2.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    nohide=true,
}
ENT.ClientProps["Headlights22_1"] = {
    model = "models/metrostroi_train/81-717/lamps/headlights_22_group2.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    nohide=true,
}
ENT.ClientProps["Headlights22_2"] = {
    model = "models/metrostroi_train/81-717/lamps/headlights_22_group1.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    nohide=true,
}
*/

ENT.ClientProps["Headlights_1"] = {
    model = "models/metrostroi_train/81-717/mask_141_lights1.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    nohide=true,
}
ENT.ClientProps["Headlights_2"] = {
    model = "models/metrostroi_train/81-717/mask_141_lights2.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    nohide=true,
}
ENT.ClientProps["Headlights_glass"] = {
    model = "models/metrostroi_train/81-717/mask_141_glass.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    nohide=true,
}


ENT.ClientProps["RedLights"] = {
    model = "models/metrostroi_train/81-717/lamps/redlights.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    color = Color(200,200,200),
    nohide=true,
}
--[[
ENT.ClientProps["otsek_cap_l"] = {
    model = "models/metrostroi_train/81-717/otsek_cap_l.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0)
}
ENT.ClientProps["otsek_cap_r"] = {
    model = "models/metrostroi_train/81-717/otsek_cap_r.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0)
}
]]
ENT.ClientProps["door_otsek1"] = {
    model = "models/metrostroi_train/NN-717/NN_717_int_door1.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hideseat=1.7,
}
ENT.ClientProps["door_otsek2"] = {
    model = "models/metrostroi_train/NN-717/NN_717_int_door2.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hideseat=1.7,
}
ENT.ClientProps["door1"] = {
    model = "models/metrostroi_train/81-717/door_torec.mdl",
    pos = Vector(-472.5,15.75,-2.7),
    ang = Angle(0,-90,0),
    hide=2,
}
ENT.ClientProps["door2"] = {
    model = "models/metrostroi_train/81-717/cab_door.mdl",
    pos = Vector(377.322,28.267,-1.599),
    ang = Angle(0,-90,0),
    hide=2,
}
ENT.ClientProps["door3"] = {
    model = "models/metrostroi_train/81-717/door_cabine.mdl",
    pos = Vector(443.493,65.111,0.277),
    ang = Angle(0,-90,0),
    hide=2,
}

ENT.ClientProps["cabine_nn"] = {
    model = "models/metrostroi_train/NN-717/NN_717_cabine_kvr.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hide=2,
}
ENT.ClientProps["cabine_nn_add"] = {
    model = "models/metrostroi_train/NN-717/NN_717_cabine_additional.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hide=2,
}
ENT.ClientProps["new_voltm"] = {
    model = "models/dev4you/new_voltm/new_voltm.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hide=2,
}
ENT.ClientProps["new_voltm_light"] = {
    model = "models/dev4you/new_voltm/new_voltm_light.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hide=2,
}
-- 

local KVs = {
    "models/metrostroi_train/81-717/kv_black.mdl",
    "models/metrostroi_train/81-717/kv_white.mdl",
    "models/metrostroi_train/81-717/kv_wood.mdl",
    "models/metrostroi_train/81-717/kv_yellow.mdl",
}
ENT.ClientProps["Controller"] = {
    model = "models/metrostroi_train/81-717/kv_black.mdl",
    pos = Vector(435.848+0.08,16.1,-19.779+4.75-0.01),
    ang = Angle(0,-90,-32),
    hideseat=0.2,
    modelcallback = function(ent,cent)
        if ent.Anims.Controller then ent.Anims.Controller.reload = true end
        return KVs[ent:GetNW2Int("KVType",1)]
    end,
}
ENT.ClientProps["body_gray"] = {
    model = "models/metrostroi_train/81-717/pult/body_classic.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    color = Color(255,255,255),
    hide=2.5,
}

ENT.ClientProps["pult_mvm_classic"] = {
    model = "models/metrostroi_train/NN-717/NN_717_pult.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    color = Color(255,255,255),
    hideseat=0.8,
}
ENT.ClientProps["ars_mvm"] = {
    model = "models/metrostroi_train/81-717/pult/ars_spb.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hideseat=0.8,
}
--[[
ENT.ClientProps["ars_mvm_round"] = {
    model = "models/metrostroi_train/81-717/pult/ars_round.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hideseat=0.8,
}
ENT.ClientProps["ars_mvm_round_yellow"] = {
    model = "models/metrostroi_train/81-717/pult/ars_round_yellow.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hideseat=0.8,
}
ENT.ClientProps["ars_mvm_square"] = {
    model = "models/metrostroi_train/81-717/pult/ars_square.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hideseat=0.8,
}
ENT.ClientProps["ars_mvm_old"] = {
    model = "models/metrostroi_train/81-717/pult/ars_old.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hideseat=0.8,
}
ENT.ClientProps["ars_mvm_old_yellow"] = {
    model = "models/metrostroi_train/81-717/pult/ars_old_yellow.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hideseat=0.8,
}--]]


ENT.ButtonMap["ECRSScreen"] = {
    pos = Vector(448,-38.3,9.3),
    ang = Angle(0,-115.5,90),
    width = 57,
    height = 44,
    scale = 0.012,
    hideseat=0.2,
}
ENT.ClientProps["ecrs_light"] = {
    model = "models/metrostroi_train/81-5401/5401_cab_ecrs_light.mdl",
    pos = Vector(-20.8,-13.17,-3.82),
    ang = Angle(0,0,0),
    hideseat=1,
}
ENT.ButtonMap["Motorolla"] = {
    pos = Vector(470.12,-22.1,13.8),
    ang = Angle(0,-115.5,90),
    width = 180,
    height = 60,
    scale = 0.0625,
    hideseat=0.2,

    buttons = {
		{ID = "ECRS_CancelSet",x=125, y=15, radius = 8, tooltip="????????????/??????./????????.", model = {
			z=1,ang=Angle(-90,0,0),
			var = "ECRS_Cancel",speed=12,
		}},				
		{ID = "ECRS_BRTSet",x=165, y=50, radius = 4.5, tooltip="??????????????", model = {
			z=1,ang=Angle(-90,0,0),
			var = "ECRS_BRT",speed=12,
		}},
        {ID = "ECRS_F1Set",x=112, y=18.5, radius = 4.5, tooltip="????????????", model = {
            z=1,ang=Angle(-90,0,0),
            var = "ECRS_F1",speed=12,
        }}, 
        {ID = "ECRS_F2Set",x=112, y=18.5+25, radius = 4,5, tooltip="??????????", model = {
            z=1,ang=Angle(-90,0,0),
            var = "ECRS_F2",speed=12,
        }}, 
        {ID = "ECRS_leftSet",x=117.2, y=30.5, radius = 3.5, tooltip="??????????", model = {
            z=1,ang=Angle(-90,0,0),
            var = "ECRS_left",speed=12,
        }}, 
        {ID = "ECRS_rightSet",x=117.2+11, y=30.5, radius = 3.5, tooltip="????????????", model = {
            z=1,ang=Angle(-90,0,0),
            var = "ECRS_right",speed=12,
        }}, 
    }
}
ENT.ButtonMap["Motorolla"].pos = ENT.ButtonMap["Motorolla"].pos + Vector(-20.9,-13.3,-3.900000)
--var="ZS",vmin=0,vmax=1,min=0,max=1,speed=16,damping=false,
-- Main panel
ENT.ButtonMap["Block5_6"] = {
    pos = Vector(455.0-6,12.3,2.5-10.5+5.35),--446 -- 14 -- -0,5
    ang = Angle(0,-90,44),
    width = 480,
    height = 225,
    scale = 0.0625,
    hideseat=0.2,

    buttons = {
        {   ID = "R_UNchToggle",x=44+25.5*0,y=40,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-502/buttons/tumbler_w_a.mdl",ang = 180,z=-3,
            var="R_UNch",speed=16,
            sndvol = 1,snd = function(val) return val and "switchbl_on" or "switchbl_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {   ID = "R_ZSToggle",x=44+25.5*1,y=40,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-502/buttons/tumbler_w_a.mdl",ang = 180,z=-3,
            var="R_ZS",speed=16,
            sndvol = 1,snd = function(val) return val and "switchbl_on" or "switchbl_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {   ID = "R_GToggle",x=44+25.5*2,y=40,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-502/buttons/tumbler_w_a.mdl",ang = 180,z=-3,
            var="R_G",speed=16,
            sndvol = 1,snd = function(val) return val and "switchbl_on" or "switchbl_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {   ID = "R_RadioToggle",x=44+25.5*3,y=40,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-502/buttons/tumbler_w_a.mdl",ang = 180,z=-3,
            var="R_Radio",speed=16,
            sndvol = 1,snd = function(val) return val and "switchbl_on" or "switchbl_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "!R_ProgramToggle",x=155,y=40,radius=0,model = {
            model = "models/metrostroi_train/81-502/buttons/tumbler_b_a.mdl",ang = 90,z=-3,
            getfunc = function(ent) return ent:GetPackedBool("R_Program1") and 0 or (ent:GetPackedBool("R_Program2") and 1 or 0.5) end,
            var="R_Program",speed=16
        }},
        {ID = "R_Program1Set",x=155-20,y=40-10,w=20,h=20,tooltip="",model = {
            var="R_Program1",sndid = "!R_ProgramToggle",
            sndvol = 0.5,snd = function(val) return val and "triple_0-down" or "triple_down-0" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "R_Program2Set",x=155+0,y=40-10,w=20,h=20,tooltip="",model = {
            var="R_Program2",sndid = "!R_ProgramToggle",
            sndvol = 0.5,snd = function(val) return val and "triple_0-up" or "triple_up-0" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},

        --{ID = "1:KVTSet",x=247,y=33,radius=20,tooltip=""},
        {   ID = "1:KVTSet",x=263-(263-234)/2--[[240]],y=36,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_red.mdl",z = -3,
            var="KVT",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button1_on" or "button1_off" end,
            sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {   ID = "1:KVTRSet",x=293,y=36,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_red.mdl",z = -3,
            var="KVTR",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button1_on" or "button1_off" end,
            sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {   ID = "2:KVTSet",x=293,y=36,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_red.mdl",z = -3,
            var="KVT",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button1_on" or "button1_off" end,
            sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {   ID = "2:KVTRSet",x=263-(263-234)/2--[[240]],y=36,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_red.mdl",z = -3,
            var="KVTR",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button1_on" or "button1_off" end,
            sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "!L1Light",x=333,y=42,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_slc77.mdl",ignorepanel = true,skin = 1,z = -3,
            lamp = {model = "models/metrostroi_train/81-717/buttons/slc_77_lamp.mdl",ang=63,x=-0.3,y=-0.3,z=20.6,var="L1",color=Color(255,60,40)},
        }},
        {ID = "VZ1Set",x=372.5,y=36,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_black.mdl",z = -3,
            var="VZ1",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button2_on" or "button2_off" end,
            sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {   ID = "V13Toggle",x=438,y=42,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-502/buttons/tumbler_w_a.mdl",ang = 180,z=-3,
            var="V13",speed=16,
            sndvol = 1,snd = function(val) return val and "switchbl_on" or "switchbl_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},



        --{ID = "AutodriveToggle",x=420,y=92,radius=20,tooltip=""},

        {ID = "VUD1Toggle",x=60,y=103,radius=40,tooltip="",model = {
            model = "models/metrostroi_train/switches/vudblack.mdl",z=-20,
            var="VUD1",speed=6,
            sndvol = 1,snd = function(val) return val and "vu224_on" or "vu224_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "KDLSet",x=60,y=170,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-502/buttons/button_717_3.mdl",
            var="KDL",speed=16,min=1,max=0,z=-2,
            lamp = {model = "models/metrostroi_train/81-717/buttons/lamp_button_1.mdl",anim=true,var="DoorsLeftL",speed=9,z=2.2,color=Color(255,130,80)},
            sndvol = 0.07,snd = function(val) return val and "button3_on" or "button3_off" end,sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "KDLKToggle",x=40,y=180,w=40,h=20,tooltip="",model = {
            var="KDLK",speed=8,min=0.32,max=0.68,disable="KDLSet",
            model = "models/metrostroi_train/81/krishka.mdl",ang = 0,z = -3,
            sndvol = 1,snd = function(val) return val and "kr_close" or "kr_open" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "KDLRSet",x=155,y=170,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-502/buttons/button_717_3.mdl",
            var="KDLR",speed=16,min=1,max=0,z=-2,
            lamp = {model = "models/metrostroi_train/81-717/buttons/lamp_button_1.mdl",anim=true,var="DoorsLeftL",speed=9,z=2.2,color=Color(255,130,80)},
            sndvol = 0.07,snd = function(val) return val and "button3_on" or "button3_off" end,sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "KDLRKToggle",x=135,y=180,w=40,h=20,tooltip="",model = {
            model = "models/metrostroi_train/81/krishka.mdl",ang = 0,z = -3,
            var="KDLRK",speed=8,min=0.32,max=0.68,disable="KDLRSet",
            sndvol = 1,snd = function(val) return val and "kr_close" or "kr_open" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "DoorSelectToggle",x=107.5,y=183.5,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_pp250.mdl",ang = 180,z=-8,
            var="DoorSelect",speed=16,
            sndvol = 1,snd = function(val) return val and "switch_on" or "switch_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "KRZDSet",x=155,y=85,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_black.mdl",z = -3,
            var="KRZD",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button3_on" or "button3_off" end,sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "R_VPRToggle",x=107,y=85,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-502/buttons/tumbler_w_a.mdl",ang = 180,z=-3,
            var="R_VPR",speed=16,
            sndvol = 1,snd = function(val) return val and "switchbl_on" or "switchbl_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "VozvratRPSet",x=107,y=132,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_black.mdl",z = -3,
            var="VozvratRP",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button2_on" or "button1_off" end,sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},

        {ID = "!GreenRPLight",x=155,y=132,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_slc77.mdl",z = -3,
            lamp = {model = "models/metrostroi_train/81-717/buttons/slc_77_lamp.mdl",ang=2,x=-0.3,y=-0.3,z=20.6,var="GreenRP",color=Color(100,255,100)}
        }},
        {ID = "!AVULight",x=333,y=98,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_slc77.mdl",skin = 1,z = -3,
            lamp = {model = "models/metrostroi_train/81-717/buttons/slc_77_lamp.mdl",ang=62,x=-0.3,y=-0.3,z=20.6,var="AVU",color=Color(255,60,40)},
        }},
        {ID = "!LKVPLight",x=377,y=98,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_slc77.mdl",ignorepanel = true,skin = 3,z = -3,
            lamp = {model = "models/metrostroi_train/81-717/buttons/slc_77_lamp.mdl",ang=25,x=-0.3,y=-0.3,z=20.6,var="LKVP",color=Color(255,170,110)},
        }},
        {ID = "!SPLight",x=412,y=42,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_slc77.mdl",ignorepanel = true,skin = 1,z = -3,
            lamp = {model = "models/metrostroi_train/81-717/buttons/slc_77_lamp.mdl",ang=63,x=-0.3,y=-0.3,z=20.6,var="LSP",color=Color(100,255,50)},
        }},

        {ID = "OtklAVUToggle",x=241,y=85,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_t1.mdl",ang = 180,z=-4,
            var="OtklAVU",speed=16,
            plomb = {model = "models/metrostroi_train/81/plomb.mdl",ang=270,x=-1,y=26,var="OtklAVUPl",ID="OtklAVUPl",},
            sndvol = 1,snd = function(val) return val and "switchbl_on" or "switchbl_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "OtklBVSet",x=293,y=90,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_black.mdl",z = -3,
            var="OtklBV",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button1_on" or "button1_off" end,
            sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        --{ID = "KAHPl",x=37,y=68,radius=20,tooltip=""},
        {ID = "OtklBVKToggle",x=273,y=100,w=40,h=20,tooltip="",model = {
            model = "models/metrostroi_train/81/krishka.mdl",ang = 0,z = -1,
            var="OtklBVK",speed=8,min=0.378,max=0.685,disable="OtklBVSet",
            plomb = {model = "models/metrostroi_train/81/plomb.mdl",ang=135,x=-17,y=-45,z=-0,var="OtklBVPl",ID="OtklBVPl",},
            getfunc = function(ent) return ent:GetPackedBool("OtklBVK") and 1 or ent.Anims.ARSRToggle and math.max(0,(ent.Anims.ARSRToggle.val-0.5)*2 or 0)^0.2*0.08 or 0 end,
            sndvol = 1,snd = function(val) return val and "kr_close" or "kr_open" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},

        {   ID = "V11Toggle",x=357,y=70,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-502/buttons/tumbler_w_a.mdl",ang = 180,z=-3,
            var="V11",speed=16,
            sndvol = 1,snd = function(val) return val and "switchbl_on" or "switchbl_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {   ID = "V12Toggle",x=400,y=70,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-502/buttons/tumbler_w_a.mdl",ang = 180,z=-3,
            var="V12",speed=16,
            sndvol = 1,snd = function(val) return val and "switchbl_on" or "switchbl_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},

        {ID = "ConverterProtectionSet",x=333,y=133,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-502/buttons/button_717_1.mdl",
            var="ConverterProtection",speed=16,min=1,max=0,z=-4,
            lamp = {model = "models/metrostroi_train/81-717/buttons/lamp_button_2.mdl",anim=true,var="RZP",speed=9,z=2.2},
            sndvol = 0.07,snd = function(val) return val and "button3_on" or "button3_off" end,sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "KSNSet",x=377,y=133,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_black.mdl",z = -3,
            var="KSN",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button3_on" or "button2_off" end,sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "RingSet",x=420,y=133,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_black.mdl",z = -3,
            var="Ring",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button2_on" or "button2_off" end,sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},

        {ID = "ARSToggle",x=234,y=134,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_t2.mdl",ang = 180,z=-6,
            var="ARS",speed=16,
            sndvol = 1,snd = function(val) return val and "switchbl_on" or "switchbl_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "ALSToggle",x=263,y=134,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_t2.mdl",ang = 180,z=-6,
            var="ALS",speed=16,
            plomb = {model = "models/metrostroi_train/81/plomb.mdl",ang=90,x=2,y=-26,z=2,var="ALSPl",ID="ALSPl",},
            sndvol = 1,snd = function(val) return val and "switchbl_on" or "switchbl_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "ARSRToggle",x=293,y=134,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_t2.mdl",ang = 180,z=-6,
            var="ARSR",speed=16,
            sndvol = 1,snd = function(val) return val and "switchbl_on" or "switchbl_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},

        {ID = "OVTToggle",x=240,y=181,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_pp250.mdl",ang = 180,z=-8,
            var="OVT",speed=16,
            plomb = {model = "models/metrostroi_train/81/plomb.mdl",ang=270,x=-1,y=26,z=4,var="OVTPl",ID="OVTPl",},
            sndvol = 1,snd = function(val) return val and "switch_on" or "switch_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "ALSFreqToggle",x=278,y=181,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_pp250.mdl",ang = 180,z=-8,
            var="ALSFreq",speed=16,
            sndvol = 1,snd = function(val) return val and "switch_on" or "switch_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "L_1Toggle",x=316,y=181,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_pp250.mdl",ang = 180,z=-8,
            var="L_1",speed=16,
            sndvol = 1,snd = function(val) return val and "switch_on" or "switch_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "L_2Toggle",x=353,y=181,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_pp250.mdl",ang = 180,z=-8,
            var="L_2",speed=16,
            sndvol = 1,snd = function(val) return val and "switch_on" or "switch_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "L_3Toggle",x=391,y=181,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_pp250.mdl",ang = 180,z=-8,
            var="L_3",speed=16,
            sndvol = 1,snd = function(val) return val and "switch_on" or "switch_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
    }
}

-- Front panel
ENT.ButtonMap["Block7"] = {
    pos = Vector(446.22,-17.6,-5.48+5.35),
    ang = Angle(0,-90,58),
    width = 178,
    height = 222,
    scale = 0.0625,
    hideseat=0.2,

    buttons = {
        {ID = "L_4Toggle",x=42,y=180.5,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_pp250.mdl",ang = 180,z=-4,
            var="L_4",speed=16,
            sndvol = 1,snd = function(val) return val and "switch_on" or "switch_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "VUSToggle",x=74.5,y=180.5,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_pp250.mdl",ang = 180,z=-4,
            var="VUS",speed=16,
            sndvol = 1,snd = function(val) return val and "switch_on" or "switch_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "VADToggle",x=107,y=180.5,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_pp250.mdl",ang = 180,z=-4,
            var="VAD",speed=16,
            --plomb = {model = "models/metrostroi_train/81/plomb.mdl",ang=270,x=-1,y=28,z=4,var="VADPl",ID="VADPl",},
            sndvol = 1,snd = function(val) return val and "switch_on" or "switch_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "VAHToggle",x=140,y=180.5,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_pp250.mdl",ang = 180,z=-4,
            var="VAH",speed=16,
            plomb = {model = "models/metrostroi_train/81/plomb.mdl",ang=270,x=-1,y=28,z=4,var="VAHPl",ID="VAHPl",},
            sndvol = 1,snd = function(val) return val and "switch_on" or "switch_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},

        {ID = "KRPSet",x=43,y=30,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_black.mdl",z = -2,
            var="KRP",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button1_on" or "button1_off" end,sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "KAHSet",x=43,y=88,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_black.mdl",z = -2,
            var="KAH",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button2_on" or "button2_off" end,sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        --{ID = "KAHPl",x=37,y=68,radius=20,tooltip=""},
        {ID = "KAHKToggle",x=23,y=98,w=40,h=20,tooltip="",model = {
            model = "models/metrostroi_train/81/krishka.mdl",ang = 0,z = -1,
            var="KAHK",speed=8,min=0.43,max=0.685,disable="KAHSet",
            plomb = {model = "models/metrostroi_train/81/plomb.mdl",ang=135,x=-17,y=-45,z=-0,var="KAHPl",ID="KAHPl",},
            sndvol = 1,snd = function(val) return val and "kr_close" or "kr_open" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},

        {ID = "!PNT",x=45,y=130,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_slc77.mdl",skin = 2,z = -1,
            lamp = {model = "models/metrostroi_train/81-717/buttons/slc_77_lamp.mdl",ang=43,x=-0.3,y=-0.3,z=20.6,var="PN",color=Color(255,170,110)},
        }},
        {ID = "KDPSet",x=90,y=130,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-502/buttons/button_717_3.mdl",
            var="KDP",speed=16,min=1,max=0,z=-2,
            lamp = {model = "models/metrostroi_train/81-717/buttons/lamp_button_1.mdl",anim=true,var="DoorsRightL",speed=9,z=2.2,color=Color(255,130,80)},
            sndvol = 0.07,snd = function(val) return val and "button3_on" or "button3_off" end,sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "KDPKToggle",x=70,y=140,w=40,h=20,tooltip="",model = {
            model = "models/metrostroi_train/81/krishka.mdl",ang = 0,z = -1,
            var="KDPK",speed=8,min=0.33,max=0.685,disable="KDPSet",
            sndvol = 1,snd = function(val,realval) return val and "kr_close" or "kr_open" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},

        {ID = "!PNW",x=135,y=130,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_slc77.mdl",skin = 4,z = -1,
            lamp = {model = "models/metrostroi_train/81-717/buttons/slc_77_lamp.mdl",ang=81,x=-0.3,y=-0.3,z=20.6,var="BrW",color=Color(255,130,90)},
        }},
    }
}

ENT.ButtonMap["Block1"] = {
    pos = Vector(450.4,28.2,1.3+5.35),
    ang = Angle(0,-90,58),
    width = 290,
    height = 110,
    scale = 0.0625,
    hideseat=0.2,

    buttons = {
        {ID = "VMKToggle",x=39,y=30,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_pp250.mdl",ang = 180,z=-5,
            var="VMK",speed=16,
            sndvol = 1,snd = function(val) return val and "switch_on" or "switch_off" end,sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "BPSNonToggle",x=80,y=30,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_pp250.mdl",ang = 180,z=-5,
            var="BPSNon",speed=16,
            sndvol = 1,snd = function(val) return val and "switch_on" or "switch_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},

        {ID = "RezMKSet",x=80,y=80,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_red.mdl",z = -2,
            var="RezMK",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button3_on" or "button3_off" end,sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "ARS13Set",x=130,y=80,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_black.mdl",z = -2,
            var="ARS13",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button1_on" or "button2_off" end,sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "!BatteryVoltage", x=220,y=55,radius=60,tooltip=""},
    }
}

ENT.ButtonMap["Block3"] = {
    pos = Vector(450.4,-10,1.3+5.35),
    ang = Angle(0,-90,58),
    width = 290,
    height = 110,
    scale = 0.0625,
    hideseat=0.2,

    buttons = {
        {ID = "!BLTLPressure", x=62, y=55, radius=55, tooltip=""},
        {ID = "!BCPressure", x=182, y=55, radius=55, tooltip=""},
    }
}


ENT.ClientProps["E_informator"] = {
    model = "models/metrostroi_train/equipment/rri_informator_portable.mdl",
    pos = Vector(392,-27,-34),
    ang = Angle(0,180,0),
    hideseat=0.2,
}
ENT.ButtonMap["RRIScreen"] = {
    pos = ENT.ClientProps["E_informator"].pos-Vector(2,-2.9,-5),
    ang = Angle(0,-90,90),
    width = 121,
    height = 103,
    scale = 0.07,
    hide=true,
    hideseat=0.2,

    buttons = {
        {ID = "RRIUp",x=30,y=60,radius=10,tooltip=""},
        {ID = "RRIDown",x=30,y=80,radius=10,tooltip=""},
        {ID = "RRILeft",x=20,y=70,radius=10,tooltip=""},
        {ID = "RRIRight",x=40,y=70,radius=10,tooltip=""},
    }
}
ENT.ButtonMap["RRI"] = {
    pos = ENT.ClientProps["E_informator"].pos-Vector(-0.65,-0.5,-5),
    ang = Angle(0,-90,0),
    width = 60,
    height = 25,
    scale = 0.0625,
    hideseat=0.2,

    buttons = {
        {ID = "RRIEnableToggle",x=10,y=12.5,radius=10,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_t1.mdl",ang = 180,z=-4,
            var="RRIEnable",speed=16,
            sndvol = 1,snd = function(val) return val and "switchbl_on" or "switchbl_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "!RRIRewind",x=30,y=12.5,radius=0,model = {
            model = "models/metrostroi_train/81-502/buttons/tumbler_b_a.mdl",ang = 180,z=-3,
            getfunc = function(ent) return ent:GetPackedRatio("RRIRewind") end,
            var="RRIRewind",speed=8,
            sndvol = 0.5,snd = function(_,val) return val==2 and "triple_0-up" or val==0 and "triple_0-down" or "triple_up-0" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "RRIRewindSet2",x=30-5,y=12.5-10,w=10,h=10,tooltip=""},
        {ID = "RRIRewindSet0",x=30-5,y=12.5,w=10,h=10,tooltip=""},

        {ID = "RRIAmplifierToggle",x=50,y=12.5,radius=10,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_t1.mdl",ang = 180,z=-4,
            var="RRIAmplifier",speed=16,
            sndvol = 1,snd = function(val) return val and "switchbl_on" or "switchbl_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "!RRIOn",x=70,y=12.5,radius=10,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_slc77.mdl",z = -13,
            lamp = {model = "models/metrostroi_train/81-717/buttons/slc_77_lamp.mdl",ang=62,x=-0.3,y=-0.3,z=20.6, var="RRIOn", color=Color(210,170,255)},
        }},
    }
}

ENT.ButtonMap["RouteNumberScreen"] = {
    pos = Vector(460,-22.42,39.9),
    ang = Angle(0,90,90.0),
    width = 512,
    height = 128,
    scale = 0.07,

    nohide = true,
}
ENT.ButtonMap["LastStationScreen"] = {
    pos = Vector(460,5.2,37.9),
    ang = Angle(0,90,90.0),
    width = 512,
    height = 128,
    scale = 0.07,

    nohide = true,
}
ENT.ButtonMap["Block2"] = {
    pos = Vector(450.4+0.35,10.0,1.3+5.35),
    ang = Angle(0,-90,58),
    width = 300,
    height = 110,
    scale = 0.0625,
    hideseat=0.2,

    buttons = {
        {ID = "!Speedometer1",x=137,y=29,w=17,h=25,tooltip="",model = {
            name="SSpeed2",model = "models/metrostroi_train/81-717/segments/segment_spb.mdl",color=Color(175,250,20),skin=0,z=0.1,ang=Angle(0,0,-90),
        }},
        {ID = "!Speedometer2",x=158,y=29,w=17,h=25,tooltip="",model = {
            name="SSpeed1",model = "models/metrostroi_train/81-717/segments/segment_spb.mdl",color=Color(175,250,20),skin=0,z=0.1,ang=Angle(0,0,-90),
        }},

        {ID = "!ARSOch",x=100,y=33,w=10,h=10,tooltip="",model = {
            name="SAOCh",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_ra.mdl",z=-0.2,var="AR04"},
        }},
        {ID = "!ARS0",x=89,y=33+10.9*0,w=10,h=10,tooltip="",model = {
            name="SA0",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_ra.mdl",z=-0.2,var="AR0"},
        }},
        {ID = "!ARS40",x=89,y=33+10.9*1,w=10,h=10,tooltip="",model = {
            name="SA40",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_ya.mdl",z=-0.2,var="AR40"},
        }},
        {ID = "!ARS60",x=89,y=33+10.9*2,w=10,h=10,tooltip="",model = {
            name="SA60",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_ya.mdl",z=-0.2,color=Color(175,250,20),var="AR60"},
        }},
        {ID = "!ARS70",x=89,y=33+10.9*3,w=10,h=10,tooltip="",model = {
            name="SA70",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_ya.mdl",z=-0.2,color=Color(175,250,20),var="AR70"},
        }},
        {ID = "!ARS80",x=89,y=33+10.9*4,w=10,h=10,tooltip="",model = {
            name="SA80",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_ya.mdl",z=-0.2,color=Color(175,250,20),var="AR80"},
        }},

        {ID = "!LampLSD1",x=191.0,y=34.2,w=10,h=4,tooltip="",model = {
            name="SSD1",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.2,color=Color(175,250,20),var="SD"},
        }},
        {ID = "!LampLSD2",x=201.2,y=34.2,w=10,h=4,tooltip="",model = {
            name="SSD2",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.2,ang=90,color=Color(175,250,20),var="SD"},
        }},

        {ID = "!LampLVD",x=191.3,y=43.8+8.8*0,w=10,h=4,tooltip="",model = {
            name="SVD",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",var="A04",z=-0.2,color=Color(175,250,20),var="VD"},
        }},
        {ID = "!LampLHRK",x=191.3,y=43.8+8.8*1,w=10,h=4,tooltip="",model = {
            name="SRK",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.2,var="HRK"},
        }},
        {ID = "!LampLST",x=191.3,y=43.8+8.8*2,w=10,h=4,tooltip="",model = {
            name="SST",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.2,var="ST"},
        }},
        {ID = "!LampLRD",x=191.3,y=43.8+8.8*3,w=10,h=4,tooltip="",model = {
            name="SRD",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.2,color=Color(175,250,20),var="LRD"},
        }},


        {ID = "!LampRP",x=209.8,y=43.9+8.8*0,w=10,h=4,tooltip="",model = {
            name="SRP",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_rb.mdl",z=-0.2,var="RP"},
        }},
        {ID = "!LampLSN",x=219.8,y=43.9+8.8*0,w=10,h=4,tooltip="",model = {
            name="SSN",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_rb.mdl",z=-0.2,ang=-90,var="SN"},
        }},

        --{x=2031 + 2*0,y=223 + 192*0,w=10,h=10,tooltip="",radius=10},
        {ID = "!LampLKVD",x=219,y=43.8+8.8*1,w=10,h=4,tooltip="",model = {
            name="SKVD",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.2,var="KVD"},
        }},
        {ID = "!LampLKT",x=219,y=43.8+8.8*2,w=10,h=4,tooltip="",model = {
            name="SKT",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.2,var="KT"},
        }},
        {ID = "!LampDV",x=219,y=43.8+8.8*3,w=10,h=4,tooltip="",model = {
            name="SDV",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.2,color=Color(175,250,20),var="DV"},
        }},

        {ID = "!SpeedFact1",x=133.1,y=73.6,w=23.7,h=8,tooltip="",model = {
            name="SpeedFact1",model = "models/metrostroi_train/81-717/lamps/indicators.mdl",z=0.15,color=Color(175,250,20),skin=10,ang=90,
        }},
        {ID = "!SpeedFact2",x=133.1+23.7,y=73.6,w=23.7,h=8,tooltip="",model = {
            name="SpeedFact2",model = "models/metrostroi_train/81-717/lamps/indicators.mdl",z=0.15,color=Color(175,250,20),skin=10,ang=90,
        }},

        {ID = "!ARSL20",x=140,y=83,w=5,h=10,tooltip="",model = {
            name="SAL20",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/triangle_red.mdl",z=-0.3,var="AR20"},
        }},
        {ID = "!ARSL40",x=140+4.3*2,y=83,w=5,h=10,tooltip="",model = {
            name="SAL40",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/triangle_yellow.mdl",z=-0.3,var="AR40"},
        }},
        {ID = "!ARSL60",x=140+4.3*(3+1.1),y=83,w=5,h=10,tooltip="",model = {
            name="SAL60",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/triangle_yellow.mdl",color=Color(175,250,20),z=-0.3,var="AR60"},
        }},
        {ID = "!ARSL70",x=140+4.3*(4+1.2),y=83,w=5,h=10,tooltip="",model = {
            name="SAL70",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/triangle_yellow.mdl",color=Color(175,250,20),z=-0.3,var="AR70"},
        }},
        {ID = "!ARSL80",x=140+4.3*(5+1.3),y=83,w=5,h=10,tooltip="",model = {
            name="SAL80",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/triangle_yellow.mdl",color=Color(175,250,20),z=-0.3,var="AR80"},
        }},
        --[[
        {ID = "!LampLN",x=217-0.5*0 ,y=34.6 + 20.7*1,w=10,h=10,tooltip="",model = {
            name="SHLN",lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod2.mdl",color=Color(175,250,20),z=0,var="LN"},
        }},
        {ID = "!LampLRS",x=271.5-1*1,y=34.6 + 20.5*1,w=10,h=10,tooltip="",model = {
            name="SHRS",lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod2.mdl",color=Color(175,250,20),z=0,var="RS"},
        }},]]
    }
}
/*

ENT.ButtonMap["Block2_2"] = {
    pos = Vector(450.4,10.0,1.3+5.35),
    ang = Angle(0,-90,58),
    width = 315,
    height = 110,
    scale = 0.0625,

    hideseat=0.2,
    buttons = {
        {ID = "!Speedometer1",x=109,y=18.5,w=13,h=22,tooltip="",model = {
            name="SSpeed2",model = "models/metrostroi_train/81-717/segments/segment_mvm.mdl",color=Color(175,250,20),skin=0,z=-2,ang=Angle(0,0,-90),
        }},
        {ID = "!Speedometer2",x=121,y=18.5,w=13,h=22,tooltip="",model = {
            name="SSpeed1",model = "models/metrostroi_train/81-717/segments/segment_mvm.mdl",color=Color(175,250,20),skin=0,z=-2,ang=Angle(0,0,-90),
        }},

        {ID = "!ARSOch",x=45+26.67*0,y=51.1,w=18,h=10,tooltip="",model = {
            name="SAOCh",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamps_mvm_s04.mdl",z=-2,ang=Angle(0,0,90),var="AR04"},
        }},
        {ID = "!ARS0",x=45+26.67*1,y=51.1,w=18,h=10,tooltip="",model = {
            name="SA0",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamps_mvm_s0.mdl",z=-2,ang=Angle(0,0,90),var="AR0"},
        }},
        {ID = "!ARS40",x=45+26.67*2,y=51.1,w=18,h=10,tooltip="",model = {
            name="SA40",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamps_mvm_s40.mdl",z=-2,ang=Angle(0,0,90),var="AR40"},
        }},
        {ID = "!ARS60",x=45+26.67*3,y=51.1,w=18,h=10,tooltip="",model = {
            name="SA60",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamps_mvm_s60.mdl",z=-2,ang=Angle(0,0,90),var="AR60"},
        }},
        {ID = "!ARS70",x=45+26.67*4,y=51.1,w=18,h=10,tooltip="",model = {
            name="SA70",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamps_mvm_s70.mdl",z=-2,ang=Angle(0,0,90),var="AR70"},
        }},
        {ID = "!ARS80",x=45+26.67*5,y=51.1,w=18,h=10,tooltip="",model = {
            name="SA80",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamps_mvm_s80.mdl",z=-2,ang=Angle(0,0,90),var="AR80"},
        }},

        {ID = "!LampLSD1",x=45+26.67*0,y=57.9-20.0*(-1),w=18,h=10,tooltip="",model = {
            name="SSD1",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamps_mvm_lsd.mdl",z=-2,ang=Angle(0,0,90),var="SD"},
        }},
        {ID = "!LampLSD2",x=45+26.67*1,y=57.9-20.0*(-1),w=18,h=10,tooltip="",model = {
            name="SSD2",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamps_mvm_lsd.mdl",z=-2,ang=Angle(0,0,90),var="SD"},
        }},

        {ID = "!LampLVD",x=45+26.67*7.97,y=57.2-20.0*1,w=18,h=10,tooltip="",model = {
            name="SVD",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamps_mvm_lvd.mdl",ang=Angle(0,0,90),z=-2,var="VD"},
        }},
        {ID = "!LampLHRK",x=45+26.67*2.51,y=57.9-20.0*(-1),w=18,h=10,tooltip="",model = {
            name="SHRK",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamps_mvm_rk.mdl",z=-2,ang=Angle(0,0,90),var="HRK"},
        }},
        {ID = "!LampLST",x=45+26.67*7.96,y=57.9-20.0*(-1),w=18,h=10,tooltip="",model = {
            name="SST",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamps_mvm_lst.mdl",ang=Angle(0,0,90),z=-2,var="ST"},
        }},
        --[[{ID = "!LampLRD",x=192.4,y=42.9+9.3*3,w=10,h=4,tooltip="",model = {
            name="SRD",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamps_mvm_lst.mdl",z=-0.2,var="RD",var="AR04"},
        }},]]


        {ID = "!LampRP",x=45+26.67*4,y=57.9-20.0*(-1),w=18,h=10,tooltip="",model = {
            name="SRP",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamps_mvm_rp.mdl",z=-1,ang=Angle(0,0,90) ,var="RP"},
        }},
        {ID = "!LampLSN",x=45+26.67*5,y=57.9-20.0*(-1),w=18,h=10,tooltip="",model = {
            name="SSN",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamps_mvm_lsn.mdl",z=-1 ,ang=Angle(0,0,90),var="SN"},
        }},

        --{x=2031 + 2*0,y=223 + 192*0,w=10,h=10,tooltip="",radius=10},
        {ID = "!LampLKVD",x=45+26.67*6.33,y=57.2,w=18,h=10,tooltip="",model = {
            name="SKVD",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamps_mvm_lkvd.mdl",ang=Angle(0,0,90),z=-1,var="KVD",},
        }},
        {ID = "!LampLKVC",x=45+26.67*7.97,y=57.15-20.0*2,w=18,h=10,tooltip="",model = {
            name="SKVC",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamps_mvm_lkvc.mdl",ang=Angle(0,0,90),z=-1 ,var="KVC"},
        }},
        {ID = "!LampLKT",x=45+26.67*6.33,y=57.9-20.0*(-1),w=18,h=10,tooltip="",model = {
            name="SKT",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamps_mvm_lkt.mdl",z=-1,ang=Angle(0,0,90),var="KT"},
        }},
        --[[{ID = "!LampDV",x=222.0,y=42.9+9.3*3,w=10,h=4,tooltip="",model = {
            name="SDV",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_gb.mdl",z=-0.2,var="DV",var="AR04"},
        }},]]

        {ID = "!LampLEKK",x=45+26.67*6.33,y=57.15-20.0*2,w=18,h=10,tooltip="",model = {
            name="SLEKK",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamps_mvm_gl.mdl",ang=Angle(0,0,90),z=-1 ,var="GLIB"},
        }},
        {ID = "!LampLN",x=45+26.67*6.33,y=57.3-20.0*1,w=18,h=10,tooltip="",model = {
            name="SLN",lamp = {speed=16,model = "models/metrostroi_train/81-717/lamps/lamps_mvm_ln.mdl",z=-1,ang=Angle(0,0,90),var="LN"},
        }},
        {ID = "!LampLRS",x=45+26.67*7.97,y=57.2,w=18,h=10,tooltip="",model = {
            name="SRS",lamp = {speed=16,model = "models/metrostroi_train/81-717/lamps/lamps_mvm_rc.mdl",z=-1,ang=Angle(0,0,90),var="RS"},
        }},
    }
}
ENT.ButtonMap["Block2_3"] = {
    pos = Vector(450.4,10.0,1.3+5.35),
    ang = Angle(0,-90,58),
    width = 315,
    height = 110,
    scale = 0.0625,

    hideseat=0.2,
    buttons = {
        --{ID = "!Speedometer",x=1110,y=200,w = 800,h = 440,tooltip=""},
        {ID = "!LSD",x=42.5,y=16+17.9*0,w = 35,h = 15,tooltip="",model = {
            lamp = {model = "models/metrostroi_train/81-717/lamps/oldars_lsd.mdl",z=6,ang=90,var="SD",speed=6}
        }},
        {ID = "!LOch",x=42.5,y=16+17.9*1,w = 35,h = 15,tooltip="",model = {
            lamps = {
                {model = "models/metrostroi_train/81-717/lamps/oldars_l0.mdl",z=6,ang=90,speed=6,getfunc=function(ent) return (ent:GetPackedBool("AR0") and not ent:GetPackedBool("AR04")) and 1 or 0 end,var="AR04"},
                {model = "models/metrostroi_train/81-717/lamps/oldars_l04.mdl",z=6,ang=90,speed=6,getfunc=function(ent) return (ent:GetPackedBool("AR04") and not ent:GetPackedBool("AR0")) and 1 or 0 end,var="AR0"},
                {model = "models/metrostroi_train/81-717/lamps/oldars_l0_l04.mdl",z=6,ang=90,speed=6,getfunc=function(ent) return (ent:GetPackedBool("AR0") and ent:GetPackedBool("AR04")) and 1 or 0 end,var="AR04"},
            }
        }},
        {ID = "!LN",x=42.5,y=16+17.9*2,w = 35,h = 15,tooltip="",model = {
            lamps = {
                {model = "models/metrostroi_train/81-717/lamps/oldars_ln.mdl",z=6,ang=90,speed=6,getfunc=function(ent) return (ent:GetPackedBool("LN") and not ent:GetPackedBool("AR40")) and 1 or 0 end,var="AR40"},
                {model = "models/metrostroi_train/81-717/lamps/oldars_l40.mdl",z=6,ang=90,speed=6,getfunc=function(ent) return (ent:GetPackedBool("AR40") and not ent:GetPackedBool("LN")) and 1 or 0 end,var="LN"},
                {model = "models/metrostroi_train/81-717/lamps/oldars_ln_l40.mdl",z=6,ang=90,speed=6,getfunc=function(ent) return (ent:GetPackedBool("LN") and ent:GetPackedBool("AR40")) and 1 or 0 end,var="AR40"},
            }
        }},
        {ID = "!60",x=42.5,y=16+17.9*3,w = 35,h = 15,tooltip="",model = {
            lamps = {
                {model = "models/metrostroi_train/81-717/lamps/oldars_l60.mdl",z=6,ang=90,speed=6,getfunc=function(ent) return (ent:GetPackedBool("AR60") and not ent:GetPackedBool("AR80")) and 1 or 0 end,var="AR80"},
                {model = "models/metrostroi_train/81-717/lamps/oldars_l80.mdl",z=6,ang=90,speed=6,getfunc=function(ent) return (ent:GetPackedBool("AR80") and not ent:GetPackedBool("AR60")) and 1 or 0 end,var="AR60"},
                {model = "models/metrostroi_train/81-717/lamps/oldars_l60_l80.mdl",z=6,ang=90,speed=6,getfunc=function(ent) return (ent:GetPackedBool("AR60") and ent:GetPackedBool("AR80")) and 1 or 0 end,var="AR80"},
            }
        }},
        {ID = "!70",x=42.5,y=16+17.9*4,w = 35,h = 15,tooltip="",model = {
            lamps = {
                {model = "models/metrostroi_train/81-717/lamps/oldars_l70.mdl",z=6,ang=90,speed=6,getfunc=function(ent) return (ent:GetPackedBool("AR70") and not ent:GetPackedBool("HRK")) and 1 or 0 end,var="HRK"},
                {model = "models/metrostroi_train/81-717/lamps/oldars_lrk.mdl",z=6,ang=90,speed=6,getfunc=function(ent) return (ent:GetPackedBool("HRK") and not ent:GetPackedBool("AR70")) and 1 or 0 end,var="AR70"},
                {model = "models/metrostroi_train/81-717/lamps/oldars_l70_lrk.mdl",z=6,ang=90,speed=6,getfunc=function(ent) return (ent:GetPackedBool("AR70") and ent:GetPackedBool("HRK")) and 1 or 0 end,var="HRK"},
            }
        }},

        {ID = "!LEKK",x=258 + 29*0,y=20 + 24*0,radius = 12,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_slc77.mdl",skin = 3,z = -3,
            lamp = {model = "models/metrostroi_train/81-717/buttons/slc_77_lamp.mdl",ang=75,x=-0.3,y=-0.3,z=20.6,color=Color(210,170,255),var="LEKK"},
        }},
        {ID = "!LPU",x=258 + 29*0,y=20 + 24*1,radius = 12,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_slc77.mdl",skin = 2,z = -3,
            lamp = {model = "models/metrostroi_train/81-717/buttons/slc_77_lamp.mdl",ang=14,x=-0.3,y=-0.3,z=20.6,color=Color(255,130,90),var="LPU"},
        }},
        {ID = "!LKVD",x=258 + 29*0,y=20 + 24*2,radius = 12,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_slc77.mdl",skin = 1,z = -3,
            lamp = {model = "models/metrostroi_train/81-717/buttons/slc_77_lamp.mdl",ang=62,x=-0.3,y=-0.3,z=20.6,color=Color(255,60,40),var="KVD"},
        }},
        {ID = "!LKT",x=258 + 29*0,y=20 + 24*3,radius = 12,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_slc77.mdl",skin = 2,z = -3,
            lamp = {model = "models/metrostroi_train/81-717/buttons/slc_77_lamp.mdl",ang=105,x=-0.3,y=-0.3,z=20.6,color=Color(100,255,100),var="KT"},
        }},

        {ID = "!LRP",x=258 + 29*1,y=20 + 24*0,radius = 12,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_slc77.mdl",skin = 1,z = -3,
            lamp = {model = "models/metrostroi_train/81-717/buttons/slc_77_lamp.mdl",ang=43,x=-0.3,y=-0.3,z=20.6,color=Color(255,60,40),var="RPR",getfunc = function(ent) return ent:GetPackedRatio("RPR") end},
        }},
        {ID = "!LKVC",x=258 + 29*1,y=20 + 24*1,radius = 12,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_slc77.mdl",skin = 1,z = -3,
            lamp = {model = "models/metrostroi_train/81-717/buttons/slc_77_lamp.mdl",ang=4,x=-0.3,y=-0.3,z=20.6,color=Color(255,60,40),var="KVC"},
        }},
        {ID = "!LVD",x=258 + 29*1,y=20 + 24*2,radius = 12,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_slc77.mdl",skin = 0,z = -3,
            lamp = {model = "models/metrostroi_train/81-717/buttons/slc_77_lamp.mdl",ang=87,x=-0.3,y=-0.3,z=20.6,color=Color(100,255,100),var="VD"},
        }},
        {ID = "!LST",x=258 + 29*1,y=20 + 24*3,radius = 12,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_slc77.mdl",skin = 4,z = -3,
            lamp = {model = "models/metrostroi_train/81-717/buttons/slc_77_lamp.mdl",ang=32,x=-0.3,y=-0.3,z=20.6,color=Color(255,170,110),var="ST"},
        }},
    }
}
ENT.ClientProps["speed"] = {
    model = "models/metrostroi_train/81-710/ezh3_voltages.mdl",
    pos = Vector(448.287628,-0.010203,1.644087),
    ang = Angle(0.000000,-90.000000,58.000000),
    bscale = Vector(1.2,1.2,1.65),
    hideseat=0.2,
}


ENT.ButtonMap["Block2_1"] = {
    pos = Vector(450.4,10.0,1.3+5.35),
    ang = Angle(0,-90,58),
    width = 300,
    height = 110,
    scale = 0.0625,
    hideseat=0.2,

    buttons = {
        {ID = "!Speedometer1",x=59.5,y=35.5,w=12,h=20,tooltip="",model = {
            name="RSpeed2",model = "models/metrostroi_train/81-717/segments/segment_mvm.mdl",color=Color(175,250,20),skin=0,z=-2.2,ang=Angle(0,0,-90),
        }},
        {ID = "!Speedometer2",x=70.5,y=35.5,w=12,h=20,tooltip="",model = {
            name="RSpeed1",model = "models/metrostroi_train/81-717/segments/segment_mvm.mdl",color=Color(175,250,20),skin=0,z=-2.2,ang=Angle(0,0,-90),
        }},

        {ID = "!ARSOch",x=101.7+17.85*0,y=52,tooltip="",radius=3,model = {
            name="RAOCh",lamp = {speed=24,model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",color=Color(255,56,30),z=-3.5,var="AR04"},
        }},
        {ID = "!ARS0",x=101.85+17.85*1,y=52,tooltip="",radius=3,model = {
            name="RA0",lamp = {speed=24,model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",color=Color(255,56,30),z=-3.5,var="AR0"},
        }},
        {ID = "!ARS40",x=101.75+17.85*2,y=52,tooltip="",radius=3,model = {
            name="RA40",lamp = {speed=24,model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",color=Color(255,168,000),z=-3.5,var="AR40"},
        }},
        {ID = "!ARS60",x=101.4+17.85*3,y=52,tooltip="",radius=3,model = {
            name="RA60",lamp = {speed=24,model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",color=Color(175,250,20),z=-3.5,var="AR60"},
        }},
        {ID = "!ARS70",x=101.5+17.85*4,y=52,tooltip="",radius=3,model = {
            name="RA70",lamp = {speed=24,model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",color=Color(175,250,20),z=-3.5,var="AR70"},
        }},
        {ID = "!ARS80",x=101.3+17.7*5,y=52,tooltip="",radius=3,model = {
            name="RA80",lamp = {speed=24,model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",color=Color(175,250,20),z=-3.5,var="AR80"},
        }},

        {ID = "!LampLSD1",x=65.4,y=91,tooltip="",radius=3,model = {
            name="RSD1",lamp = {speed=24,model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",color=Color(175,250,20),z=-3.5,var="SD"},
        }},
        {ID = "!LampLSD2",x=82.8,y=91,tooltip="",radius=3,model = {
            name="RSD2",lamp = {speed=24,model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",color=Color(175,250,20),z=-3.5,var="SD"},
        }},

        {ID = "!LampLHRK",x=102.3,y=91,tooltip="",radius=3,model = {
            name="RRK",lamp = {speed=24,model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",color=Color(255,168,000),z=-3.5,var="HRK"},
        }},

        {ID = "!LampRP",x=137.4,y=91,tooltip="",radius=3,model = {
            name="RRP",lamp = {speed=24,model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",color=Color(255,56,30),z=-3.5,var="RP"},
        }},
        {ID = "!LampLSN",x=189.3,y=91,tooltip="",radius=3,model = {
            name="RSN",lamp = {speed=24,model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",color=Color(255,56,30),z=-3.5,var="SN"},
        }},

        --{x=2031 + 2*0,y=223 + 192*0,tooltip="",radius=10},
        {ID = "!LampLN",x=215.5-0.4*1 ,y=31.8 + 19.7*1,tooltip="",radius=3,model = {
            name="RLN",lamp = {speed=24,model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",color=Color(175,250,20),z=-3.5,var="LN"},
        }},
        {ID = "!LampLKVD",x=214.8,y=31.8 + 19.7*2,tooltip="",radius=3,model = {
            name="RKVD",lamp = {speed=24,model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",color=Color(255,56,30),z=-3.5,var="KVD"},
        }},
        {ID = "!LampLKT",x=215.5-0.4*2,y=31.8 + 19.7*3,tooltip="",radius=3,model = {
            name="RKT",lamp = {speed=24,model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",color=Color(175,250,20),z=-3.5,var="KT"},
        }},
        {ID = "!LampLKVC",x=267.2-1*0,y=31.8 + 19.7*0,tooltip="",radius=3,model = {
            name="RKVC",lamp = {speed=24,model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",color=Color(255,56,30),z=-3.5,var="KVC"},
        }},
        {ID = "!LampLRS",x=266.30,y=31.8 + 19.7*1,tooltip="",radius=3,model = {
            name="RRS",lamp = {speed=24,model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",color=Color(175,250,20),z=-3.5,var="RS"},
        }},
        {ID = "!LampLVD",x=265.2,y=31.8 + 19.7*2,tooltip="",radius=3,model = {
            name="RVD",lamp = {speed=24,model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",color=Color(175,250,20),z=-3.5,var="VD"},
        }},
        {ID = "!LampLST",x=267.2-0.85*3,y=31.8 + 19.7*3,tooltip="",radius=3,model = {
            name="RST",lamp = {speed=24,model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",color=Color(175,250,20),z=-3.5,var="ST"},
        }},
    }
}
*/
ENT.ButtonMap["BZOS_C"] = {
    pos = Vector(440.5,-62.15,-0.68),
    ang = Angle(0,180,90),
    width = 16,
    height = 60,
    scale = 0.0625,
    hideseat=0.2,

    buttons = {
        {ID = "SAB1Toggle",x=8.2, y=8, radius=8, tooltip="", model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_t2.mdl",ang = 180,z=-4,
            var="SAB1",speed=16,
            sndvol = 0.5,snd = function(val) return val and "pnm_on" or "pnm_off" end,
            sndmin = 50,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "!VH1",x=8.2, y=27, radius=4, tooltip="", model = {
            lamp = {speed=16,model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",z=-5,var="VH1",color=Color(175,250,20)}},
        },
        {ID = "!VH2",x=8.2, y=44, radius=4, tooltip="", model = {
            lamp = {speed=16,model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",z=-5,var="VH2",color=Color(255,56,30)}},
        },
    }
}
ENT.ButtonMap["BZOS_R"] = table.Copy(ENT.ButtonMap["BZOS_C"])
ENT.ButtonMap["BZOS_R"].pos = ENT.ButtonMap["BZOS_R"].pos - Vector(0.3,0,-0.1)
for k,v in pairs(ENT.ButtonMap["BZOS_R"].buttons) do v.ID = "1:"..v.ID end
--[=[
ENT.ButtonMap["KiyvARS"] = {
    pos = Vector(456.97,10.0,12.5),
    ang = Angle(0,-90,58),
    width = 300,
    height = 110,
    scale = 0.0625,

    buttons = {
        {ID = "!Speedometer1",x=135,y=28,w=17,h=25,tooltip="",model = {
            name="KSpeed2",model = "models/metrostroi_train/81-717/segments/segment_spb.mdl",color=Color(175,250,20),skin=0,z=0.1,ang=Angle(0,0,-90),
        }},
        {ID = "!Speedometer2",x=157,y=28,w=17,h=25,tooltip="",model = {
            name="KSpeed1",model = "models/metrostroi_train/81-717/segments/segment_spb.mdl",color=Color(175,250,20),skin=0,z=0.1,ang=Angle(0,0,-90),
        }},

        {ID = "!ARSOch",x=95.8,y=31.6,w=10,h=10,tooltip="",model = {
            name="KAOCh",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_ra.mdl",z=-0.2,var="AR04"},
        }},
        {ID = "!ARS0",x=84.3,y=31.6+11.4*0,w=10,h=10,tooltip="",model = {
            name="KA0",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_ra.mdl",z=-0.2,var="AR0"},
        }},
        {ID = "!ARS40",x=84.3,y=31.6+11.4*1,w=10,h=10,tooltip="",model = {
            name="KA40",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_ya.mdl",z=-0.2,var="AR40"},
        }},
        {ID = "!ARS60",x=84.3,y=31.6+11.4*2,w=10,h=10,tooltip="",model = {
            name="KA60",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_ya.mdl",z=-0.2,var="AR60",color=Color(200,255,200)},
        }},
        {ID = "!ARS70",x=84.3,y=31.6+11.4*3,w=10,h=10,tooltip="",model = {
            name="KA70",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_ya.mdl",z=-0.2,var="AR70",color=Color(200,255,200)},
        }},
        {ID = "!ARS80",x=84.3,y=31.6+11.4*4,w=10,h=10,tooltip="",model = {
            name="KA80",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_ya.mdl",z=-0.2,var="AR80",color=Color(200,255,200)},
        }},

        {ID = "!LampLSD1",x=192.5,y=32.7,w=10,h=4,tooltip="",model = {
            name="KSD1",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.2,var="SD",color=Color(200,255,200)},
        }},
        {ID = "!LampLSD2",x=202.6,y=32.7,w=10,h=4,tooltip="",model = {
            name="KSD2",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.2,ang=90,var="SD",color=Color(200,255,200)},
        }},

        {ID = "!LampLVD",x=192.5,y=42.8+9.3*0,w=10,h=4,tooltip="",model = {
            name="KVD",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",var="A04",z=-0.2,var="VD",color=Color(200,255,200)},
        }},
        {ID = "!LampLHRK",x=192.5,y=42.8+9.3*1,w=10,h=4,tooltip="",model = {
            name="KRK",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.2,var="HRK"},
        }},
        {ID = "!LampLST",x=192.5,y=42.9+9.3*2,w=10,h=4,tooltip="",model = {
            name="KST",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.2,var="ST"},
        }},
        {ID = "!LampLRD",x=192.4,y=42.9+9.3*3,w=10,h=4,tooltip="",model = {
            name="KRD",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.2,var="RD",color=Color(200,255,200)},
        }},


        {ID = "!LampRP",x=212,y=42.9+9.3*0,w=10,h=4,tooltip="",model = {
            name="KRP",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_rb.mdl",z=-0.2,var="RP"},
        }},
        {ID = "!LampLSN",x=222.1,y=42.9+9.3*0,w=10,h=4,tooltip="",model = {
            name="KSN",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_rb.mdl",z=-0.2,ang=-90,var="SN"},
        }},

        --{x=2031 + 2*0,y=223 + 192*0,w=10,h=10,tooltip="",radius=10},
        {ID = "!LampLKVD",x=222.0,y=42.9+9.2*1,w=10,h=4,tooltip="",model = {
            name="KKVD",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.2,var="KVD"},
        }},
        {ID = "!LampLKT",x=222.0,y=42.9+9.3*2,w=10,h=4,tooltip="",model = {
            name="KKT",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.2,var="KT"},
        }},
        {ID = "!LampDV",x=222.0,y=42.9+9.3*3,w=10,h=4,tooltip="",model = {
            name="KDV",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.2,var="DV",color=Color(200,255,200)},
        }},
        --[[
        {ID = "!LampLN",x=217-0.5*0 ,y=34.6 + 20.7*1,w=10,h=10,tooltip="",model = {
            name="KHLN",lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod2.mdl",color=Color(175,250,20),z=0,var="LN"},
        }},
        {ID = "!LampLRS",x=271.5-1*1,y=34.6 + 20.5*1,w=10,h=10,tooltip="",model = {
            name="KHRS",lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod2.mdl",color=Color(175,250,20),z=0,var="RS"},
        }},]]
    }
}]=]

-- AV panel
ENT.ButtonMap["AV_C"] = {
    pos = Vector(396,-17.5,44.6),
    ang = Angle(0,90,90),
    width = 680,
    height = 590,
    scale = 0.0625,
    hide=0.8,

    buttons = {
        {ID = "A53Toggle",x=30+36.7*0,y=60+157*0,radius=25,tooltip=""},
        {ID = "A56Toggle",x=30+36.7*1,y=60+157*0,radius=25,tooltip=""},
        {ID = "A54Toggle",x=30+36.7*2,y=60+157*0,radius=25,tooltip=""},
        {ID = "A17Toggle",x=30+36.7*3,y=60+157*0,radius=25,tooltip=""},
        {ID = "A44Toggle",x=30+36.7*4,y=60+157*0,radius=25,tooltip=""},
        {ID = "A39Toggle",x=30+36.7*5,y=60+157*0,radius=25,tooltip=""},
        {ID = "A70Toggle",x=30+36.7*6,y=60+157*0,radius=25,tooltip=""},
        {ID = "A14Toggle",x=30+36.7*7,y=60+157*0,radius=25,tooltip=""},
        {ID = "A74Toggle",x=30+36.7*8,y=60+157*0,radius=25,tooltip=""},
        {ID = "A26Toggle",x=30+36.7*9,y=60+157*0,radius=25,tooltip=""},
        {ID = "AR63Toggle",x=30+36.7*10,y=60+157*0,radius=25,tooltip=""},
        {ID = "AS1Toggle",x=30+36.7*11,y=60+157*0,radius=25,tooltip=""},
        {ID = "A13Toggle",x=30+36.7*12,y=60+157*0,radius=25,tooltip=""},
        {ID = "A21Toggle",x=30+36.7*13,y=60+157*0,radius=25,tooltip=""},
        {ID = "A31Toggle",x=30+36.7*14,y=60+157*0,radius=25,tooltip=""},
        {ID = "A32Toggle",x=30+36.7*15,y=60+157*0,radius=25,tooltip=""},
        {ID = "A16Toggle",x=30+36.7*16,y=60+157*0,radius=25,tooltip=""},
        {ID = "A12Toggle",x=30+36.7*17,y=60+157*0,radius=25,tooltip=""},
        ------------------------------------------------------------------------
        {ID = "A24Toggle",x=30+36.7*0,y=60+157*1,radius=25,tooltip=""},
        {ID = "A49Toggle",x=30+36.7*1,y=60+157*1,radius=25,tooltip=""},
        {ID = "A27Toggle",x=30+36.7*2,y=60+157*1,radius=25,tooltip=""},
        {ID = "A72Toggle",x=30+36.7*3,y=60+157*1,radius=25,tooltip=""},
        {ID = "A50Toggle",x=30+36.7*4,y=60+157*1,radius=25,tooltip=""},
        {ID = "A15Toggle",x=30+36.7*5,y=60+157*1,radius=25,tooltip="",lab=8},
        {ID = "AV3Toggle",x=30+36.7*6,y=60+157*1,radius=25,tooltip=""},
        {ID = "AV2Toggle",x=30+36.7*7,y=60+157*1,radius=25,tooltip="",lab=9},
        {ID = "AV4Toggle",x=30+36.7*8,y=60+157*1,radius=25,tooltip="",lab=10},
        {ID = "AV5Toggle",x=30+36.7*9,y=60+157*1,radius=25,tooltip="",lab=11},
        {ID = "AV6Toggle",x=30+36.7*10,y=60+157*1,radius=25,tooltip="",lab=12},
        {ID = "AV1Toggle",x=30+36.7*11,y=60+157*1,radius=25,tooltip="",lab=13},
        {ID = "A29Toggle",x=30+36.7*12,y=60+157*1,radius=25,tooltip=""},
        {ID = "A46Toggle",x=30+36.7*13,y=60+157*1,radius=25,tooltip=""},
        {ID = "A47Toggle",x=30+36.7*14,y=60+157*1,radius=25,tooltip="",lab=17},
        {ID = "A71Toggle",x=30+36.7*15,y=60+157*1,radius=25,tooltip=""},
        {ID = "A7Toggle",x=30+36.7*16,y=60+157*1,radius=25,tooltip=""},
        {ID = "A9Toggle",x=30+36.7*17,y=60+157*1,radius=25,tooltip=""},
        ------------------------------------------------------------------------
        {ID = "A84Toggle",x=30+36.7*0,y=60+157*2,radius=25,tooltip=""},
        {ID = "A8Toggle",x=30+36.7*1,y=60+157*2,radius=25,tooltip=""},
        {ID = "A52Toggle",x=30+36.7*2,y=60+157*2,radius=25,tooltip=""},
        {ID = "A19Toggle",x=30+36.7*3,y=60+157*2,radius=25,tooltip=""},
        {ID = "A48Toggle",x=30+36.7*4,y=60+157*2,radius=25,tooltip=""},
        {ID = "A10Toggle",x=30+36.7*5,y=60+157*2,radius=25,tooltip=""},
        {ID = "A22Toggle",x=30+36.7*6,y=60+157*2,radius=25,tooltip=""},
        {ID = "A30Toggle",x=30+36.7*7,y=60+157*2,radius=25,tooltip=""},
        {ID = "A1Toggle",x=30+36.7*8,y=60+157*2,radius=25,tooltip=""},
        {ID = "A2Toggle",x=30+36.7*9,y=60+157*2,radius=25,tooltip=""},
        {ID = "A3Toggle",x=30+36.7*10,y=60+157*2,radius=25,tooltip=""},
        {ID = "A4Toggle",x=30+36.7*11,y=60+157*2,radius=25,tooltip=""},
        {ID = "A5Toggle",x=30+36.7*12,y=60+157*2,radius=25,tooltip=""},
        {ID = "A6Toggle",x=30+36.7*13,y=60+157*2,radius=25,tooltip=""},
        {ID = "A18Toggle",x=30+36.7*14,y=60+157*2,radius=25,tooltip=""},
        {ID = "A73Toggle",x=30+36.7*15,y=60+157*2,radius=25,tooltip=""},
        {ID = "A20Toggle",x=30+36.7*16,y=60+157*2,radius=25,tooltip=""},
        {ID = "A25Toggle",x=30+36.7*17,y=60+157*2,radius=25,tooltip=""},
        ------------------------------------------------------------------------
        {ID = "A11Toggle",x=30+36.7*0,y=60+157*3,radius=25,tooltip=""},
        {ID = "A37Toggle",x=30+36.7*1,y=60+157*3,radius=25,tooltip=""},
        {ID = "A45Toggle",x=30+36.7*2,y=60+157*3,radius=25,tooltip=""},
        {ID = "A38Toggle",x=30+36.7*3,y=60+157*3,radius=25,tooltip=""},
        {ID = "A51Toggle",x=30+36.7*4,y=60+157*3,radius=25,tooltip=""},
        {ID = "A65Toggle",x=30+36.7*5,y=60+157*3,radius=25,tooltip=""},
        {ID = "A66Toggle",x=30+36.7*6,y=60+157*3,radius=25,tooltip="",lab=16},
        {ID = "A42Toggle",x=30+36.7*7,y=60+157*3,radius=25,tooltip=""},
        {ID = "A43Toggle",x=30+36.7*8,y=60+157*3,radius=25,tooltip=""},
        {ID = "A41Toggle",x=30+36.7*9,y=60+157*3,radius=25,tooltip=""},
        {ID = "A40Toggle",x=30+36.7*10,y=60+157*3,radius=25,tooltip=""},
        {ID = "A75Toggle",x=30+36.7*11,y=60+157*3,radius=25,tooltip=""},
        {ID = "A76Toggle",x=30+36.7*12,y=60+157*3,radius=25,tooltip=""},
        {ID = "A60Toggle",x=30+36.7*13,y=60+157*3,radius=25,tooltip=""},
        {ID = "A58Toggle",x=30+36.7*14,y=60+157*3,radius=25,tooltip="",lab=14},
        {ID = "A57Toggle",x=30+36.7*15,y=60+157*3,radius=25,tooltip=""},
        {ID = "A59Toggle",x=30+36.7*16,y=60+157*3,radius=25,tooltip="",lab=15},
        {ID = "A28Toggle",x=30+36.7*17,y=60+157*3,radius=25,tooltip=""},
    }
}
for i,button in pairs(ENT.ButtonMap.AV_C.buttons) do
    button.model = {
        model = "models/metrostroi_train/81-720/button_av1.mdl",z=-25,
        var=button.ID:Replace("Toggle",""),speed=8,
        sndvol = 0.8,snd = function(val) return val and "av_on" or "av_off" end,sndmin = 80,sndmax = 1e3/3,sndang = Angle(-90,0,0),
    }
    button.ID = "1:"..button.ID
    if button.lab then
        button.model.labels={{model="models/metrostroi_train/81-717/labels/label_717.mdl",skin=button.lab,ang=Angle(-90,90,0),z=40,x=2,y=(14<=button.lab and button.lab<=16) and -62 or -65}}
    end
end
ENT.ButtonMap["Battery_C"] = {
    pos = Vector(410.0,-57,21),
    ang = Angle(0,90,90),
    width = 255,
    height = 280,
    scale = 0.0625,
    hide=0.8,

    buttons = {
        --{ID = "1:RC1Pl",x=45,y=108,radius=20,tooltip=""},
        {ID = "1:UOSToggle",x=40,y=40,radius=40,tooltip="",model = {
            model = "models/metrostroi_train/81-717/buttons/breaker_rcuos.mdl",z=17,ang=180,
            var="UOS",speed=0.5,vmin=1,vmax=0.87,
            plomb = {model = "models/metrostroi_train/81/plomb_b.mdl",ang=0,x=25,y=28,var="UOSPl",ID="UOSPl",z=-15,},
            sndvol = 0.8,snd = function(val) return val and "pak_on" or "pak_off" end,sndmin = 80,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "1:VBToggle",x=215,y=40,radius=40,tooltip="",model = {
            model = "models/metrostroi_train/81-717/buttons/breaker_vb.mdl",z=17,ang=180,
            var="VB",speed=0.5,vmin=1,vmax=0.87,
            sndvol = 0.8,snd = function(val) return val and "pak_on" or "pak_off" end,sndmin = 80,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "1:RC1Toggle",x=40,y=240,radius=40,tooltip="",model = {
            model = "models/metrostroi_train/81-717/buttons/breaker_rc1.mdl",z=17,ang=180,
            var="RC1",speed=0.5,vmin=1,vmax=0.87,
            plomb = {model = "models/metrostroi_train/81/plomb_b.mdl",ang=230,x=-28,y=28,var="RC1Pl",ID="RC1Pl",z=-15,},
            sndvol = 0.8,snd = function(val) return val and "pak_on" or "pak_off" end,sndmin = 80,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
    }
}

ENT.ButtonMap["AV_R"] = {
    pos = Vector(398.5+11,-52.9+0.6,37.1),
    ang = Angle(0,90,90),
    width = 398,
    height = 358,
    scale = 0.0625,
    hide=0.8,

    buttons = {
        {ID = "A11Toggle",x=29.7*0,y=155*0,w=25,h=45,tooltip=""},
        {ID = "A17Toggle",x=29.7*1,y=155*0,w=25,h=45,tooltip=""},
        {ID = "A44Toggle",x=29.7*2,y=155*0,w=25,h=45,tooltip=""},
        {ID = "A26Toggle",x=29.7*3,y=155*0,w=25,h=45,tooltip=""},
        {ID = "AR63Toggle",x=29.7*4,y=155*0,w=25,h=45,tooltip=""},
        {ID = "AS1Toggle",x=29.7*5,y=155*0,w=25,h=45,tooltip=""},
        {ID = "A21Toggle",x=29.7*6,y=155*0,w=25,h=45,tooltip=""},
        {ID = "A49Toggle",x=29.7*7,y=155*0,w=25,h=45,tooltip=""},
        {ID = "A27Toggle",x=29.7*8,y=155*0,w=25,h=45,tooltip=""},
        {ID = "A10Toggle",x=29.7*9,y=155*0,w=25,h=45,tooltip=""},
        {ID = "A53Toggle",x=29.7*10,y=155*0,w=25,h=45,tooltip=""},
        {ID = "A54Toggle",x=29.7*11,y=155*0,w=25,h=45,tooltip=""},
        {ID = "A84Toggle",x=29.7*12,y=155*0,w=25,h=45,tooltip=""},
        ------------------------------------------------------------------------
        {ID = "A76Toggle",x=29.7*0,y=155*1,w=25,h=45,tooltip=""},
        {ID = "A48Toggle",x=29.7*1,y=155*1,w=25,h=45,tooltip=""},
        {ID = "AV1Toggle",x=29.7*2,y=155*1,w=25,h=45,tooltip=""},
        {ID = "A29Toggle",x=29.7*3,y=155*1,w=25,h=45,tooltip=""},
        {ID = "A46Toggle",x=29.7*4,y=155*1,w=25,h=45,tooltip=""},
        {ID = "A47Toggle",x=29.7*5,y=155*1,w=25,h=45,tooltip=""},
        {ID = "A43Toggle",x=29.7*6,y=155*1,w=25,h=45,tooltip=""},
        {ID = "A42Toggle",x=29.7*7,y=155*1,w=25,h=45,tooltip=""},
        {ID = "A74Toggle",x=29.7*8,y=155*1,w=25,h=45,tooltip=""},
        {ID = "A73Toggle",x=29.7*9,y=155*1,w=25,h=45,tooltip=""},
        {ID = "A71Toggle",x=29.7*10,y=155*1,w=25,h=45,tooltip=""},
        {ID = "A41Toggle",x=29.7*11,y=155*1,w=25,h=45,tooltip=""},
        {ID = "A45Toggle",x=29.7*12,y=155*1,w=25,h=45,tooltip=""},
        ------------------------------------------------------------------------
        {ID = "A75Toggle",x=29.7*0,y=155*2,w=25,h=45,tooltip=""},
        {ID = "A8Toggle",x=29.7*1,y=155*2,w=25,h=45,tooltip=""},
        {ID = "A52Toggle",x=29.7*2,y=155*2,w=25,h=45,tooltip=""},
        {ID = "A72Toggle",x=29.7*3,y=155*2,w=25,h=45,tooltip=""},
        {ID = "A31Toggle",x=29.7*4,y=155*2,w=25,h=45,tooltip=""},
        {ID = "A32Toggle",x=29.7*5,y=155*2,w=25,h=45,tooltip=""},
        {ID = "A13Toggle",x=29.7*6,y=155*2,w=25,h=45,tooltip=""},
        {ID = "A1Toggle",x=29.7*7,y=155*2,w=25,h=45,tooltip=""},
        {ID = "A20Toggle",x=29.7*8,y=155*2,w=25,h=45,tooltip=""},
        {ID = "A25Toggle",x=29.7*9,y=155*2,w=25,h=45,tooltip=""},
        {ID = "A30Toggle",x=29.7*10,y=155*2,w=25,h=45,tooltip=""},
        {ID = "A56Toggle",x=29.7*11,y=155*2,w=25,h=45,tooltip=""},
        {ID = "A65Toggle",x=29.7*12,y=155*2,w=25,h=45,tooltip=""},
    }
}
for i,button in pairs(ENT.ButtonMap.AV_R.buttons) do
    button.model = {
        model = "models/metrostroi_train/81-720/button_av1.mdl",z=-25,
        var=button.ID:Replace("Toggle",""),speed=8,
        sndvol = 0.8,snd = function(val) return val and "av_on" or "av_off" end,sndmin = 80,sndmax = 1e3/3,sndang = Angle(-90,0,0),
    }
    button.ID = "2:"..button.ID
end
ENT.ButtonMap["AV_S"] = {
    pos = Vector(392,-33,-20),
    ang = Angle(0,270,90),
    width = 300,
    height = 165,
    scale = 0.0625,
    hide=0.8,

    buttons = {
        {ID = "A2Toggle",x=25*0,y=60*0,w=25,h=45,tooltip=""},
        {ID = "A3Toggle",x=25*1,y=60*0,w=25,h=45,tooltip=""},
        {ID = "A4Toggle",x=25*2,y=60*0,w=25,h=45,tooltip=""},
        {ID = "A5Toggle",x=25*3,y=60*0,w=25,h=45,tooltip=""},
        {ID = "A6Toggle",x=25*4,y=60*0,w=25,h=45,tooltip=""},
        {ID = "A70Toggle",x=25*5,y=60*0,w=25,h=45,tooltip=""},
        {ID = "A14Toggle",x=25*6,y=60*0,w=25,h=45,tooltip=""},
        {ID = "A39Toggle",x=25*7,y=60*0,w=25,h=45,tooltip=""},
        {ID = "A28Toggle",x=25*8,y=60*0,w=25,h=45,tooltip=""},
        {ID = "A38Toggle",x=25*9,y=60*0,w=25,h=45,tooltip=""},
        {ID = "A22Toggle",x=25*10,y=60*0,w=25,h=45,tooltip=""},
        --{ID = "A8Toggle",x=25*11,y=60*0,w=25,h=45,tooltip=""},
        ------------------------------------------------------------------------
        {ID = "AISToggle",x=25*0,y=60*1,w=25,h=45,tooltip=""},
        {ID = "A12Toggle",x=25*1,y=60*1,w=25,h=45,tooltip=""},
        {ID = "A16Toggle",x=25*2,y=60*1,w=25,h=45,tooltip=""},
        {ID = "A37Toggle",x=25*3,y=60*1,w=25,h=45,tooltip=""},
        {ID = "A51Toggle",x=25*4,y=60*1,w=25,h=45,tooltip=""},
        {ID = "A24Toggle",x=25*5,y=60*1,w=25,h=45,tooltip=""},
        {ID = "A19Toggle",x=25*6,y=60*1,w=25,h=45,tooltip=""},
        {ID = "A66Toggle",x=25*7,y=60*1,w=25,h=45,tooltip=""},
        {ID = "A18Toggle",x=25*8,y=60*1,w=25,h=45,tooltip=""},
        {ID = "A40Toggle",x=25*9,y=60*1,w=25,h=45,tooltip=""},
        {ID = "A80Toggle",x=25*10,y=60*1,w=25,h=45,tooltip=""},
        {ID = "A50Toggle",x=25*11,y=60*1,w=25,h=45,tooltip=""},
        --{ID = "A52Toggle",x=25*12,y=60*1,w=25,h=45,tooltip=""},
        ------------------------------------------------------------------------
        {ID = "AV2Toggle",x=25*1,y=60*2,w=25,h=45,tooltip=""},
        {ID = "AV3Toggle",x=25*2,y=60*2,w=25,h=45,tooltip=""},
        {ID = "AV4Toggle",x=25*3,y=60*2,w=25,h=45,tooltip=""},
        {ID = "AV5Toggle",x=25*4,y=60*2,w=25,h=45,tooltip=""},
        {ID = "AV6Toggle",x=25*5,y=60*2,w=25,h=45,tooltip=""},
        {ID = "A15Toggle",x=25*6,y=60*2,w=25,h=45,tooltip=""},
        {ID = "A57Toggle",x=25*7,y=60*2,w=25,h=45,tooltip=""},
        {ID = "A81Toggle",x=25*8,y=60*2,w=25,h=45,tooltip=""},
        {ID = "A7Toggle",x=25*9,y=60*2,w=25,h=45,tooltip=""},
        {ID = "A9Toggle",x=25*10,y=60*2,w=25,h=45,tooltip=""},
        {ID = "A68Toggle",x=25*11,y=60*2,w=25,h=45,tooltip=""},
        --{ID = "A72Toggle",x=25*12,y=60*2,w=25,h=45,tooltip=""},
    }
}
for i,button in pairs(ENT.ButtonMap.AV_S.buttons) do
    button.model = {
        model = "models/metrostroi_train/81-720/button_av1.mdl",z=-25,
        var=button.ID:Replace("Toggle",""),speed=8,
        sndvol = 0.8,snd = function(val) return val and "av_on" or "av_off" end,sndmin = 80,sndmax = 1e3/3,sndang = Angle(-90,0,0),
    }
end
ENT.ButtonMap["Battery_R"] = {
    pos = Vector(410.0,-54.25,8),
    ang = Angle(0,90,90),
    width = 440,
    height = 157,
    scale = 0.0625,
    hide=0.8,

    buttons = {
        {ID = "2:RC1Toggle",x=64,y=40,radius=40,tooltip="",model = {
            model = "models/metrostroi_train/81-717/buttons/breaker_rc1.mdl",z=17,ang=180,
            var="RC1",speed=0.5,vmin=1,vmax=0.87,
            plomb = {model = "models/metrostroi_train/81/plomb_b.mdl",ang=230,x=-28,y=28,var="RC1Pl",ID="RC1Pl",z=-15,},
            sndvol = 0.8,snd = function(val) return val and "pak_on" or "pak_off" end,sndmin = 80,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "2:VBToggle",x=220,y=40,radius=40,tooltip="",model = {
            model = "models/metrostroi_train/81-717/buttons/breaker_vb.mdl",z=17,ang=180,
            var="VB",speed=0.5,vmin=1,vmax=0.87,
            sndvol = 0.8,snd = function(val) return val and "pak_on" or "pak_off" end,sndmin = 80,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "2:UOSToggle",x=376,y=40,radius=40,tooltip="",model = {
            model = "models/metrostroi_train/81-717/buttons/breaker_rcuos.mdl",z=17,ang=180,
            var="UOS",speed=0.5,vmin=1,vmax=0.87,
            plomb = {model = "models/metrostroi_train/81/plomb_b.mdl",ang=0,x=25,y=28,var="UOSPl",ID="UOSPl",z=-15,},
            sndvol = 0.8,snd = function(val) return val and "pak_on" or "pak_off" end,sndmin = 80,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
    }
}

ENT.ButtonMap["CabVent_C"] = {
    pos = Vector(455.2,47,-11.9),
    ang = Angle(0,-90,0),
    width = 70,
    height = 62,
    scale = 0.0625,
    hideseat=0.2,

    buttons = {
        {ID="PVK-",x=0, y=0, w=35,h=62, tooltip=""},
        {ID = "!PVK",x=35,y=31,model = {
            model = "models/metrostroi_train/81-717/buttons/breaker_common001.mdl",ang = 180,z=15,
            getfunc = function(ent) return ent:GetPackedRatio("PVK") end, var="PVK",speed=4,min=1,max=0.75,
            sndvol = 1,snd = function(val,val2) return "pvk"..val2 end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID="PVK+",x=35, y=0, w=35,h=62, tooltip=""},
    }
}
ENT.ButtonMap["CabVent_R"] = table.Copy(ENT.ButtonMap["CabVent_C"])
ENT.ButtonMap["CabVent_R"].pos = ENT.ButtonMap["CabVent_R"].pos - Vector(-0.2,0.6,1.1)
for k,v in pairs(ENT.ButtonMap["CabVent_R"].buttons) do v.ID = "1:"..v.ID end
-- Train driver helpers panel
ENT.ButtonMap["HelperPanel_C"] = {
    pos = Vector(447,62.6,17.75),
    ang = Angle(0,0,90),
    width = 76,
    height = 305,
    scale = 0.0625,
    hideseat=0.2,

    buttons = {
        {ID = "VUD2Toggle",x=0,y=0,w=76,h=86,tooltip="",model = {
            model = "models/metrostroi_train/switches/vudbrown.mdl",z=25,
            var="VUD2",speed=6,
            sndvol = 1,snd = function(val) return val and "vu224_on" or "vu224_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "VDLSet",x=0,y=86,w=76,h=86,tooltip="",model = {
            model = "models/metrostroi_train/switches/vudbrown.mdl",z=25,
            var="VDL",speed=6,
            sndvol = 1,snd = function(val) return val and "vu224_on" or "vu224_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "R_Program1HSet",x=38,y=230,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_black.mdl",z = -3,
            var="R_Program1H",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button3_on" or "button2_off" end,
            sndmin = 60,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "R_Program2HSet",x=38,y=285,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_black.mdl",z = -3,
            var="R_Program2H",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button1_on" or "button3_off" end,
            sndmin = 60,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ButtonMap["HelperPanel_R"] = table.Copy(ENT.ButtonMap["HelperPanel_C"])
ENT.ButtonMap["HelperPanel_R"].pos = ENT.ButtonMap["HelperPanel_R"].pos - Vector(0.7,0,-0.65)
for k,v in pairs(ENT.ButtonMap["HelperPanel_R"].buttons) do v.ID = "1:"..v.ID end

ENT.ClientProps["reverser"] = {
    model = "models/metrostroi_train/reversor/reversor_classic.mdl",
    pos = Vector(438,-29.9,-14.9),
    ang = Angle(-90-22,180,90),
    hideseat=0.2,
    modelcallback = function(ent)
        return ent.HasGoldenReverser and "models/metrostroi_train/reversor/reversor_gold.mdl" or "models/metrostroi_train/reversor/reversor_classic.mdl"
    end,
}
ENT.ClientProps["krureverser"] = {
    model = "models/metrostroi_train/reversor/reversor_classic.mdl",
    pos = Vector(443.8,-24.5,-3.2),
    ang = Angle(0,-90,60),
    hideseat=0.2,
    modelcallback = function(ent)
        return ent.HasGoldenReverser and "models/metrostroi_train/reversor/reversor_gold.mdl" or "models/metrostroi_train/reversor/reversor_classic.mdl"
    end,
}

-- UAVA
ENT.ButtonMap["UAVAPanel"] = {
    pos = Vector(423,-57,-25.0),
    ang = Angle(0,180,90),
    width = 180,
    height = 200,
    scale = 0.0625,

    buttons = {
        {ID = "UAVAToggle",x=0, y=0, w=60, h=200, tooltip="", model = {
            plomb = {var="UAVAPl", ID="UAVAPl",},
            var="UAVA",
            sndid="UAVALever",sndvol = 1, snd = function(val) return val and "uava_on" or "uava_off" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(-90,0,0),
        }},
        {ID = "UAVAContactSet",x=60, y=0, w=120, h=200, tooltip=""},
    }
}
ENT.ClientProps["UAVALever"] = {
    model = "models/metrostroi_train/81-703/cabin_uava.mdl",
    pos = Vector(422.7,-59.4,-31.6),
    ang = Angle(3,-180,0),
    hideseat=0.2,
}

ENT.ButtonMap["Stopkran"] = {
    pos = Vector(401,62,17),
    ang = Angle(0,0,90),
    width = 200,
    height = 1300,
    scale = 0.1/2,
        buttons = {
            {ID = "EmergencyBrakeValveToggle",x=0,y=0,w=200,h=1300,tooltip=""},
    }
}
ENT.ClientProps["stopkran"] = {
    model = "models/metrostroi_train/81-717/stop_mvm.mdl",
    pos = Vector(408.45,62.15,11.5),
    ang = Angle(0,0,0),
    hideseat=0.2,
}
ENT.ClientProps["disable_doors_1"] = {
    model = "models/metrostroi_train/81-717/stop_mvm.mdl",
    pos = Vector(285.2,-62,17),
    ang = Angle(0,180,0),
    hideseat=0.2,
}
ENT.ClientProps["disable_doors_2"] = {
    model = "models/metrostroi_train/81-717/stop_mvm.mdl",
    pos = Vector(-297,-62,17.4),
    ang = Angle(0,180,0),
    hideseat=0.2,
}
ENT.ClientProps["disable_doors_3"] = {
    model = "models/metrostroi_train/81-717/stop_mvm.mdl",
    pos = Vector(-297,62,17.4),
    ang = Angle(0,0,0),
    hideseat=0.2,
}
ENT.ClientSounds["EmergencyBrakeValve"] = {{"stopkran",function() return "disconnect_valve" end,1,1,50,1e3,Angle(-90,0,0)}}

local igla_pos = Vector(455.1,-31.7,32.35)
local igla_screen_pos = Vector(455.05,-32.4,30.95)
local igla_ang = Angle(-0,244.5,90)

ENT.ButtonMap["IGLAButtons"] = {
    pos = igla_pos,
    ang = igla_ang,
    width = 87,
    height = 70,
    scale = 0.0625,
    hideseat = 0.2,
    buttons = {
        {ID = "IGLA1USet",x=11, y=39, w=12, h=7, tooltip=""},
        {ID = "IGLA1Set",x=11, y=46, w=12, h=7, tooltip=""},
        {ID = "IGLA1DSet",x=11, y=53, w=12, h=7, tooltip=""},
        {ID = "IGLA2USet",x=65, y=39, w=12, h=7, tooltip=""},
        {ID = "IGLA2Set",x=65, y=46, w=12, h=7, tooltip=""},
        {ID = "IGLA2DSet",x=65, y=53, w=12, h=7, tooltip=""},
        {ID = "!IGLASR",x=17.9, y=10.5, radius=3, tooltip="", model = {
            lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod2.mdl", var="IGLASR",color=Color(175,250,20),z=-2.5},
        }},
        {ID = "!IGLARX",x=27.5, y=10.5, radius=3, tooltip="", model = {
            lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod2.mdl", var="IGLARX",color=Color(255,56,30),z=-2.5},
        }},
        {ID = "!IGLAErr",x=40.5, y=10.5, radius=3, tooltip="", model = {
            lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod2.mdl", var="IGLAErr",color=Color(255,168,000),z=-2.5},
        }},
        {ID = "!IGLAOSP",x=50, y=10.5, radius=3, tooltip="", model = {
            lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod2.mdl", var="IGLAOSP",color=Color(175,250,20),z=-2.5},
        }},
        {ID = "!IGLAPI",x=59.5, y=10.5, radius=3, tooltip="", model = {
            lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod2.mdl", var="IGLAPI",color=Color(255,56,30),z=-2.5},
        }},
        {ID = "!IGLAOff",x=69, y=10.5, radius=3, tooltip="", model = {
            lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod2.mdl", var="IGLAOff",color=Color(255,56,30),z=-2.5},
        }},
    }
}
ENT.ButtonMap["IGLA"] = {
    pos = igla_screen_pos,
    ang = igla_ang,
    width = 512,
    height = 128,
    scale = 0.025/2.96,
    hideseat = 0.2,
    hide=true,
}

ENT.ButtonMap["DriverValveBLDisconnect"] = {
    pos = Vector(426.1,-27.3,-20),
    ang = Angle(90,-150,90),
    width = 200,
    height = 100,
    scale = 0.0625,

    buttons = {
        {ID = "DriverValveBLDisconnectToggle", x=0, y=0, w=200, h=100, tooltip="", model = {
            var="DriverValveBLDisconnect",sndid="brake_disconnect",
            sndvol = 1, snd = function(val) return "disconnect_valve" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ButtonMap["DriverValveTLDisconnect"] = {
    pos = Vector(429.3,-23,-15),
    ang = Angle(90,-150,90),
    width = 200,
    height = 90,
    scale = 0.0625,

    buttons = {
        {ID = "DriverValveTLDisconnectToggle", x=0, y=0, w=200, h=90, tooltip="", model = {
            var="DriverValveTLDisconnect",sndid="train_disconnect",
            sndvol = 1, snd = function(val) return val and "pneumo_TL_open" or "pneumo_TL_disconnect" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ButtonMap["EPKDisconnect"] = {
    pos = Vector(435,-40,-23),
    ang = Angle(0,-90-45,45),
    width = 200,
    height = 120,
    scale = 0.0625,

    buttons = {
        {ID = "EPKToggle",x=0,y=0,w=200,h=120,tooltip="",model = {
            var="EPK"--,sndid="EPK_disconnect",
            --sndvol = 1,snd = function(val) return "disconnect_valve" end,
            --sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ButtonMap["EPVDisconnect"] = {
    pos = Vector(435,-40,-23),
    ang = Angle(0,-90-45,45),
    width = 200,
    height = 120,
    scale = 0.0625,

    buttons = {
        {ID = "EPKToggle",x=0,y=0,w=200,h=120,tooltip="",model = {
            var="EPK"--,sndid="EPK_disconnect",
            --sndvol = 1,snd = function(val) return "disconnect_valve" end,
            --sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ButtonMap["ParkingBrake"] = {
    pos = Vector(456.777527-3,5,-30),
    ang = Angle(0,-90,60),
    width = 200,
    height = 120,
    scale = 0.0625,

    buttons = {
        {ID = "ParkingBrakeToggle",x=0,y=0,w=200,h=120,tooltip="",model = {
            var="ParkingBrake",sndid="parking_brake",
            sndvol = 1,snd = function(val) return "disconnect_valve" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ClientProps["parking_brake"] = {
    model = "models/metrostroi_train/81-707/cran3.mdl",
    pos = Vector(453.6,-0.25,-39.8),
    ang = Angle(120,0,180),
    hideseat=0.2,
}

ENT.ClientProps["brake_disconnect"] = {
    model = "models/metrostroi_train/81-707/cran1.mdl",
    pos = Vector(427.3,-28.9,-32.5),
    ang = Angle(90,-60,90),
    hideseat=0.2,
}
ENT.ClientSounds["EPK"] = {
    {"EPK_disconnect",function() return "disconnect_valve" end,1,1,90,1e3,Angle(-90,0,0)},
    {"EPV_disconnect",function() return "disconnect_valve" end,1,1,90,1e3,Angle(-90,0,0)},
}
ENT.ClientProps["EPK_disconnect"] = {
    model = "models/metrostroi_train/81-707/cran1.mdl",
    pos = Vector(432.4,-44.25,-24.7),
    ang = Angle(0,-90,0),
    hideseat=0.2,
}
ENT.ClientProps["EPV_disconnect"] = {
    model = "models/metrostroi_train/81-707/cran1.mdl",
    pos = Vector(431.15,-43.5,-24.7),
    ang = Angle(0,-90,0),
    hideseat=0.2,
}
ENT.ClientProps["train_disconnect"] = {
    model = "models/metrostroi_train/81-707/cran3.mdl",
    pos = Vector(430.1,-24.0,-24.1),
    ang = Angle(90,-60,90),
    hideseat=0.2,
}


ENT.ButtonMap["DriverValveDisconnect"] = {
    pos = Vector(425,-23,-27),
    ang = Angle(90,-150,90),
    width = 200,
    height = 90,
    scale = 0.0625,

    buttons = {
        {ID = "DriverValveDisconnectToggle",x=0,y=0,w=200,h=90,tooltip="",model = {
            var="DriverValveDisconnect",sndid="valve_disconnect",
            sndvol = 1,snd = function(val) return "disconnect_valve" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ClientProps["valve_disconnect"] = {
    model = "models/metrostroi_train/81-707/cran3.mdl",
    pos = Vector(428.15,-22.95,-37.43),
    ang = Angle(90,240+2,90),
    hideseat=0.2,
}

ENT.ButtonMap["FrontPneumatic"] = {
    pos = Vector(470-9,-45.0,-58.0+5),
    ang = Angle(0,90,90),
    width = 900,
    height = 100,
    scale = 0.1,
    hideseat=0.2,
    hide=true,
    screenHide = true,

    buttons = {
        {ID = "FrontBrakeLineIsolationToggle",x=000, y=0, w=400, h=100, tooltip=""},
        {ID = "FrontTrainLineIsolationToggle",x=500, y=0, w=400, h=100, tooltip=""},
    }
}
ENT.ClientProps["FrontBrake"] = {--
    model = "models/metrostroi_train/bogey/disconnect_valve_red.mdl",
    pos = Vector(449+11, -31, -62),
    ang = Angle(-15,-90,0),
    hide = 2,
}
ENT.ClientProps["FrontTrain"] = {--
    model = "models/metrostroi_train/bogey/disconnect_valve_blue.mdl",
    pos = Vector(449+11, 31, -62),
    ang = Angle( 15,-90,0),
    hide = 2,
}
ENT.ClientSounds["FrontBrakeLineIsolation"] = {{"FrontBrake",function() return "disconnect_valve" end,1,1,50,1e3,Angle(-90,0,0)}}
ENT.ClientSounds["FrontTrainLineIsolation"] = {{"FrontTrain",function() return "disconnect_valve" end,1,1,50,1e3,Angle(-90,0,0)}}

ENT.ButtonMap["RearPneumatic"] = {
    pos = Vector(-473-1,45.0,-58.0+5),
    ang = Angle(0,270,90),
    width = 900,
    height = 100,
    scale = 0.1,
    hideseat=0.2,
    hide=true,
    screenHide = true,
    buttons = {
        {ID = "RearTrainLineIsolationToggle",x=500, y=0, w=400, h=100, tooltip=""},
        {ID = "RearBrakeLineIsolationToggle",x=000, y=0, w=400, h=100, tooltip=""},
    }
}
ENT.ClientProps["RearTrain"] = {--
    model = "models/metrostroi_train/bogey/disconnect_valve_blue.mdl",
    pos = Vector(-450-22, -34, -62),
    ang = Angle(-15,90,0),
    hide = 2,
}
ENT.ClientProps["RearBrake"] = {--
    model = "models/metrostroi_train/bogey/disconnect_valve_red.mdl",
    pos = Vector(-450-22, 34, -62),
    ang = Angle( 15,90,0),
    hide = 2,
}
ENT.ClientSounds["RearBrakeLineIsolation"] = {{"RearBrake",function() return "disconnect_valve" end,1,1,50,1e3,Angle(-90,0,0)}}
ENT.ClientSounds["RearTrainLineIsolation"] = {{"RearTrain",function() return "disconnect_valve" end,1,1,50,1e3,Angle(-90,0,0)}}


ENT.ButtonMap["GV"] = {
    pos = Vector(130,50+10,-70),
    ang = Angle(0,180,90),
    width = 120,
    height = 120,
    scale = 0.1,
    buttons = {
        {ID = "GVToggle",x=0, y=0, w= 120,h = 120, tooltip="", model = {
            var="GV",sndid = "gv_wrench",
            sndvol = 0.8,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
            snd = function(val) return val and "gv_f" or "gv_b" end,
        }},
    }
}
local gv_pos = Vector(153.5-3-26,56.4,-76)

ENT.ClientProps["gv_wrench"] = {
    model = "models/metrostroi_train/reversor/reversor_classic.mdl",
    pos = gv_pos,
    ang = Angle(-90,180,90),
    hide = 0.5,
}

ENT.ButtonMap["AirDistributor"] = {
    pos = Vector(-185,-68,-50),
    ang = Angle(0,0,90),
    width = 170,
    height = 80,
    scale = 0.1,
    hideseat=0.1,
    hide=true,
    screenHide = true,

    buttons = {
        {ID = "AirDistributorDisconnectToggle",x=0,y=0,w= 170,h = 80,tooltip=""},
    }
}

for i=0,4 do
    ENT.ClientProps["TrainNumberL"..i] = {
        model = "models/metrostroi_train/81-714_mmz/bortnumber_" .. i .. ".mdl",
        pos = Vector(41+16+i*6.6-5*6.6/2,67.4,-17.8),
        ang = Angle(0,90,0),
        hide = 1.5,
        callback = function(ent)
            ent.WagonNumber = false
        end,
    }
    ENT.ClientProps["TrainNumberR"..i] = {
        model = "models/metrostroi_train/81-714_mmz/bortnumber_" .. i .. ".mdl",
        pos = Vector(64+16-i*6.6-5*6.6/2,-67.4,-17.8),
        ang = Angle(0,270,0),
        hide = 1.5,
        callback = function(ent)
            ent.WagonNumber = false
        end,
    }
end

-- ENT.ClientProps["route"] = {
--     model = "models/metrostroi_train/common/routes/ezh/route_holder.mdl",
--     pos = Vector(-8,0,-5.65),
--     ang = Angle(0,1,0),
--     hide = 2,
-- }

-- ENT.ClientProps["route1"] = {
--     model = "models/metrostroi_train/common/routes/ezh/route_number1.mdl",
--     pos = ENT.ClientProps["route"].pos,
--     ang = ENT.ClientProps["route"].ang,
--     skin=6,
--     hide = 2,
--     callback = function(ent)
--         ent.RouteNumber.Reloaded = false
--     end,
-- }
-- ENT.ClientProps["route2"] = {
--     model = "models/metrostroi_train/common/routes/ezh/route_number2.mdl",
--     pos = ENT.ClientProps["route"].pos,
--     ang = ENT.ClientProps["route"].ang,
--     skin=1,
--     hide = 2,
--     callback = function(ent)
--         ent.RouteNumber.Reloaded = false
--     end,
-- }

ENT.ButtonMap["CabinDoor"] = {
    pos = Vector(414.5,64,56.7),
    ang = Angle(0,0,90),
    width = 642,
    height = 2000,
    scale = 0.1/2,
    buttons = {
        {ID = "CabinDoor",x=0,y=0,w=642,h=2000,tooltip="",model = {
            var="door2",sndid="door2",
            sndvol = 1,snd = function(val) return val and "cab_door_open" or "cab_door_close" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ButtonMap["OtsekDoor1"] = {
    pos = Vector(376,23,57),
    ang = Angle(0,270,90),
    width = 752,
    height = 2100,
    scale = 0.1/2,
    buttons = {
        {ID = "OtsekDoor1",x=0,y=0,w=752,h=2100,tooltip="",model = {
            var="door_otsek1",sndid="door_otsek1",
            sndvol = 1,snd = function(val) return "otsek_door_close" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ButtonMap["OtsekDoor2"] = {
    pos = Vector(376,-19,57),
    ang = Angle(0,270,90),
    width = 752,
    height = 2100,
    scale = 0.1/2,
    buttons = {
        {ID = "OtsekDoor2",x=0,y=0,w=752,h=2100,tooltip="",model = {
            var="door_otsek2",sndid="door_otsek2",
            sndvol = 1,snd = function(val) return "otsek_door_close" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
    }
}

ENT.ButtonMap["PassengerDoor"] = {
    pos = Vector(390-12.2,29,50.6),--28
    ang = Angle(0,90,90),
    width = 642,
    height = 2000,
    scale = 0.1/2,
    buttons = {
        {ID = "PassengerDoor",x=0,y=0,w=642,h=2000,tooltip="",model = {
            var="door3",sndid="door3",
            sndvol = 1,snd = function(val) return val and "cab_door_open" or "cab_door_close" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ButtonMap["PassengerDoor1"] = {
    pos = Vector(390-12.2,29+32,50.6),--28
    ang = Angle(0,-90,90),
    width = 642,
    height = 2000,
    scale = 0.1/2,
    buttons = {
        {ID = "PassengerDoor",x=0,y=0,w=642,h=2000,tooltip=""},
    }
}
ENT.ButtonMap["CabinDoor"] = {
    pos = Vector(411,64,50),
    ang = Angle(0,0,90),
    width = 665,
    height = 2000,
    scale = 0.1/2,
    buttons = {
        {ID = "CabinDoor",x=0,y=0,w=665,h=2000,tooltip="",model = {
            var="door2",sndid="door2",
            sndvol = 1,snd = function(val) return val and "cab_door_open" or "cab_door_close" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ButtonMap["RearDoor"] = {
    pos = Vector(-470-3,-16,48.4-2),
    ang = Angle(0,90,90),
    width = 642,
    height = 1900,
    scale = 0.1/2,
    buttons = {
        {ID = "RearDoor",x=0,y=0,w=642,h=1900,tooltip="",model = {
            var="door1",sndid="door1",
            sndvol = 1,snd = function(val) return val and "cab_door_open" or "cab_door_close" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
    }
}
--[[ ENT.ButtonMap["LeftMirror"] = {
    pos = Vector(470.0-0.1,72.75,37.4),
    ang = Angle(0,-60,90),
    width = 128,
    height = 256,
    scale = 0.06,
}
ENT.ButtonMap["RightMirror"] = {
    pos = Vector(470.0+3.4,-72.75+6,37.4),
    ang = Angle(0,-60-60,90),
    width = 128,
    height = 256,
    scale = 0.06,
}--]]
--------------------------------------------------------------------------------
ENT.ClientPropsInitialized = false
ENT.ClientProps["brake013"] = {
    model = "models/metrostroi_train/81-717/cran13.mdl",
    pos = Vector(431.5,-20.3,-10.2),
    ang = Angle(0,180,0),
    hideseat = 0.2,
}
ENT.ClientProps["brake334"] = {
    model = "models/metrostroi_train/81-703/cabin_cran_334.mdl",
    pos = Vector(432.27,-22.83,-8.2),
    ang = Angle(0,-230,0),
    hideseat = 0.2,
}
if not ENT.ClientSounds["br_013"] then ENT.ClientSounds["br_013"] = {} end
table.insert(ENT.ClientSounds["br_013"],{"brake013",function(ent,_,var) return "br_013" end,0.7,1,50,1e3,Angle(-90,0,0)})
if not ENT.ClientSounds["br_334"] then ENT.ClientSounds["br_334"] = {} end
table.insert(ENT.ClientSounds["br_334"],{"brake334",function(ent,_,var) return "br_334_"..var end,1,1,50,1e3,Angle(-90,0,0)})



ENT.ClientProps["PB"] = {
    model = "models/metrostroi_train/81-720/720_pb.mdl",
    pos = Vector(450, 18, -37),
    ang = Angle(0,-90,8),
    hideseat = 0.2,
}
if not ENT.ClientSounds["PB"] then ENT.ClientSounds["PB"] = {} end
table.insert(ENT.ClientSounds["PB"],{"PB",function(ent,var) return var > 0 and "pb_on" or "pb_off" end,1,1,50,1e3,Angle(-90,0,0)})

ENT.ClientProps["train_line"] = {
    model = "models/metrostroi_train/Equipment/arrow_nm.mdl",
    pos = Vector(450.665070,-15.255391,-3.192689+5.35),
    ang = Angle(-62.299999,-33.400002,0.000000),
    hideseat = 0.2,
}
ENT.ClientProps["brake_line"] = {
    model = "models/metrostroi_train/Equipment/arrow_tm.mdl",
    pos = Vector(450.684143,-15.267894,-3.204609+5.35),
    ang = Angle(-62.299999,-33.400002,0.000000),
    hideseat = 0.2,
}
ENT.ClientProps["brake_cylinder"] = {
    model = "models/metrostroi_train/Equipment/arrow_nm.mdl",
    pos = Vector(450.535736,-22.815704,-3.113149+5.35),
    ang = Angle(-62.299999,-33.400002,0.000000),
    hideseat = 0.2,
}
-- ENT.ClientProps["ampermeter"] = {
--     model = "models/metrostroi/81-717/volt_arrow.mdl",
--     pos = Vector(452.269592,-30.540430,16.922098),
--     ang = Angle(90.500000,0.000000,40.000000),
--     hideseat = 0.2,
-- }
-- ENT.ClientProps["voltmeter"] = {
--     model = "models/metrostroi/81-717/volt_arrow.mdl",
--     pos = Vector(452.246277,-30.519978,12.287716),
--     ang = Angle(90.500000,0.000000,40.000000),
--     hideseat = 0.2,
-- }
ENT.ClientProps["new_ampermeter"] = {
    model = "models/metrostroi/81-717/volt_arrow.mdl",
    pos = Vector(449.799988,-33.349998,14.5),
    ang = Angle(90,0,20),
    hideseat = 0.2,
}
ENT.ClientProps["new_voltmeter"] = {
    model = "models/metrostroi/81-717/volt_arrow.mdl",
    pos = Vector(451.399994,-28.923000,14.300000),
    ang = Angle(90,0,20),
    hideseat = 0.2,
}
ENT.ButtonMap["HVMeters"] = {
    pos = Vector(452,-26.5,18),
    ang = Angle(0,-111,90),
    width = 78+68,
    height = 64,
    scale = 0.0625,

    buttons = {
        {ID = "!HighVoltage", x=0, y=0, w=68, h=64, tooltip=""},
        {ID = "!EnginesCurrent", x=78, y=0, w=68, h=64, tooltip=""},
    }
}
ENT.ClientProps["volt1"] = {
    model = "models/metrostroi_train/81-710/ezh3_voltages.mdl",
    pos = Vector(449.501740,15.141174,0.812889),
    ang = Angle(-58.299999,0.000000,27.968136),
    bscale = Vector(1,1,1.47),
    hideseat = 0.2,
}


ENT.ClientProps["bortlamps1"] = {
    model = "models/metrostroi_train/81-717/bort_lamps_body.mdl",
    pos = Vector(-52,67,45.5),
    ang = Angle(0,0,0),
    hide = 2,
}
ENT.ClientProps["bortlamp1_w"] = {
    model = "models/metrostroi_train/equipment/bort_lamps_b.mdl",
    pos = ENT.ClientProps.bortlamps1.pos+Vector(0,0.9,3.25),
    ang = Angle(0,0,0),
    nohide = true,
}
ENT.ClientProps["bortlamp1_g"] = {
    model = "models/metrostroi_train/equipment/bort_lamps_g.mdl",
    pos = ENT.ClientProps.bortlamps1.pos+Vector(0,0.9,-0.1),
    ang = Angle(0,0,0),
    nohide = true,
}
ENT.ClientProps["bortlamp1_y"] = {
    model = "models/metrostroi_train/equipment/bort_lamps_y.mdl",
    pos = ENT.ClientProps.bortlamps1.pos+Vector(0,0.9,-3.3),
    ang = Angle(0,0,0),
    nohide = true,
}
ENT.ClientProps["bortlamps2"] = {
    model = "models/metrostroi_train/81-717/bort_lamps_body.mdl",
    pos = Vector(39,-67,45.5),
    ang = Angle(0,180,0),
    hide = 2,
}
ENT.ClientProps["bortlamp2_w"] = {
    model = "models/metrostroi_train/equipment/bort_lamps_b.mdl",
    pos = ENT.ClientProps.bortlamps2.pos+Vector(0,-0.85,3.2),
    ang = Angle(0,180,0),
    nohide = true,
}
ENT.ClientProps["bortlamp2_g"] = {
    model = "models/metrostroi_train/equipment/bort_lamps_g.mdl",
    pos = ENT.ClientProps.bortlamps2.pos+Vector(0,-0.85,-0.1),
    ang = Angle(0,180,0),
    nohide = true,
}
ENT.ClientProps["bortlamp2_y"] = {
    model = "models/metrostroi_train/equipment/bort_lamps_y.mdl",
    pos = ENT.ClientProps.bortlamps2.pos+Vector(0,-0.85,-3.35),
    ang = Angle(0,180,0),
    nohide = true,
}
---[[
ENT.ClientProps["bortlamps3"] = {
    model = "models/metrostroi_train/81-502/bort_lamps_body.mdl",
    pos = Vector(0,67,53.5),
    ang = Angle(90,0,0),
    hide = 2,
}
ENT.ClientProps["bortlamp3_w"] = {
    model = "models/metrostroi_train/equipment/bort_lamps_b.mdl",
    pos = ENT.ClientProps.bortlamps3.pos+Vector(3.28,0.85,0),
    ang = Angle(0,0,0),
    nohide = true,
}
ENT.ClientProps["bortlamp3_g"] = {
    model = "models/metrostroi_train/equipment/bort_lamps_g.mdl",
    pos = ENT.ClientProps.bortlamps3.pos+Vector(-0.06,0.85,0),
    ang = Angle(0,0,0),
    nohide = true,
}
ENT.ClientProps["bortlamp3_y"] = {
    model = "models/metrostroi_train/equipment/bort_lamps_y.mdl",
    pos = ENT.ClientProps.bortlamps3.pos+Vector(-3.35,0.85,0),
    ang = Angle(0,0,0),
    nohide = true,
}
ENT.ClientProps["bortlamps4"] = {
    model = "models/metrostroi_train/81-502/bort_lamps_body.mdl",
    pos = Vector(0,-67,53.5),
    ang = Angle(90,180,0),
    hide = 2,
}
ENT.ClientProps["bortlamp4_w"] = {
    model = "models/metrostroi_train/equipment/bort_lamps_b.mdl",
    pos = ENT.ClientProps.bortlamps4.pos+Vector(-3.28,-0.85,0),
    ang = Angle(0,180,0),
    nohide = true,
}
ENT.ClientProps["bortlamp4_g"] = {
    model = "models/metrostroi_train/equipment/bort_lamps_g.mdl",
    pos = ENT.ClientProps.bortlamps4.pos+Vector(0.06,-0.85,0),
    ang = Angle(0,180,0),
    nohide = true,
}
ENT.ClientProps["bortlamp4_y"] = {
    model = "models/metrostroi_train/equipment/bort_lamps_y.mdl",
    pos = ENT.ClientProps.bortlamps4.pos+Vector(3.35,-0.85,0),
    ang = Angle(0,180,0),
    nohide = true,
}--]]
--------------------------------------------------------------------------------
-- Add doors
--[[ local function GetDoorPosition(i,k,j)
    if j == 0
    then return Vector(338.0-230.1*i+(1-k)*0.8,-65*(1-2*k),0.761)
    else return Vector(338.2-230.1*i+(1-k)*0.8,-65*(1-2*k),0.761)
    end
end
for i=0,3 do
    for k=0,1 do
        ENT.ClientProps["door"..i.."x"..k.."a"] = {
            model = "models/metrostroi_train/81-717/door_right_spb.mdl",
            pos = GetDoorPosition(i,k,0),
            ang = Angle(0,90 +180*k,0),
            hide = 2,
        }
        ENT.ClientProps["door"..i.."x"..k.."b"] = {
            model = "models/metrostroi_train/81-717/door_left_spb.mdl",
            pos = GetDoorPosition(i,k,1),
            ang = Angle(0,90 +180*k,0),
            hide = 2,
        }
    end
end--]]
ENT.ClientProps["door0x1"] = {
    model = "models/metrostroi_train/81-717/81-717_doors_pos1.mdl",
    pos = Vector(338.445,65.164,0.807),
    ang = Angle(0,-90,0),
    hide = 2.0,
}
ENT.ClientProps["door1x1"] = {
    model = "models/metrostroi_train/81-717/81-717_doors_pos2.mdl",
    pos = Vector(108.324,65.164,0.807),
    ang = Angle(0,-90,0),
    hide = 2.0,
}
ENT.ClientProps["door2x1"] = {
    model = "models/metrostroi_train/81-717/81-717_doors_pos3.mdl",
    pos = Vector(-121.682,65.164,0.807),
    ang = Angle(0,-90,0),
    hide = 2.0,
}
ENT.ClientProps["door3x1"] = {
    model = "models/metrostroi_train/81-717/81-717_doors_pos4.mdl",
    pos = Vector(-351.531,65.164,0.807),
    ang = Angle(0,-90,0),
    hide = 2.0,
}
ENT.ClientProps["door0x0"] = {
    model = "models/metrostroi_train/81-717/81-717_doors_pos4.mdl",
    pos = Vector(338.445,-65.164,0.807),
    ang = Angle(0,90,0),
    hide = 2.0,
}
ENT.ClientProps["door1x0"] = {
    model = "models/metrostroi_train/81-717/81-717_doors_pos3.mdl",
    pos = Vector(108.324,-65.164,0.807),
    ang = Angle(0,90,0),
    hide = 2.0,
}
ENT.ClientProps["door2x0"] = {
    model = "models/metrostroi_train/81-717/81-717_doors_pos2.mdl",
    pos = Vector(-121.682,-65.164,0.807),
    ang = Angle(0,90,0),
    hide = 2.0,
}
ENT.ClientProps["door3x0"] = {
    model = "models/metrostroi_train/81-717/81-717_doors_pos1.mdl",
    pos = Vector(-351.531,-65.164,0.807),
    ang = Angle(0,90,0),
    hide = 2.0,
}
-- ENT.ClientProps["Lamp_RTM1"] = {
--     model = "models/metrostroi_train/81-717/rtmlamp.mdl",
--     pos = Vector(414.367554,-32.449749,6.717192),
--     ang = Angle(0.000000,180.000000,0.000000),
--     hideseat = 0.2,
-- }
-- ENT.ClientProps["Lamp_RTM2"] = {
--     model = "models/metrostroi_train/81-717/rtmlamp.mdl",
--     pos = Vector(447.35,-32.82,-0.90),
--     ang = Angle(0,-5,0),
--     hideseat = 0.2,
-- }
ENT.ClientProps["Lamps_cab1"] = {
    model = "models/metrostroi_train/81-717/lamps/lamp_cabine1.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hideseat = 0.9,
}
ENT.ClientProps["Lamps_cab2"] = {
    model = "models/metrostroi_train/81-717/lamps/lamp_cabine2.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hideseat = 0.9,
}
ENT.ClientProps["Lamps2_cab1"] = {
    model = "models/metrostroi_train/81-717/lamps/lamp_cabine1.mdl",
    pos = Vector(0,0,-0),
    ang = Angle(0,0,0),
    hideseat = 0.9,
}
ENT.ClientProps["Lamps2_cab2"] = {
    model = "models/metrostroi_train/81-717/lamps/lamp_cabine2.mdl",
    pos = Vector(0,0,-0),
    ang = Angle(0,0,0),
    hideseat = 0.9,
}
for i = 0,9 do
    --[[ local b = 15--math.random()*15
    local g = 15--b+math.random()*(15-b)
    if math.random() > 0.4 then
        g = math.random()*15
        b = g
    else
        g = 15
        b = -10+math.random()*25
    end--]]
    ENT.ClientProps["lamp1_"..i+1] = {
        model = "models/metrostroi_train/81-540b/minsk_lamp_type4_glow.mdl",
        pos = Vector(313 - 79.13*i,0,70.5),
        ang = Angle(0,90,0),
        --color = Color(255,235+g,235+b),
        color = Color(255,255,255),
        hideseat = 1.1,
    }
end
--[[

local pos = Vector(450.273468,-32.306019,13.236823)
local ang = Angle(-18.000000,25.541767,-90.600349)
ENT.ClientProps["TEST"] = {
    model = "models/metrostroi_train/81/334cran.mdl",
    pos = pos,
    ang = ang,
    scale=0.1,
}--]]


ENT.Lights = {
    -- Headlight glow
    [1] = { "headlight",Vector(460,0,-40),Angle(0,0,0),Color(216,161,92),farz=5144,brightness = 4, fov=100, texture = "models/metrostroi_train/equipment/headlight",shadows = 1,headlight=true},
    [2] = { "headlight",        Vector(460,0,50), Angle(-20,0,0), Color(255,0,0), fov=160 ,brightness = 0.3, farz=450,texture = "models/metrostroi_train/equipment/headlight2",shadows = 0,backlight=true},

    [3] = { "headlight",        Vector(365,-9,50), Angle(50,40,-0), Color(206,135,80), hfov=80, vfov=80,farz=100,brightness = 6,shadows=1},
    [4] = { "headlight",        Vector(365,-51,50), Angle(50,40,-0), Color(206,135,80), hfov=80, vfov=80,farz=100,brightness = 6,shadows=1},

    -- Manometers
    [40] = { "headlight",Vector(451.9,-13.5,-2+5.35),Angle(52.571899-15-5,-129.269775+25+15,49.853062) ,Color(255,125,25),farz = 8,nearz = 2,shadows = 1,brightness = 1,fov = 145 },
    [41] = { "headlight",Vector(451.8,-21,-2+5.35),Angle(52.571899-15-5,-129.269775+25+15,49.853062),Color(255,125,25),farz = 8,nearz = 2,shadows = 1,brightness = 1,fov = 140 },
    [42] = { "headlight",Vector(450.3,13.1,-4.4+5.35),Angle(-136.613632-33,-95.636734-28,137.434570),Color(255,125,25),farz = 8,nearz = 2,shadows = 0,brightness = 1.5,fov = 120 },
    [43] = { "headlight",Vector(451.9-3,3.6+1,3.35+0.5),Angle(0,-90,0),Color(255,125,25),farz = 8,nearz = 2,shadows = 0,brightness = 1.5,fov = 80 },
    -- Voltmeter
    -- [44] = { "headlight",Vector(450.273468,-32.306019,13.236823),Angle(-18.000000,25.541767,-90.600349),Color(255,145,25),farz = 10,nearz = 2,shadows = 1,brightness = 1,fov = 100 },
    -- [45] = { "headlight",Vector(450.273468,-32.306019,18.236823),Angle(-12.000000,25.541767,-90.600349),Color(255,125,25),farz = 10,nearz = 2,shadows = 1,brightness = 1,fov = 100 },
}

function ENT:Initialize()
    self.BaseClass.Initialize(self)
    --self.Train:SetPackedRatio("EmergencyValve_dPdT",leak)
    --self.Train:SetPackedRatio("EmergencyValveEPK_dPdT",leak)
    --self.Train:SetPackedRatio("EmergencyBrakeValve_dPdT",leak)
    self.RRIScreen = self:CreateRT("717RRI",128,128)
    self.IGLA = self:CreateRT("717IGLA",512,128)
	self.ECRSScr = self:CreateRT("7171PECRS",256,256)
    self.LeftMirror = self:CreateRT("LeftMirror",128,256)
    self.RightMirror = self:CreateRT("RightMirror",128,256)

    self.CraneRamp = 0
    self.CraneLRamp = 0
    self.CraneRRamp = 0
    self.ReleasedPdT = 0
    self.EmergencyValveRamp = 0
    self.EmergencyValveEPKRamp = 0
    self.EmergencyBrakeValveRamp = 0
    self.FrontLeak = 0
    self.RearLeak = 0

    self.VentCab = 0
    self.VentG1 = 0
    self.VentG2 = 0
end

local bortnumber_format = "models/metrostroi_train/81-714_mmz/bortnumber_%d.mdl"

function ENT:UpdateWagonNumber()
    local count = math.max(4,math.ceil(math.log10(self.WagonNumber+1)))
    for i=0,4 do
        self:ShowHide("TrainNumberL"..i,i<count)
        self:ShowHide("TrainNumberR"..i,i<count)
        if i< count and self.WagonNumber then
            local leftNum,rightNum = self.ClientEnts["TrainNumberL"..i],self.ClientEnts["TrainNumberR"..i]
            local num = math.floor(self.WagonNumber%(10^(i+1))/10^i)
            if IsValid(leftNum) then
                leftNum:SetPos(self:LocalToWorld(Vector(41+16+i*6.6-count*6.6/2,67.4,-17.8)))
                leftNum:SetModel(Format(bortnumber_format, num))
            end
            if IsValid(rightNum) then
                rightNum:SetPos(self:LocalToWorld(Vector(64+16-i*6.6-count*6.6/2,-67.4,-17.8)))
                rightNum:SetModel(Format(bortnumber_format, num))
            end
        end
    end
end
local Cpos = {
    0,0.2,0.4,0.5,0.6,0.8,1
}
--------------------------------------------------------------------------------
function ENT:Think()
    self.BaseClass.Think(self)
    if not self.RenderClientEnts or self.CreatingCSEnts then
        self.RKTimer = nil
        self.OldBPSNType = nil

        self.RingType = nil
        return
    end

    if self.Scheme ~= self:GetNW2Int("Scheme",1) then
        self.PassSchemesDone = false
        self.Scheme = self:GetNW2Int("Scheme",1)
    end
    if self.RelaysConfig ~= self:GetNW2String("RelaysConfig") then
        self.RelaysConfig = self:GetNW2String("RelaysConfig")
        self:SetRelays()
    end
    if not self.PassSchemesDone and IsValid(self.ClientEnts.schemes) then
        local scheme = Metrostroi.Skins["717_new_schemes"] and Metrostroi.Skins["717_new_schemes"][self.Scheme]
        self.ClientEnts.schemes:SetSubMaterial(0,scheme and scheme[1])
        self.PassSchemesDone = true
    end


    self:SetLightPower(40,self:GetPackedBool("PanelLights"))
    self:SetLightPower(41,self:GetPackedBool("PanelLights"))
    self:SetLightPower(42,self:GetPackedBool("PanelLights"))

    -- self:SetLightPower(44,self:GetPackedBool("PanelLights"))
    -- self:SetLightPower(45,self:GetPackedBool("PanelLights"))

    local HL1 = self:Animate("Headlights1",self:GetPackedBool("Headlights1") and 1 or 0,0,1,6,false)
    local HL2 = self:Animate("Headlights2",self:GetPackedBool("Headlights2") and 1 or 0,0,1,6,false)
    local RL = self:Animate("RedLights_a",self:GetPackedBool("RedLights") and 1 or 0,0,1,6,false)
    self:ShowHideSmooth("RedLights",RL)

    local headlight = HL1*0.6+HL2*0.4
    self:SetLightPower(1,headlight>0,headlight)
    self:SetLightPower(2,self:GetPackedBool("RedLights"),RL)

    

    local newBortlamps = self:GetNW2Bool("NewBortlamps")
    local Bortlamp_w = self:Animate("Bortlamp_w",self:GetPackedBool("DoorsW") and 1 or 0,0,1,16,false)
    local Bortlamp_g = self:Animate("Bortlamp_g",self:GetPackedBool("GRP") and 1 or 0,0,1,16,false)
    local Bortlamp_y = self:Animate("Bortlamp_y",self:GetPackedBool("BrW") and 1 or 0,0,1,16,false)
    if newBortlamps then
        self:ShowHide("bortlamps1",true)
        self:ShowHide("bortlamps2",true)
        self:ShowHide("bortlamps3",false)
        self:ShowHide("bortlamps4",false)
        self:ShowHideSmooth("bortlamp1_w",Bortlamp_w)
        self:ShowHideSmooth("bortlamp1_g",Bortlamp_g)
        self:ShowHideSmooth("bortlamp1_y",Bortlamp_y)
        self:ShowHideSmooth("bortlamp2_w",Bortlamp_w)
        self:ShowHideSmooth("bortlamp2_g",Bortlamp_g)
        self:ShowHideSmooth("bortlamp2_y",Bortlamp_y)
        self:ShowHideSmooth("bortlamp3_w",0)
        self:ShowHideSmooth("bortlamp3_g",0)
        self:ShowHideSmooth("bortlamp3_y",0)
        self:ShowHideSmooth("bortlamp4_w",0)
        self:ShowHideSmooth("bortlamp4_g",0)
        self:ShowHideSmooth("bortlamp4_y",0)
    else
        self:ShowHide("bortlamps1",false)
        self:ShowHide("bortlamps2",false)
        self:ShowHide("bortlamps3",true)
        self:ShowHide("bortlamps4",true)
        self:ShowHideSmooth("bortlamp1_w",0)
        self:ShowHideSmooth("bortlamp1_g",0)
        self:ShowHideSmooth("bortlamp1_y",0)
        self:ShowHideSmooth("bortlamp2_w",0)
        self:ShowHideSmooth("bortlamp2_g",0)
        self:ShowHideSmooth("bortlamp2_y",0)
        self:ShowHideSmooth("bortlamp3_w",Bortlamp_w)
        self:ShowHideSmooth("bortlamp3_g",Bortlamp_g)
        self:ShowHideSmooth("bortlamp3_y",Bortlamp_y)
        self:ShowHideSmooth("bortlamp4_w",Bortlamp_w)
        self:ShowHideSmooth("bortlamp4_g",Bortlamp_g)
        self:ShowHideSmooth("bortlamp4_y",Bortlamp_y)
    end

    self:Animate("Controller",self:GetPackedRatio("ControllerPosition"),0.3,0.02,2,false)

    self:Animate("reverser",self:GetNW2Int("ReverserPosition")/2,0,0.27,4,false)
    self:Animate("krureverser",self:GetNW2Int("KRUPosition")/2,0.53,0.95,4,false)
    self:ShowHide("reverser",self:GetNW2Int("WrenchMode",0)==1)
    self:ShowHide("krureverser",self:GetNW2Int("WrenchMode",0)==2)

    self:ShowHide("brake013",self:GetPackedBool("Crane013"))
    self:ShowHide("brake_valve_013",self:GetPackedBool("Crane013"))
    self:ShowHide("valve_disconnect",self:GetPackedBool("Crane013"))
    self:ShowHide("EPV_disconnect",self:GetPackedBool("Crane013"))
    self:HidePanel("DriverValveDisconnect",not self:GetPackedBool("Crane013"))

    self:ShowHide("brake334",not self:GetPackedBool("Crane013"))
    self:ShowHide("brake_valve_334",not self:GetPackedBool("Crane013"))
    self:ShowHide("brake_disconnect",not self:GetPackedBool("Crane013"))
    self:ShowHide("EPK_disconnect",not self:GetPackedBool("Crane013"))
    self:ShowHide("train_disconnect",not self:GetPackedBool("Crane013"))
    self:HidePanel("DriverValveBLDisconnect",self:GetPackedBool("Crane013"))
    self:HidePanel("DriverValveTLDisconnect",self:GetPackedBool("Crane013"))

    self:Animate("brake334",self:GetPackedRatio("CranePosition")/5,0.35,0.65,256,24)
    self:Animate("brake013",        Cpos[self:GetPackedRatio("CranePosition")] or 0, 0.03, 0.458,  256,24)
    
    if self.KVType ~= self:GetNW2Int("KVType",1) then
        self:RemoveCSEnt("Controller")
        self.KVType = self:GetNW2Int("KVType",1)
    end
    -- self:HidePanel("Block2_2",ARSType~=1)
    -- self:HidePanel("Block2_1",ARSType~=2 and ARSType~=3)
    -- self:HidePanel("Block2_3",ARSType<4)
    self:ShowHide("SSpeed1",self:GetPackedBool("LUDS"))
    self:ShowHide("SSpeed2",self:GetPackedBool("LUDS"))
    self:ShowHide("new_voltm_light", self:GetPackedBool("PanelLights"))
    self:ShowHide("SpeedFact1",self:GetPackedBool("LUDS"))
    self:ShowHide("SpeedFact2",self:GetPackedBool("LUDS"))
    if self:GetPackedBool("LUDS") then
        local speed = self:GetPackedRatio("Speed")*100.0
        if IsValid(self.ClientEnts["SSpeed1"])then self.ClientEnts["SSpeed1"]:SetSkin(math.floor(speed)%10) end
        if IsValid(self.ClientEnts["SSpeed2"])then self.ClientEnts["SSpeed2"]:SetSkin(math.floor(speed/10)) end
        for i=1,2 do
            if IsValid(self.ClientEnts["SpeedFact"..i]) then self.ClientEnts["SpeedFact"..i]:SetSkin(math.ceil(math.Clamp((speed-4)/5-(i-1)*10,0,10))) end
        end
    end

    self:ShowHide("EMU_route_number_1", self:GetPackedBool("VB"))
    self:ShowHide("EMU_route_number_2", self:GetPackedBool("VB"))

    if self:GetPackedBool("VB") then
        local num = self.RouteNumber.Number or "61"

        if IsValid(self.ClientEnts["EMU_route_number_1"]) then 
            self.ClientEnts["EMU_route_number_1"]:SetSkin(tonumber(num[2])) 
        end

        if IsValid(self.ClientEnts["EMU_route_number_2"]) then 
            self.ClientEnts["EMU_route_number_2"]:SetSkin(tonumber(num[1])) 
        end
        
    end

    -- local handrails = self:GetNW2Bool("HandRails")
    local dot5 = self:GetNW2Bool("Dot5")
    local lvz = self:GetNW2Bool("LVZ")
    local mask = true
    local mask22 = false
    self:HidePanel("Battery_C",dot5)
    self:HidePanel("AV_C",dot5)
    self:HidePanel("HelperPanel_C",dot5)
    self:HidePanel("BZOS_C",dot5)
    self:HidePanel("CabVent_C",dot5)
    self:HidePanel("Battery_R",not dot5)
    self:HidePanel("AV_R",not dot5)
    self:HidePanel("CabVent_R",not dot5)
    self:HidePanel("HelperPanel_R",not dot5)
    self:HidePanel("BZOS_R",not dot5)
    -- self:ShowHide("handrails_old",not dot5)
    -- self:ShowHide("handrails_new",dot5)

    
    self:ShowHideSmooth("ecrs_light", self:Animate("ecrslight",self:GetPackedBool("MTLight") and 1 or 0,0,1,16,false))

    local lamps_cab2 = self:Animate("lamps_cab2",self:GetPackedBool("EqLights") and 1 or 0,0,1,5,false)
    local lamps_cab1 = self:Animate("lamps_cab1",self:GetPackedBool("CabLights") and 1 or 0,0,1,5,false)
    self:ShowHideSmooth("Lamps_cab2",dot5 and 0 or lamps_cab2)
    self:ShowHideSmooth("Lamps_cab1",dot5 and 0 or lamps_cab1)
    self:ShowHideSmooth("Lamps2_cab2",dot5 and lamps_cab2 or 0)
    self:ShowHideSmooth("Lamps2_cab1",dot5 and lamps_cab1 or 0)

    local lamps_rtm = self:Animate("lamps_rtm",self:GetPackedBool("VPR") and 1 or 0,0,1,8,false)
    self:SetSoundState("vpr",lamps_rtm>0 and 1 or 0,1)

    -- self:ShowHideSmooth("Lamp_RTM1",not dot5 and lamps_rtm or 0)
    -- self:ShowHideSmooth("Lamp_RTM2",dot5 and lamps_rtm or 0)

    -- self:ShowHide("mask222_mvm",not mask and not lvz and not mask22)
    -- self:ShowHide("mask222_lvz",not mask and lvz and not mask22)
    -- self:ShowHide("mask141_mvm",mask and not mask22)
    -- self:ShowHide("mask22_mvm",mask22 and not mask)
    --self:ShowHide("mask141_lvz",mask and lvz)
    self:ShowHide("1:KVTSet",not lvz)
    self:ShowHide("1:KVTRSet",not lvz)
    self:ShowHide("2:KVTSet",lvz)
    self:ShowHide("2:KVTRSet",lvz)
    self:ShowHideSmooth("Headlights_1",HL1)
    self:ShowHideSmooth("Headlights_2",HL2)
    -- self:ShowHideSmooth("Headlights141_1",(mask and not mask22) and HL1 or 0)
    -- self:ShowHideSmooth("Headlights141_2",(mask and not mask22) and HL2 or 0)
    -- self:ShowHideSmooth("Headlights22_1",(mask22 and not mask) and HL1 or 0)
    -- self:ShowHideSmooth("Headlights22_2",(mask22 and not mask) and HL2 or 0)

    self:Animate("PB",self:GetPackedBool("PB") and 1 or 0,0,0.2,  12,false)
    self:Animate("UAVALever",   self:GetPackedBool("UAVA") and 1 or 0,     0,0.6, 128,  3,false)
    self:Animate("parking_brake",   self:GetPackedBool("ParkingBrake") and 1 or 0,0.25,0,  4,false)
    self:Animate("EPK_disconnect",   self:GetPackedBool("EPK") and 1 or 0,0.25,0,  4,false)
    self:Animate("EPV_disconnect",   self:GetPackedBool("EPK") and 1 or 0,0.25,0,  4,false)
    self:Animate("brake_disconnect",self:GetPackedBool("DriverValveBLDisconnect") and 1 or 0,0.25,0,  4,false)
    self:Animate("train_disconnect",self:GetPackedBool("DriverValveTLDisconnect") and 1 or 0,0.25,0,  4,false)
    self:Animate("valve_disconnect",self:GetPackedBool("DriverValveDisconnect") and 1 or 0,0.25,0,  4,false)
    self:Animate("stopkran",   self:GetPackedBool("EmergencyBrakeValve") and 0 or 1,     0.25,0, 128,  3,false)

    local c013 = self:GetNW2Int("Crane",1)==2
    self:ShowHide("brake_valve_334",not c013)
    self:ShowHide("brake334",not c013)
    self:ShowHide("brake_disconnect",not c013)
    self:ShowHide("train_disconnect",not c013)
    self:HidePanel("DriverValveBLDisconnect",c013)
    self:HidePanel("DriverValveTLDisconnect",c013)
    self:HidePanel("EPKDisconnect",c013)
    self:ShowHide("EPK_disconnect",not c013)
    self:ShowHide("brake_valve_013",c013)
    self:ShowHide("brake013",c013)
    self:ShowHide("valve_disconnect",c013)
    self:ShowHide("EPV_disconnect",c013)
    self:HidePanel("EPVDisconnect",not c013)
    self:HidePanel("DriverValveDisconnect",not c013)

    self:Animate("brake_line",self:GetPackedRatio("BLPressure"),0.143,0.88,256,2)--,0.01)
    self:Animate("train_line",self:GetPackedRatio("TLPressure"),0.143,0.88,256,0)--,0.01)
    self:Animate("brake_cylinder",self:GetPackedRatio("BCPressure"),0.134,0.874,256,0)--,0.03)

    -- self:Animate("voltmeter",self:GetPackedRatio("EnginesVoltage"),0.396,0.658,256,0.2,false)
    self:Animate("volt1",self:GetPackedRatio("BatteryVoltage"),0.625,0.376,256,0.2,false)
    -- self:Animate("ampermeter",self:GetPackedRatio("EnginesCurrent"),0.39,0.655,256,0.2,false)
    self:Animate("new_ampermeter",self:GetPackedRatio("EnginesCurrent"),0.39,0.655,256,0.2,false)
    self:Animate("new_voltmeter",self:GetPackedRatio("EnginesVoltage"),0.396,0.658,256,0.2,false)

    local otsek1 = self:Animate("door_otsek1",self:GetPackedBool("OtsekDoor1") and 1 or 0,0,1,4,0.5)
    local otsek2 = self:Animate("door_otsek2",(self:GetPackedBool("OtsekDoor2") or self.CurrentCamera == 9) and 1 or 0,0,1,4,0.5)
    self:HidePanel("AV_S",not dot5 or otsek2<=0)
    local door1 = self:Animate("door1",self:GetPackedBool("RearDoor") and 1 or 0,0,0.25,4,0.5)
    local door2 = self:Animate("door2",self:GetPackedBool("PassengerDoor") and 1 or 0,1,0.8,4,0.5)
    local door3 = self:Animate("door3",self:GetPackedBool("CabinDoor") and 1 or 0,0,0.25,4,0.5)
    if self.Door1 ~= (door1 > 0) then
        self.Door1 = door1 > 0
        self:PlayOnce("door1","bass",self.Door1 and 1 or 0)
    end
    if self.Door2 ~= (door2 < 1) then
        self.Door2 = door2 < 1
        self:PlayOnce("door2","bass",self.Door2 and 1 or 0)
    end
    if self.Door3 ~= (door3 > 0) then
        self.Door3 = door3 > 0
        self:PlayOnce("door3","bass",self.Door3 and 1 or 0)
    end
    if self.Otsek1 ~= (otsek1 > 0) then
        self.Otsek1 = otsek1 > 0
        if not self.Otsek1 then
            self:PlayOnce("door_otsek1","bass",1)
        end
    end
    if self.Otsek2 ~= (otsek2 > 0) then
        self.Otsek2 = otsek2 > 0
        if not self.Otsek2 then
            self:PlayOnce("door_otsek2","bass",1)
        end
    end
    self:SetLightPower(3,self.Otsek1 and self:GetPackedBool("EqLights"))
    self:SetLightPower(4,self.Otsek2 and self:GetPackedBool("EqLights"))


    self:HidePanel("RRI",otsek2<=0)
    self:HidePanel("RRIScreen",otsek2<=0)
    self:ShowHide("E_informator",otsek2>0)

    for i = 1,12 do
        local colV = self:GetNW2Vector("lamp"..i)
        local col = Color(colV.x,colV.y,colV.z)
        self:ShowHideSmooth("lamp1_"..i,self:Animate("Lamp1_"..i,self:GetPackedBool("lightsActive"..i) and 1 or 0,0,1,6,false),col)
    end

    self:Animate("FrontBrake", self:GetNW2Bool("FbI") and 0 or 1,0,1, 3, false)
    self:Animate("FrontTrain",  self:GetNW2Bool("FtI") and 1 or 0,0,1, 3, false)
    self:Animate("RearBrake",   self:GetNW2Bool("RbI") and 0 or 1,0,1, 3, false)
    self:Animate("RearTrain",   self:GetNW2Bool("RtI") and 1 or 0,0,1, 3, false)

    -- Main switch
    if self.LastGVValue ~= self:GetPackedBool("GV") then
        self.ResetTime = CurTime()+1.5
        self.LastGVValue = self:GetPackedBool("GV")
    end
    self:Animate("gv_wrench",self.LastGVValue and 1 or 0,0.5,0.9,128,1,false)
    self:ShowHideSmooth("gv_wrench",    CurTime() < self.ResetTime and 1 or 0.1)

    --self:InitializeSounds()
    if not self.DoorStates then self.DoorStates = {} end
    if not self.DoorLoopStates then self.DoorLoopStates = {} end
    
    for i=0,3 do
        for k=0,1 do
            local st = k==1 and "DoorL" or "DoorR"
            local doorstate = self:GetPackedBool(st)
            local id,sid = st..(i+1),"door"..i.."x"..k
            local state = self:GetPackedRatio(id)
            if (state ~= 1 and state ~= 0) ~= self.DoorStates[id] then
                if doorstate and state < 1 or not doorstate and state > 0 then
                else
                    if state > 0 then
                        self:PlayOnce(sid.."o","",1,math.Rand(0.8,1.2))
                    else
                        self:PlayOnce(sid.."c","",1,math.Rand(0.8,1.2))
                    end
                end
                self.DoorStates[id] = (state ~= 1 and state ~= 0)
            end
            if (state ~= 1 and state ~= 0) then
                self.DoorLoopStates[id] = math.Clamp((self.DoorLoopStates[id] or 0) + 2*self.DeltaTime,0,1)
            else
                self.DoorLoopStates[id] = math.Clamp((self.DoorLoopStates[id] or 0) - 6*self.DeltaTime,0,1)
            end
            self:SetSoundState(sid.."r",self.DoorLoopStates[id],0.8+self.DoorLoopStates[id]*0.2)
            local n_l = "door"..i.."x"..k--.."a"
            --local n_r = "door"..i.."x"..k.."b"
            local dlo = 1
            if self.Anims[n_l] then
                dlo = math.abs(state-(self.Anims[n_l] and self.Anims[n_l].oldival or 0))
                if dlo <= 0 and self.Anims[n_l].oldspeed then dlo = self.Anims[n_l].oldspeed/14 end
            end
            
            self:Animate(n_l,state,0,0.95,dlo*14,false)--0.8 + (-0.2+0.4*math.random()),0)
            --self:Animate(n_r,state,0,1,dlo*14,false)--0.8 + (-0.2+0.4*math.random()),0)
        end
    end

    local dT = self.DeltaTime
    local rollingi = math.min(1,self.TunnelCoeff+math.Clamp((self.StreetCoeff-0.82)/0.3,0,1))
    local rollings = math.max(self.TunnelCoeff*0.6,self.StreetCoeff)
    local speed = self:GetPackedRatio("Speed")*100.0
    local rol5 = math.Clamp(speed/1,0,1)*(1-math.Clamp((speed-3)/8,0,1))
    local rol10 = math.Clamp(speed/12,0,1)*(1-math.Clamp((speed-25)/8,0,1))
    local rol40p = Lerp((speed-25)/12,0.6,1)
    local rol40 = math.Clamp((speed-23)/8,0,1)*(1-math.Clamp((speed-55)/8,0,1))
    local rol40p = Lerp((speed-23)/50,0.6,1)
    local rol70 = math.Clamp((speed-50)/8,0,1)*(1-math.Clamp((speed-72)/5,0,1))
    local rol70p = Lerp(0.8+(speed-65)/25*0.2,0.8,1.2)
    local rol80 = math.Clamp((speed-70)/5,0,1)
    local rol80p = Lerp(0.8+(speed-72)/15*0.2,0.8,1.2)
    self:SetSoundState("rolling_5",math.min(1,rollingi*(1-rollings)+rollings*0.8)*rol5,1)
    self:SetSoundState("rolling_10",rollingi*rol10,1)
    self:SetSoundState("rolling_40",rollingi*rol40,rol40p)
    self:SetSoundState("rolling_70",rollingi*rol70,rol70p)
    self:SetSoundState("rolling_80",rollingi*rol80,rol80p)

    local rol10 = math.Clamp(speed/15,0,1)*(1-math.Clamp((speed-18)/35,0,1))
    local rol10p = Lerp((speed-15)/14,0.6,0.78)
    local rol40 = math.Clamp((speed-18)/35,0,1)*(1-math.Clamp((speed-55)/40,0,1))
    local rol40p = Lerp((speed-15)/66,0.6,1.3)
    local rol70 = math.Clamp((speed-55)/20,0,1)--*(1-math.Clamp((speed-72)/5,0,1))
    local rol70p = Lerp((speed-55)/27,0.78,1.15)
    --local rol80 = math.Clamp((speed-70)/5,0,1)
    --local rol80p = Lerp(0.8+(speed-72)/15*0.2,0.8,1.2)
    self:SetSoundState("rolling_low"    ,rol10*rollings,rol10p) --15
    self:SetSoundState("rolling_medium2",rol40*rollings,rol40p) --57
    --self:SetSoundState("rolling_medium1",0 or rol40*rollings,rol40p) --57
    self:SetSoundState("rolling_high2"  ,rol70*rollings,rol70p) --70

    self.ReleasedPdT = math.Clamp(self.ReleasedPdT + 2*(-self:GetPackedRatio("BrakeCylinderPressure_dPdT",0)-self.ReleasedPdT)*dT,0,1)
    local release1 = math.Clamp((self.ReleasedPdT-0.1)/0.8,0,1)^2
    self:SetSoundState("release1",release1,1)
    self:SetSoundState("release2",(math.Clamp(0.3-release1,0,0.3)/0.3)*(release1/0.3),1.0)
    local parking_brake = self:GetPackedRatio("ParkingBrakePressure_dPdT",0)
    local parking_brake_abs = math.Clamp(math.abs(parking_brake)-0.3,0,1)
    if self.ParkingBrake1 ~= (parking_brake<1) then
        self.ParkingBrake1 = (parking_brake<1)
        if self.ParkingBrake1 then self:PlayOnce("parking_brake_en","bass",1,1) end
    end
    if self.ParkingBrake2 ~= (parking_brake>-0.8) then
        self.ParkingBrake2 = (parking_brake>-0.8)
        if self.ParkingBrake2 then self:PlayOnce("parking_brake_rel","bass",0.6,1) end
    end
    self:SetSoundState("parking_brake",parking_brake_abs,1)
    self.FrontLeak = math.Clamp(self.FrontLeak + 10*(-self:GetPackedRatio("FrontLeak")-self.FrontLeak)*dT,0,1)
    self.RearLeak = math.Clamp(self.RearLeak + 10*(-self:GetPackedRatio("RearLeak")-self.RearLeak)*dT,0,1)
    self:SetSoundState("front_isolation",self.FrontLeak,0.9+0.2*self.FrontLeak)
    self:SetSoundState("rear_isolation",self.RearLeak,0.9+0.2*self.RearLeak)


    local ramp = self:GetPackedRatio("Crane_dPdT",0)
    if c013 then
        if ramp > 0 then
            self.CraneRamp = self.CraneRamp + ((0.2*ramp)-self.CraneRamp)*dT
        else
            self.CraneRamp = self.CraneRamp + ((0.9*ramp)-self.CraneRamp)*dT
        end
        self.CraneRRamp = math.Clamp(self.CraneRRamp + 1.0*((1*ramp)-self.CraneRRamp)*dT,0,1)
        self:SetSoundState("crane334_brake",0,1.0)
        self:SetSoundState("crane334_brake_reflection",0,1.0)
        self:SetSoundState("crane334_brake_slow",0,1.0)
        self:SetSoundState("crane334_release",0,1.0)
        self:SetSoundState("crane013_release",self.CraneRRamp^1.5,1.0)
        self:SetSoundState("crane013_brake",math.Clamp(-self.CraneRamp*1.5-0.1,0,1)^1.3,1.0)
        local loudV = self:GetNW2Float("Crane013Loud",0)
        if loudV>0 then
            if ramp>0 then
                self.CraneLRamp = self.CraneLRamp + (math.min(ramp,0)-self.CraneLRamp)*dT*0.5
            else
                self.CraneLRamp = self.CraneLRamp + (math.min(ramp,0)-self.CraneLRamp)*dT*1
            end
            self:SetSoundState("crane013_brake_l",(math.Clamp(-self.CraneRamp*2.5-0.1,0,1)^1.3)*(1-math.Clamp((-self.CraneLRamp-loudV)*3,0,1)),1.12-math.Clamp((-self.CraneLRamp-0.15)*2,0,1)*0.12)
        else
            self:SetSoundState("crane013_brake_l",0,1)
        end
        self:SetSoundState("crane013_brake2",math.Clamp(-self.CraneRamp*1.5-0.95,0,1.5)^2,1.0)
    else
        self:SetSoundState("crane013_brake",0,1.0)
        self:SetSoundState("crane013_release",0,1.0)
        --self:SetSoundState("crane013_brake2",0,1.0)

        self.CraneRamp = math.Clamp(self.CraneRamp + 8.0*((1*self:GetPackedRatio("Crane_dPdT",0))-self.CraneRamp)*dT,-1,1)

        self:SetSoundState("crane334_brake_low",math.Clamp((-self.CraneRamp)*2,0,1)^2,1)
        local high = math.Clamp(((-self.CraneRamp)-0.5)/0.5,0,1)^1
        self:SetSoundState("crane334_brake_high",high,1.0)
        self:SetSoundState("crane013_brake2",high*2,1.0)
        self:SetSoundState("crane334_brake_eq_high",--[[ math.Clamp(-self.CraneRamp*0,0,1)---]] math.Clamp(-self:GetPackedRatio("ReservoirPressure_dPdT")-0.2,0,1)^0.8*1,1)
        self:SetSoundState("crane334_brake_eq_low",--[[ math.Clamp(-self.CraneRamp*0,0,1)---]] math.Clamp(-self:GetPackedRatio("ReservoirPressure_dPdT")-0.4,0,1)^0.8*1.3,1)

        self:SetSoundState("crane334_release",math.Clamp(self.CraneRamp,0,1)^2,1.0)
    end
    local emergencyValveEPK = self:GetPackedRatio("EmergencyValveEPK_dPdT",0)
    self.EmergencyValveEPKRamp = math.Clamp(self.EmergencyValveEPKRamp + 1.0*((0.5*emergencyValveEPK)-self.EmergencyValveEPKRamp)*dT,0,1)
    if self.EmergencyValveEPKRamp < 0.01 then self.EmergencyValveEPKRamp = 0 end
    self:SetSoundState("epk_brake",self.EmergencyValveEPKRamp,1.0)

--[[
    local emergencyBrakeValve = self:GetPackedRatio("EmergencyBrakeValve_dPdT", 0)
    self.EmergencyBrakeValveRamp = math.Clamp(self.EmergencyBrakeValveRamp + (emergencyBrakeValve-self.EmergencyBrakeValveRamp)*dT*8,0,1)
    --self:SetSoundState("valve_brake",self.EmergencyBrakeValveRamp,0.8+math.min(0.4,self.EmergencyBrakeValveRamp*0.8))
    local emerBrakeValve = self.EmergencyBrakeValveRamp
    self:SetSoundState("valve_brake_l",math.Clamp(emerBrakeValve/0.2,0,1),1)
    self:SetSoundState("valve_brake_m",math.Clamp((emerBrakeValve-0.2)/0.3,0,1),1)
    self:SetSoundState("valve_brake_h",math.Clamp((emerBrakeValve-0.5)/0.5,0,1),1)
--]]
    local emergencyBrakeValve = self:GetPackedRatio("EmergencyBrakeValve_dPdT", 0)
    self.EmergencyBrakeValveRamp = math.Clamp(self.EmergencyBrakeValveRamp + (emergencyBrakeValve-self.EmergencyBrakeValveRamp)*dT*8,0,1)
    self:SetSoundState("valve_brake",self.EmergencyBrakeValveRamp,0.8+math.min(0.4,self.EmergencyBrakeValveRamp*0.8))

    local emergencyValve = self:GetPackedRatio("EmergencyValve_dPdT", 0)^0.4*1.2
    self.EmergencyValveRamp = math.Clamp(self.EmergencyValveRamp + (emergencyValve-self.EmergencyValveRamp)*dT*16,0,1)
    local emer_brake = math.Clamp((self.EmergencyValveRamp-0.9)/0.05,0,1)
    local emer_brake2 = math.Clamp((self.EmergencyValveRamp-0.2)/0.4,0,1)*(1-math.Clamp((self.EmergencyValveRamp-0.9)/0.1,0,1))
    self:SetSoundState("emer_brake",emer_brake,1)
    self:SetSoundState("emer_brake2",emer_brake2,math.min(1,0.8+0.2*emer_brake2))
    --self:SetSoundState("emer_brake",self.EmergencyValveRamp*0.8,1)
    --self:SetSoundState("emer_brake",self.EmergencyValveRamp*0.8,1)
    -- Compressor
    self:SetSoundState("compressor",self:GetPackedBool("Compressor") and 0.6 or 0,1)
    self:SetSoundState("compressor2",self:GetPackedBool("Compressor") and 0.8 or 0,1)



    local v1state = self:GetPackedBool("M1_3") and 1 or 0
    local v2state = self:GetPackedBool("M4_7") and 1 or 0
    local vCstate = self:GetPackedRatio("M8")/2
    if self.VentCab < vCstate then
        self.VentCab = math.min(1,self.VentCab + dT/2.7)
    elseif self.VentCab > vCstate then
        self.VentCab = math.max(0,self.VentCab - dT/2.7)
    end
    self.VentG1 = math.Clamp(self.VentG1 + dT/2.7*(v1state*2-1),0,1)
    self.VentG2 = math.Clamp(self.VentG2 + dT/2.7*(v2state*2-1),0,1)
    self:SetSoundState("vent_cabl",math.Clamp(self.VentCab*2,0,1) ,1)
    self:SetSoundState("vent_cabh",math.Clamp((self.VentCab-0.5)*2,0,1),1)

    for i=1,7 do
        if i<4 then
            self:SetSoundState("vent"..i,self.VentG1,1)
        else
            self:SetSoundState("vent"..i,self.VentG2,1)
        end
    end
    if self.RingType ~= self:GetNW2Int("RingType",1) then
        self.RingType = self:GetNW2Int("RingType",1)
        self:SetSoundState(self.RingName,0,0)

        self.RingPitch = 1
        self.RingVolume = 1
        if self.RingType == 1 then
            self.RingName = "ring2"
        elseif self.RingType == 2 then
            self.RingName = "ring3"
            self.RingVolume = 1.4
            self.RingPitch = 0.6
        elseif self.RingType == 3 then
            self.RingName = "ring3"
            self.RingVolume = 1.2
            self.RingPitch = 0.8
        elseif self.RingType == 4 then
            self.RingName = "ring3"
            self.RingPitch = 0.95
        elseif self.RingType == 5 then
            self.RingName = "ring"
            self.RingPitch = 0.8
        elseif self.RingType == 6 then
            self.RingName = "ring"
        elseif self.RingType == 7 then
            self.RingName = "ring4"
        elseif self.RingType == 8 then
            self.RingName = "ring5"
        elseif self.RingType == 9 then
            self.RingName = "ring6"
        end
        self.RingFade = 0
    end
    -- ARS/ringer alert
    local bzos = self.RingName=="ring" or self.RingName=="ring6" or self.RingName=="ring3" and RealTime()%0.8<0.35 or self.RingName~="ring3" and RealTime()%0.5>0.25
    local ringstate = (self:GetPackedBool("Buzzer") or self:GetPackedBool("BuzzerBZOS") and bzos) and 1 or 0
    if 6< self.RingType and self.RingType < 9 then
        self.RingFade = math.Clamp(self.RingFade+(ringstate-self.RingFade)*dT*(self:GetPackedBool("BuzzerBZOS") and 50 or 25),0,1)
        self:SetSoundState(self.RingName,self.RingFade*self.RingVolume,self.RingPitch)
    else
        self:SetSoundState(self.RingName,ringstate*self.RingVolume,self.RingPitch)
    end
    if self:GetPackedBool("RK") then self.RKTimer = CurTime() end
    self:SetSoundState("rk",(self.RKTimer and (CurTime() - self.RKTimer) < 0.2) and 0.7 or 0,1)

    -- BPSN sound
    self.BPSNType = self:GetNW2Int("BPSNType",13)
    if not self.OldBPSNType then self.OldBPSNType = self.BPSNType end
    if self.BPSNType ~= self.OldBPSNType then
        for i=1,12 do
            self:SetSoundState("bpsn"..i,0,1.0)
        end
    end
    self.OldBPSNType = self.BPSNType
    if self.BPSNType<13 then
        self:SetSoundState("bpsn"..self.BPSNType,self:GetPackedBool("BPSN") and 1 or 0,1) --FIXME ?????????????????? ???? ??????????????
    end

    local cabspeaker = self:GetPackedBool("AnnCab")
    local work = self:GetPackedBool("AnnPlay")
    local buzz = self:GetPackedBool("AnnBuzz") and self:GetNW2Bool("AnnouncerBuzz")
    for k in ipairs(self.AnnouncerPositions) do
        self:SetSoundState("announcer_buzz"..k,(buzz and (k ~= 1 and work or k==1 and cabspeaker)) and 1 or 0,1)
    end
    for k,v in ipairs(self.AnnouncerPositions) do
        if self.Sounds["announcer"..k] and IsValid(self.Sounds["announcer"..k]) then
            self.Sounds["announcer"..k]:SetVolume((k ~= 1 and work or k==1 and cabspeaker) and (v[3] or 1)  or 0)
        end
    end
end

surface.CreateFont("Metrostroi_717_NN_RouteNumber", {
	font = "Advanced LED Board-7", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 135,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = false,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont("Metrostroi_717_NN_LastStation", {
	font = "DS Dots", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 78,
	weight = 100,
	blursize = 0,
	scanlines = 0,
	antialias = false,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

function ENT:Draw()
    self.BaseClass.Draw(self)
end
function ENT:DrawPost(special)
    --local dc = render.GetLightColor(self:LocalToWorld(Vector(460.0,0.0,5.0)))



    local distance = self:GetPos():Distance(LocalPlayer():GetPos())

    if distance < 4096 and self:GetNW2Bool("VB", false) then
        self:DrawOnPanel("LastStationScreen", function(...)
            draw.NoTexture()

            local str = self:GetNW2String("LastStation", "??????????????")

            surface.SetFont("Metrostroi_717_NN_LastStation")

            local w, h = surface.GetTextSize(str)

            surface.SetTextPos(-w/2, 0)
            surface.SetTextColor(0,255,0)
            surface.DrawText(str)
        end)

        self:DrawOnPanel("RouteNumberScreen", function(...)
            draw.NoTexture()

            local str = self.RouteNumber.Number or "61"

            surface.SetFont("Metrostroi_717_NN_RouteNumber")

            local w, h = surface.GetTextSize(str)

            surface.SetTextPos(-w/2, 0)
            surface.SetTextColor(0,255,0)
            surface.DrawText(str)
        end)

    end

    if distance > 1024 or special then return end

    self.RTMaterial:SetTexture("$basetexture",self.RRIScreen)
    self:DrawOnPanel("RRIScreen",function(...)
        surface.SetMaterial(self.RTMaterial)
        surface.SetDrawColor(255,255,255)
        surface.DrawTexturedRectRotated(64,64,128,128,0)
    end)
    self.RTMaterial:SetTexture("$basetexture",self.IGLA)
    self:DrawOnPanel("IGLA",function(...)
        surface.SetMaterial(self.RTMaterial)
        surface.SetDrawColor(255,255,255)
        surface.DrawTexturedRectRotated(256,64,512,128,0)
    end)

    
	self.RTMaterial:SetTexture("$basetexture", self.ECRSScr)
    self:DrawOnPanel("ECRSScreen",function(...)
        surface.SetMaterial(self.RTMaterial)
        surface.SetDrawColor(255,255,255)
        surface.DrawTexturedRectRotated(128,178,256,340,0)
    end)    

    self:DrawOnPanel("AirDistributor",function()
        draw.DrawText(self:GetNW2Bool("AD") and "Air Distributor ON" or "Air Distributor OFF","Trebuchet24",0,0,Color(0,0,0,255))
    end)
end

function ENT:OnButtonPressed(button)
    if button == "PrevSign" then
        self.InfoTableTimeout = CurTime() + 2.0
    end
    if button == "NextSign" then
        self.InfoTableTimeout = CurTime() + 2.0
    end

    if button and button:sub(1,3) == "Num" then
        self.InfoTableTimeout = CurTime() + 2.0
    end
end

function ENT:OnPlay(soundid,location,range,pitch)
    if location == "stop" then
        if IsValid(self.Sounds[soundid]) then
            self.Sounds[soundid]:Pause()
            self.Sounds[soundid]:SetTime(0)
        end
        return
    end
    if location == "bass" then
        if soundid == "VDOL" then
            return range > 0 and "vdol_on" or "vdol_off",location,1,pitch
        end
        if soundid == "VDOP" then
            return range > 0 and "vdor_on" or "vdor_off",location,1,pitch
        end
        if soundid == "VDZ" then
            return range > 0 and "vdz_on" or "vdz_off",location,1,pitch
        end
        if soundid:sub(1,4) == "IGLA" then
            return range > 0 and "igla_on" or "igla_off",location,1,pitch
        end
        if soundid == "LK2" then
            local speed = self:GetPackedRatio("Speed")
            local id = range > 0 and "lk2_on" or "lk2_off"
            self.SoundPositions[id][1] = 350-Lerp(speed/0.1,0,250)
            return id,location,1-Lerp(speed/10,0.2,0.8),pitch
        end
        if soundid == "LK3" then
            local speed = self:GetPackedRatio("Speed")
            local id = range > 0 and "lk3_on" or "lk3_off"
            self.SoundPositions[id][1] = 350-Lerp(speed/0.1,0,250)
            return id,location,1-Lerp(speed/10,0.2,0.8),pitch
        end
        if soundid == "LK5" and range > 0 then
            local speed = self:GetPackedRatio("Speed")
            self.SoundPositions["lk5_on"][1] = 350-Lerp(speed/0.1,0,250)
            return "lk5_on",location,1-Lerp(speed/10,0.2,0.8),pitch
        end
        if soundid == "brake" then
            self:PlayOnce("brake_f",location,range,pitch)
            self:PlayOnce("brake_b",location,range,pitch)
            return
        end
        if soundid == "RVT" then
            return range > 0 and "rvt_on" or "rvt_off",location,1,pitch
        end
        if soundid == "K6" then
            return range > 0 and "k6_on" or  "k6_off",location,1,pitch
        end
        if soundid == "R1_5" then
            return range > 0 and "r1_5_on" or "r1_5_off",location,1,pitch
        end
        if soundid == "RPB" then
            return range > 0 and "rpb_on" or "rpb_off",location,1,pitch
        end
        if soundid == "KD" then
            return range > 0 and "kd_on" or "kd_off",location,1,pitch
        end
        if soundid == "KK" then
            return range > 0 and "kk_on" or "kk_off",location,1,pitch--0.8
        end
        if soundid == "K25" then
            return range > 0 and "k25_on" or "k25_off",location,1,pitch
        end
        if soundid == "RO" then
            return range > 0 and "ro_on" or "ro_off",location,1,pitch
        end
        if soundid == "Rp8" then
            return range > 0 and "rp8_on" or "rp8_off",location,1,pitch
        end
        if soundid == "ROT1" then
            return range > 0 and "rot_on" or "rot_off",location,1,pitch
        end
        if soundid == "ROT2" then
            return range > 0 and "rot_on" or "rot_off",location,1,pitch
        end
        if soundid == "AVU" then
            return range > 0 and "avu_on" or "avu_off",location,1,0.9
        end
    elseif soundid:sub(1,4)=="kv70" and self:GetNW2Bool("SecondKV") then return soundid.."_2",location,range,pitch end
    return soundid,location,range,pitch
end
Metrostroi.GenerateClientProps()
