local M = {}

function HandleServerTimer(timerStr)
    if timerStr then
        local numTimer = tonumber(timerStr)
        log("I", "TrafficLightsClient", "Received timer value: " .. tostring(numTimer))
        core_trafficSignals.setTimer(numTimer)
    else
         log("W", "TrafficLightsClient", "Received timer value is nil")
    end

end

function LoadedExtension()
    AddEventHandler("t_LightSync", HandleServerTimer)
    log("I", "TrafficLightsClient", "Traffic Lights Sync loaded on client side")

	return
end

M.onExtensionLoaded = LoadedExtension
M.onInit = function ()
	setExtensionUnloadMode(M, 'manual')
end


return M
