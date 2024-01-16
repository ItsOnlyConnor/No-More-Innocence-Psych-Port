local enabled = false
local int1 = 0
local int2 = 0
function onEvent(eventName, value1, value2, strumTime)
    if eventName == 'Zoom On Beat Hit' then
        int1 = value1
        int2 = value2
    end
end

function onBeatHit()
        triggerEvent("Add Camera Zoom", int1, int2)
end