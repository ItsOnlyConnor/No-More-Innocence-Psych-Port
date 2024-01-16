
function onEvent(eventName, value1, value2, strumTime)
    if eventName == 'Set Game Zoom' then
        doTweenZoom("zoomGame", "camGame", value1, value2, "sineInOut")
        setProperty("defaultCamZoom", value1, false)
    end
end