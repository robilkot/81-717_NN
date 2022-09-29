NN_717 = NN_717 or {}

if SERVER then
    util.AddNetworkString("nn_717_print_console")

    file.CreateDir("nn_717")

    function NN_717.AddLast(name)
        table.insert(NN_717.Lasts, name)
    end
    function NN_717.AddGlobalLast(name)
        table.insert(NN_717.GlobalLasts, name)
    end
    function NN_717.AddMapLast(name)
        table.insert(NN_717.MapLasts, name)
    end

    function NN_717.LoadDefault()
        NN_717.Lasts = {}

        NN_717.AddLast("ОБКАТКА")
        NN_717.AddLast("ПЕРЕГОНКА")

        NN_717.AddLast("БУРЕВЕСТНИК")
        NN_717.AddLast("ГОРЬКОВСКАЯ")

        NN_717.AddLast("СТРЕЛКА")
        NN_717.AddLast("ПАРК КУЛЬТУРЫ")
    end

    local function getFilename()
        local map = game.GetMap()
        return Format("nn_717/lasts_%s.txt", map)
    end

    function NN_717.SaveGlobalLasts()
        file.Write("nn_717/global_lasts.txt", util.TableToJSON(NN_717.GlobalLasts))
    end

    function NN_717.SaveMapLasts()
        file.Write(getFilename(), util.TableToJSON(NN_717.MapLasts))
    end

    function NN_717.LoadGlobalLasts()
        NN_717.GlobalLasts = {}

        if file.Exists("nn_717/global_lasts.txt", "DATA") then
            NN_717.GlobalLasts = util.JSONToTable(file.Read("nn_717/global_lasts.txt", "DATA"))
        else
            NN_717.SaveGlobalLasts()
        end
    end

    function NN_717.LoadMapLasts()
        NN_717.MapLasts = {}

        if file.Exists(getFilename(), "DATA") then
            NN_717.MapLasts = util.JSONToTable(file.Read(getFilename(), "DATA"))
        else
            NN_717.SaveMapLasts()
        end
    end

    function NN_717.RecreateList()
        for k, v in pairs(NN_717.GlobalLasts) do
            NN_717.AddLast(v)
        end
        for k, v in pairs(NN_717.MapLasts) do
            NN_717.AddLast(v)
        end
    end

    function NN_717.LoadLasts()
        NN_717.LoadDefault()
        NN_717.LoadGlobalLasts()
        NN_717.LoadMapLasts()

        NN_717.RecreateList()
    end

    NN_717.LoadLasts()

    local function printPly(ply, str)
        if IsValid(ply) then
            net.Start("nn_717_print_console")
            net.WriteString(str)
            net.Send(ply)
        else
            print(str)
        end
    end

    concommand.Add("nn_717_show_global_lasts", function(ply, cmd, args)
        if IsValid(ply) and not ply:IsAdmin() then return end

        local lines = {"Список глобальных конечных [" .. #NN_717.GlobalLasts .. "]:"}

        for k, v in pairs(NN_717.GlobalLasts) do
            table.insert(lines, Format("[%d] - '%s'", k, v))
        end

        printPly(ply, table.concat(lines, "\n"))
    end)

    concommand.Add("nn_717_show_map_lasts", function(ply, cmd, args)
        if IsValid(ply) and not ply:IsAdmin() then return end

        local lines = {"Список конечных на карте [" .. #NN_717.MapLasts .. "]:"}

        for k, v in pairs(NN_717.MapLasts) do
            table.insert(lines, Format("[%d] - '%s'", k, v))
        end

        printPly(ply, table.concat(lines, "\n"))
    end)

    concommand.Add("nn_717_add_global_last", function(ply, cmd, args, last)
        if IsValid(ply) and not ply:IsAdmin() then return end

        if last == "" then
            printPly(ply, "Укажите название конечной!")
            return
        end

        NN_717.AddGlobalLast(last)

        NN_717.SaveGlobalLasts()

        NN_717.LoadLasts()

        printPly(ply, "Конечная \"" .. last .. "\" успешно добавлена!")
    end)

    concommand.Add("nn_717_del_global_last", function(ply, cmd, args, last)
        if IsValid(ply) and not ply:IsAdmin() then return end

        local index = tonumber(args[1])

        if not index then
            printPly(ply, "Укажите индекс конечной! его можно найти в nn_717_show_global_lasts")
            return
        end

        if not NN_717.GlobalLasts[index] then
            printPly(ply, "Такой конечной не существует!")
            return
        end

        printPly(ply, "Конечная \"" .. NN_717.GlobalLasts[index] .. "\" успешно удалена!")

        NN_717.GlobalLasts[index] = nil

        NN_717.SaveGlobalLasts()

        NN_717.LoadLasts()
    end)

    concommand.Add("nn_717_add_map_last", function(ply, cmd, args, last)
        if IsValid(ply) and not ply:IsAdmin() then return end

        if last == "" then
            printPly(ply, "Укажите название конечной!")
            return
        end

        NN_717.AddMapLast(last)

        NN_717.SaveMapLasts()

        NN_717.LoadLasts()

        printPly(ply, "Конечная \"" .. last .. "\" успешно добавлена!")
    end)

    concommand.Add("nn_717_del_map_last", function(ply, cmd, args, last)
        if IsValid(ply) and not ply:IsAdmin() then return end

        local index = tonumber(args[1])

        if not index then
            printPly(ply, "Укажите индекс конечной! его можно найти в nn_717_show_global_lasts")
            return
        end

        if not NN_717.MapLasts[index] then
            printPly(ply, "Такой конечной не существует!")
            return
        end

        printPly(ply, "Конечная \"" .. NN_717.MapLasts[index] .. "\" успешно удалена!")

        NN_717.MapLasts[index] = nil

        NN_717.SaveMapLasts()

        NN_717.LoadLasts()
    end)
else
    net.Receive("nn_717_print_console", function()
        local str = net.ReadString()
        print(str)
    end)
end