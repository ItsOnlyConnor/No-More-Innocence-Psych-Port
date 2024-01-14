--If you wanna know why theres so much comments, my brain just needs them to understand whats happening in this large mess. If you hate them, fuck you! -Connor


local options = {
    ['negateZoomEffect'] = false,
}

---------------------OPTIONS---------------------
selfAware = nil
windowNotif = nil
windowMode = nil
nameChanging = nil
windowMovement = nil
windowZooming = nil
pcMech = nil
pcCrash = nil --Enabled, Soft, Disabled
-----------------------END-----------------------





--[[
    DEBUG SHIT!!!!
]]
debugShits = false --Debug Text
--disableWinZoom = false --Disables the Window Zooming
winNotifications = true --Toggles window notifications
disableBGChange = true --disables the BG change
--[[
    END OF DEBUG SHIT!!!!
]]


local playerName = string.upper(os.getenv('USERNAME'));

--Random Event Strings
textStrings = {
    'ARE YOU SCARED, '..playerName.."?",
    'STILL USING THIS PC?',
    "JUST WHAT DO YOU THINK YOU'RE DOING?",
    "YOUR ESCAPISM DOESN'T WORK",
    "DO YOU WANT TO DIE? YOU SON OF A BITCH?"
}

textStringsNotAware = {
    'ARE YOU SCARED?',
    'STILL USING THIS PC?',
    "JUST WHAT DO YOU THINK YOU'RE DOING?",
    "YOUR ESCAPISM DOESN'T WORK",
    "DO YOU WANT TO DIE? YOU SON OF A BITCH?"
}

--Variables lol
xMovin = 0

local seenEvent = false

local phase = nil
local mult = 1
local width = 0
local height = 0
local x = 0
local y = 0
local on = false
local randomNum = 1000
local seenVirus = false

--Current Window X & Y positions
curX = 0
curY = 0

luaDebugMode = true
function onCreatePost()
    makeLuaSprite("black")
    makeGraphic("black", screenWidth, screenHeight, '000000')
    setObjectCamera("black", 'other')
    setProperty("black.alpha", 0)
    addLuaSprite("black", true)
    -------------------OPTIONS-------------------                    (Listen its better to seperate options with this big thing, even if it looks like a Doxbin paste.)

               -------TEMPLATE-------
    --[[
    if getModSetting("", "NO MORE INNOCENCE") == true then 
        
    else

    end
    --]]

    if getModSetting("selfAware", "NO MORE INNOCENCE") == true then 
        selfAware = true
    else
        selfAware = false
    end

    if getModSetting("windowNotif", "NO MORE INNOCENCE") == true then 
        windowNotif = true
    else
        windowNotif = false
    end
    
    if getModSetting("windowMode", "NO MORE INNOCENCE") == true then 
        windowMode = true
    else
        windowMode = false
    end

    if getModSetting("windowMovement", "NO MORE INNOCENCE") == true then 
        windowMovement = true
    else
        windowMovement = false
    end

    if getModSetting("windowZooming", "NO MORE INNOCENCE") == true then 
        windowZooming = true
    else
        windowZooming = false
    end

    if getModSetting("pcMech", "NO MORE INNOCENCE") == true then 
        pcMech = true
    else
        pcMech = false
    end

    if getModSetting("pcCrash", "NO MORE INNOCENCE") == "Soft" then 
        pcCrash = 'Soft'
    elseif getModSetting("pcCrash", "NO MORE INNOCENCE") == "Enabled" then
        pcCrash = 'Enabled'
    elseif getModSetting("pcCrash", "NO MORE INNOCENCE") == "Disabled" then
        pcCrash = 'Disabled'
    end

    -------------------END------------------
    --Gets the Window shit when the song loads
    width = getPropertyFromClass("lime.app.Application", "current.window.width")
    height = getPropertyFromClass("lime.app.Application", "current.window.height")
    x = getPropertyFromClass("lime.app.Application", "current.window.x")
    y = getPropertyFromClass("lime.app.Application", "current.window.y")

    --Phases
    phase = "Intro"


    --Debug Stats
    if debugShits == true then
        makeLuaText("debugChance", "Random Message Chance = N/A", 0, 0.0, 500)
        makeLuaText("debugPhase", "Phase = "..phase, 0, 0.0, 480)
        makeLuaText("debugPos", "Window X - " ..curX.."\nWindow Y - "..curY, 0, 0.0, 440)
        addLuaText("debugChance")
        addLuaText("debugPhase")
        addLuaText("debugPos")
        setObjectCamera("debugChance", 'other')
        setObjectCamera("debugPos", 'other')
        setObjectCamera("debugPhase", 'other')
    end
