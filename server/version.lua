CAT_CORE.Functions.GetVersionScript = function(CURRENT_VERSION, SCRIPT_NAME)
    PerformHttpRequest("https://raw.githubusercontent.com/CatbluryOP/cat-core/main/versions.json", function (_, data, __)
        if data ~= nil then
            local SCRIPT_LIST = json.decode(data)
            for _, value in pairs ( SCRIPT_LIST ) do 
                if value.name == SCRIPT_NAME then
                    print("[cat-core] " .. SCRIPT_NAME .. " checking started.")
                    Citizen.Wait(500)
                    if value.version == CURRENT_VERSION then
                        print("[cat-core] " ..SCRIPT_NAME.. " version is latest\n[cat-core] Version name " .. value.version_name..".\n".."[cat-core] " .. value.version_desc..".")
                    else
                        print("[cat-core] " ..SCRIPT_NAME.. " is outdated, needs to be updated!\n[cat-core] Latest version is " .. value.version .. ".")
                    end
                end
            end
        else
            print("[cat-core] Versions cannot accessiable. Wait do not distrub dev, it\'s will pass soon!")
        end
    end)
end

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    CAT_CORE.Functions.GetVersionScript(CAT_CORE.Config.VERSION, "cat-core")
end)

exports("CheckVersion", CAT_CORE.Functions.GetVersionScript)
