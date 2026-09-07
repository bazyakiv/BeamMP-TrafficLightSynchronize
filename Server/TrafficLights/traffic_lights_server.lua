local t_Timer = MP.CreateTimer()
function onInit()
    MP.RegisterEvent("tLight_sync", "Update_tLight")
    MP.CreateEventTimer("tLight_sync", 6000)
    print("Traffic Lights Plugin has loaded, timer created.")
end

function  Update_tLight()
    if MP.GetPlayerCount() >= 1 then
        local data = {
            timer_val = t_Timer:GetCurrent()
        }

        MP.TriggerClientEventJson(-1., "t_LightSync", data)
        print("Sent traffic light sync data to all clients.")
    end
end