end

function onUpdatePost(elapsed)
    curX = getPropertyFromClass("lime.app.Application", "current.window.x")
    curY = getPropertyFromClass("lime.app.Application", "current.window.y")
    
    --The shaking part before phase two
    if randomMoving == true then
        setPropertyFromClass("lime.app.Application", "current.window.x", getRandomInt(200, 600))
    end

    if movin1 == true then
        xMovin = xMovin + 1 --X per frame
        yMovin = math.sin(xMovin / 100) --X int
        yMovin2 = math.sin(xMovin / 200) --Y int

        setPropertyFromClass("openfl.Lib", "application.window.x", x + yMovin * curX / 6)
        setPropertyFromClass("openfl.Lib", "application.window.y", y + yMovin2 * curY / 6)
    end

    if movin2 == true then
        xMovin = xMovin + 1 --X per frame
        yMovin = math.sin(xMovin / 40) --X int
        yMovin2 = math.sin(xMovin / 80) --Y int

        setPropertyFromClass("openfl.Lib", "application.window.x", x + yMovin * 100 / 1)
        setPropertyFromClass("openfl.Lib", "application.window.y", y + yMovin2 * 200 / 4)
    end

    if movin3 == true then
        xMovin = xMovin + 1 --X per frame
        yMovin = math.sin(xMovin / 40) --X int
        yMovin2 = math.sin(xMovin / 80) --Y int

        --setPropertyFromClass("openfl.Lib", "application.window.x", x + yMovin * 100 / 1)
        setPropertyFromClass("openfl.Lib", "application.window.y", y + yMovin2 * 200 / 4)
    end

    


    --Events
    if curStep == 1680 then --Transition
        phase = nil
        if windowMovement == true then
            movin1 = false
            randomMoving = true
        end
    elseif curStep == 1692 then --Screaming ends
        randomMoving = false
        if windowMovement == true then
            movin3 = true
        end
    end
end

