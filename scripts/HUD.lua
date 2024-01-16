local enabled = false




function onCreate()
    

    if middlescroll == false then
        defaultMiddleScroll = false
        setPropertyFromClass('backend.ClientPrefs', 'data.middleScroll', true)
    end
end

function onCreatePost()
    for i = 0, 3 do
        setPropertyFromGroup('strumLineNotes', i, 'x', 10000)
    end
end

function onDestroy()
    if defaultMiddleScroll == false then
        setPropertyFromClass('backend.ClientPrefs', 'data.middleScroll', false)
    end
end


function onSectionHit()
    if curSection == 109 then
        enabled = true
    end
    if enabled == true then
        if mustHitSection then
            noteTweenAlpha("tweenIn1", 4, 1, 0.2, "quadIn")
            noteTweenAlpha("tweenIn2", 5, 1, 0.2, "quadIn")
            noteTweenAlpha("tweenIn3", 6, 1, 0.2, "quadIn")
            noteTweenAlpha("tweenIn4", 7, 1, 0.2, "quadIn")
        else
            noteTweenAlpha("tweenOut1", 4, 0.5, 0.4, "quadOut")
            noteTweenAlpha("tweenOut2", 5, 0.5, 0.4, "quadOut")
            noteTweenAlpha("tweenOut3", 6, 0.5, 0.4, "quadOut")
            noteTweenAlpha("tweenOut4", 7, 0.5, 0.4, "quadOut")
        end
    end
end





function onUpdatePost(elapsed)
    --info bar elements
    if not downscroll then
        setProperty("scoreTxt.y", 670)
    else
        setProperty("scoreTxt.y", 110)
    end
    setTextSize("scoreTxt", 18)
    setTextString("scoreTxt", "Score: "..score)

    setProperty("timeBar.visible", false)
    setProperty("timeTxt.visible", false)

    setProperty('showRating', false)
    setProperty('showComboNum', false)


    if enabled == true then
        for id = 0, getProperty("unspawnNotes.length")-1 do
            setPropertyFromGroup("unspawnNotes", id, "hitHealth", 0)
        end
    end
end


