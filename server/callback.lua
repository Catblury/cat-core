--//#    CALLBACK STUFF  #\\--

CAT_CORE.Callback = {}
CAT_CORE.Callback.Functions = {}
CAT_CORE.Callback.ServerCallbacks = {}

CAT_CORE.Callback.Functions.CreateCallback = function(name, cb)
    CAT_CORE.Callback.ServerCallbacks[name] = cb
end

CAT_CORE.Callback.Functions.TriggerCallback = function(name, source, cb, ...)
    local src = source
    if CAT_CORE.Callback.ServerCallbacks[name] then
        CAT_CORE.Callback.ServerCallbacks[name](src, cb, ...)
    end
end


RegisterNetEvent('cat-core:Server:TriggerCallback', function(name, ...)
    local src = source
    CAT_CORE.Callback.Functions.TriggerCallback(name, src, function(...)
        TriggerClientEvent('cat-core:Client:TriggerCallback', src, name, ...)
    end, ...)
end)

--//#                     #\\--