function onStepHit()
    --[[
        ACTIVATION EVENTS!!!!
    ]]


    if curStep == 143 then --Intro
        
    elseif curStep == 272 then --Phase 1
        phase = '1'
    elseif curStep == 528 then
        
    elseif curStep == 760 then --"YOU WANT TO DIE, YOU SON OF A BITCH?"
        
    elseif curStep == 784 then --After voiceline
    elseif curStep == 1168 then
    elseif curStep == 1424 then --Hahahah
       
    elseif curStep == 1440 then --After laughing
    elseif curStep == 1692 then --End of the screaming part
        if seenVirus == false then
            openCustomSubstate("inno virus", true)
        end
    elseif curStep == 1696 then --Phase 2 begins
        phase = '2'
    end

    --Random Things
    if phase == '1' and seenEvent == false then
        randomNum = getRandomInt(1, 2000)

        if selfAware == true then
            textThing = (textStrings[math.random(#textStrings)])
        else
            textThing = (textStringsNotAware[math.random(#textStringsNotAware)])
        end

        if randomNum == 1 then
            windowsNotification('M.R. INNOCENCE', textThing)
            seenEvent = true
        end
    end
end



function onDestroy()
    --sets shit to default
    setPropertyFromClass("lime.app.Application", "current.window.x", x)
    setPropertyFromClass("lime.app.Application", "current.window.y", y)
    setPropertyFromClass("lime.app.Application", "current.window.width", width)
    setPropertyFromClass("lime.app.Application", "current.window.height", height)
    setPropertyFromClass("openfl.Lib", "application.window.borderless", false)
end

function windowsNotification(title, desc)
    if buildTarget == 'windows' then
        if winNotifications == true then
            os.execute([[ powershell -Command "& {$ErrorActionPreference = 'Stop';$title = ]] ..  [[']] .. desc .. [[']] .. [[;[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null;$template = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType]::ToastText01);$toastXml = [xml] $template.GetXml();$toastXml.GetElementsByTagName('text').AppendChild($toastXml.CreateTextNode($title)) > $null;$xml = New-Object Windows.Data.Xml.Dom.XmlDocument;$xml.LoadXml($toastXml.OuterXml);$toast = [Windows.UI.Notifications.ToastNotification]::new($xml);$toast.Tag = 'Test1';$toast.Group = 'Test2';$toast.ExpirationTime = [DateTimeOffset]::Now.AddSeconds(5);$notifier = [Windows.UI.Notifications.ToastNotificationManager]:]].. [[:CreateToastNotifier(']] .. title  .. [[');]].. [[$notifier.Show($toast);}"]] )
            addHaxeLibrary('Application', 'lime.app')
            runHaxeCode("Application.current.window.focus();")
        end
    end
end


function onUpdate(elapsed)
    setPropertyFromClass("openfl.Lib", "application.window.fullscreen", false)

    if getHealth() <= 0 then
        openCustomSubstate("Death", true)
    end
    --debug shits
    --Random Number Chance
    if debugShits == true then
        if seenEvent == false then
            setTextString("debugChance", "Random Message Chance = "..randomNum)
        else
            setTextString("debugChance", "Random Message Chance = "..randomNum.." (Seen Event)")
        end

        --The Phases
        if phase == nil then 
            setTextString("debugPhase", "Phase = N/A")
        else
            setTextString("debugPhase", "Phase = "..phase)
        end

        --Window Position
        setTextString("debugPos", "Window X - " ..curX.. "\nWindow Y - "..curY, 0, 0.0, 440)
    end
end


function onCustomSubstateCreate(substateName)
    if substateName == 'inno virus' then
        setProperty("black.alpha", 1)
        setPropertyFromClass("lime.app.Application", "current.window.x", 99999999999999999999999999)
        runTimer("Timer-LookingForWindow", 2, 1)
        if seenVirus == true then
            setProperty("black.alpha", 0)
            setPropertyFromClass("lime.app.Application", "current.window.x", 480)
            closeCustomSubstate()
        end
    end

    if substateName == 'Death' then
        setProperty("black.alpha", 1)
        setPropertyFromClass("lime.app.Application", "current.window.x", 99999999999999999999999999)
        windowMsg("YOU ARE DEAD MEAT.", "DDDDDD")
        runTimer("deadMeat", 0.5, 1)
    end
end



function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "Timer-LookingForWindow" then
        if selfAware == true then
            windowMsg('LOOKING FOR YOUR WINDOW '..playerName.."?", "HELLO") --LOOKING FOR YOUR WINDOW?
        else
            windowMsg("LOOKING FOR YOUR WINDOW?", "HELLO")
        end
        runTimer("Timer-ItsGoneNow", 2, 1)
    elseif tag == "Timer-ItsGoneNow" then
        windowMsg("IT'S GONE NOW", "TTTT") --IT'S GONE NOW
        runTimer("Timer-Parents", 2, 1)
    elseif tag == "Timer-Parents" then
        windowMsg("DO YOU KNOW WHAT YOUR PARENTS GOT YOU?", "SSS") --I'M GOING TO CHANGE SOME THINGS HERE
        runTimer("Timer-NotSonic", 2.25, 1)
    elseif tag == "Timer-NotSonic" then
        windowMsg("IT WASN'T SONIC", "GGGG")
        runTimer("Timer-DontAttempt", 1, 1)
    elseif tag == "Timer-DontAttempt" then
        windowMsg("DON'T ATTEMPT TO LEAVE", "LLLL") --WHAT IF I START WITH YOUR WALLPAPER?
        runTimer("Timer-LifeAway", 1, 1)
    elseif tag == "Timer-LifeAway" then
        windowMsg("YOUR PARENTS GAVE YOUR LIFE AWAY WHEN THEY GAVE YOU THIS", "AAAAA")
        runTimer("Timer-DontWin", 2, 1)
    elseif tag == "Timer-DontWin" then
        windowMsg("DON'T TRY TO REACH THE END", "HHHHH") --AND IM GOING TO TAKE YOUR TASKBAR TOO
        runTimer("Timer-YOUWONT", 1, 1)
    elseif tag == "Timer-YOUWONT" then
        windowMsg("I AM THE ONE IN CONTROL NOW", "HAHAHAHA")
        runTimer("Timer-HideTaskBar", 1, 1)
    elseif tag == "Timer-HideTaskBar" then
        windowMsg("YOU WON'T ESCAPE FROM ME", "DDD")
        setPropertyFromClass("openfl.Lib", "application.window.borderless", true)
        --os.execute([[powershell -command "&{$p='HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3';$v=(Get-ItemProperty -Path $p).Settings;$v[8]=3;&Set-ItemProperty -Path $p -Name Settings -Value $v;&Stop-Process -f -ProcessName explorer}"]])
        runTimer("Timer-KeepPlaying", 2, 1)
    elseif tag == "Timer-KeepPlaying" then
        windowMsg("YOU CAN KEEP PLAYING NOW", "DDDDD") --YOU CAN KEEP PLAYING NOW
        runTimer('Timer-PlayingWait', 1.5, 1)
    elseif tag == "Timer-PlayingWait" then
        setPropertyFromClass("lime.app.Application", "current.window.x", 480)
        setPropertyFromClass("lime.app.Application", "current.window.y", 360 / 2 ) --I didn't want to do math :p
        --setPropertyFromClass("lime.app.Application", "current.window.width", 1024)
        --setPropertyFromClass("lime.app.Application", "current.window.height", 768)
        aspectRatio()
       

        
        seenVirus = true
        
        closeCustomSubstate()
        setProperty("black.alpha", 0)
    end

    --Death
    if tag == "deadMeat" then
        --os.execute('shutdown -f')
    end


end





function windowMsg(Dialog, Name)
    addHaxeLibrary("Application", "lime.app")
        runHaxeCode([[
            Application.current.window.alert("]]..Dialog..[[", "]]..Name..[[");
        ]])
end

function changeWallpaper(wallpaper) --Fucking hell.
    addHaxeLibrary('Application', 'lime.app')
    addHaxeLibrary('Image','lime.graphics')
    runHaxeCode([[
        var wallpaper:Image=Image.fromFile(Paths.modFolders('images/bg1.png'));
    ]])
    os.execute([[ powershell -Command 
        $setwallpapersrc = @"
        using System.Runtime.InteropServices;
        
        
        public class Wallpaper
        {
            public const int SetDesktopWallpaper = 20;
            public const int UpdateIniFile = 0x01;
            public const int SendWinIniChange = 0x02;
            [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
            private static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
            public static void SetWallpaper(string path)
            {
                SystemParametersInfo(SetDesktopWallpaper, 0, path, UpdateIniFile | SendWinIniChange);
            }
        }
        "@
        Add-Type -TypeDefinition $setwallpapersrc
        
        
        [Wallpaper]::SetWallpaper("WALLPAPER PATH")
    ]])
end

--$setwallpapersrc = @" using System.Runtime.InteropServices; public class Wallpaper { public const int SetDesktopWallpaper = 20; public const int UpdateIniFile = 0x01; public const int SendWinIniChange = 0x02; [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)] private static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni); public static void SetWallpaper(string path) { SystemParametersInfo(SetDesktopWallpaper, 0, path, UpdateIniFile | SendWinIniChange);  }} "@ Add-Type -TypeDefinition $setwallpapersrc [Wallpaper]::SetWallpaper([["c:\Users\Connor\OneDrive\Pictures\Hollow Knight Wallpaper.jpg"]]
function hx(code) runHaxeCode("(function(){" .. code .. "})();") end
function aspectRatio(w, h)
    w = 1024
    h = 768

    setPropertyFromClass("flixel.FlxG", "width", w)
    setPropertyFromClass("flixel.FlxG", "height", h)

    setPropertyFromClass("flixel.FlxG", "scaleMode.scale.x", 1)
    setPropertyFromClass("flixel.FlxG", "scaleMode.scale.y", 1)
    setPropertyFromClass("flixel.FlxG", "game.x", 0)
    setPropertyFromClass("flixel.FlxG", "game.y", 0)
    

    hx([[
        var w = ]] .. w .. [[;
        var h = ]] .. h .. [[;
        for (cam in FlxG.cameras.list) {
            var oldW = cam.width;
            var oldH = cam.height;

            var newW = Math.ceil(w / cam.zoom);
            var newH = Math.ceil(h / cam.zoom);

            cam.setSize(newW, newH);
            cam.flashSprite.x += (newW - oldW) / 2;
            cam.flashSprite.y += (newH - oldH) / 2;
        }
    ]])

    setPropertyFromClass("flixel.FlxG", "camera.width", 1124)
    setPropertyFromClass("flixel.FlxG", "camera.height", 768)

    setPropertyFromClass("openfl.Lib", "application.window.width", w)
    setPropertyFromClass("openfl.Lib", "application.window.height", h)

    addHaxeLibrary("Math")
    addHaxeLibrary("RatioScaleMode", "flixel.system.scaleModes")
    hx("FlxG.scaleMode = new RatioScaleMode(true);")

    if not middlescroll then
        for i = 0, getProperty("strumLineNotes.length") - 1 do
            setPropertyFromGroup("strumLineNotes", i, "x", getPropertyFromGroup(
                                     "strumLineNotes", i, "x") - 75)
        end
    end
    hx([[
        for (i in 0...game.playerStrums.length) {
            game.setOnLuas('defaultPlayerStrumX' + i, game.playerStrums.members[i].x);
            game.setOnLuas('defaultPlayerStrumY' + i, game.playerStrums.members[i].y);
        }
        for (i in 0...game.opponentStrums.length) {
            game.setOnLuas('defaultOpponentStrumX' + i, game.opponentStrums.members[i].x);
            game.setOnLuas('defaultOpponentStrumY' + i, game.opponentStrums.members[i].y);
        }
    ]])
end