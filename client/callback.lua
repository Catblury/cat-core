--//#    CALLBACK STUFF  #\\--

CAT_CORE.Callback = {}
CAT_CORE.Callback.Functions = {}
CAT_CORE.Callback.ServerCallbacks = {}
CAT_CORE.Callback.ClientCallbacks = {}

function CAT_CORE.Callback.Functions.TriggerCallback(name, cb, ...)
    CAT_CORE.Callback.ServerCallbacks[name] = cb
    TriggerServerEvent('cat-core:Server:TriggerCallback', name, ...)
end

RegisterNetEvent('cat-core:Client:TriggerCallback', function(name, ...)
    if CAT_CORE.Callback.ServerCallbacks[name] then
        CAT_CORE.Callback.ServerCallbacks[name](...)
        CAT_CORE.Callback.ServerCallbacks[name] = nil
    end
end)

--//#                     #\\--