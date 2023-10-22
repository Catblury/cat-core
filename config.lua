CAT_CORE_CONFIG = { }

CAT_CORE_CONFIG.VERSION = "1.0.2"

CAT_CORE_CONFIG.Reputation = {
    ["1"] = 480,
    ["2"] = 920,
    ["3"] = 1240,
    ["4"] = 1950,
    ["5"] = 2300,

    ["6"] = 3040,
    ["7"] = 3980,
    ["8"] = 4400,
    ["9"] = 4920,
    ["10"] = 5400,
}




CAT_CORE_CONFIG.FRAMEWORK = "QB"

CAT_CORE_CONFIG.EVENTS = {
    PlayerLoaded = {
        ["ESX"] = "esx:playerLoaded",
        ["QB"] = "QBCore:Server:PlayerLoaded",
    },
}

CAT_CORE_CONFIG.DATABASE_NAME = "mysql-async"

CAT_CORE_CONFIG.DATABASE                         = function(plugin,type,query,var)
    local wait = promise.new()
    if type == 'fetchAll' and plugin == 'mysql-async' then
        MySQL.Async.fetchAll(query, var, function(result)
            wait:resolve(result)
        end)
    end
    if type == 'execute' and plugin == 'mysql-async' then
        MySQL.Async.execute(query, var, function(result)
            wait:resolve(result)
        end)
    end
    if type == 'execute' and plugin == 'ghmattisql' then
        exports['ghmattimysql']:execute(query, var, function(result)
            wait:resolve(result)
        end)
    end
    if type == 'fetchAll' and plugin == 'ghmattisql' then
        exports.ghmattimysql:execute(query, var, function(result)
            wait:resolve(result)
        end)
    end
    if type == 'execute' and plugin == 'oxmysql' then
        exports.oxmysql:query(query, var, function(result)
            wait:resolve(result)
        end)
    end
    if type == 'fetchAll' and plugin == 'oxmysql' then
        exports.oxmysql:query(query, var, function(result)
            wait:resolve(result)
        end)
    end
    return Citizen.Await(wait)
end