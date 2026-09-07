local M = {}

function HandleServerTimer(data)
    local timer = tostring(data.timer_val)
    log("I", "TrafficLightsClient", "Received timer value: " .. timer)
    core_trafficSignals.setTimer(tonumber(timer))
end

function LoadedExtension()
    AddEventHandler("t_LightSync", HandleServerTimer)
    log("I", "TrafficLightsClient", "Traffic Lights Sync loaded on client side")

	return
end

M.onExtensionLoaded = LoadedExtension
M.Init = function ()
	setExtensionUnloadMode(M, 'manual')
end


return M
