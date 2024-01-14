--If you wanna know why theres so much comments, my brain just needs them to understand whats happening in this large mess. If you hate them, fuck you! -Connor

luaDebugMode = true
local debug = false --disables the annoying shit in testing.
--SETTINGS--
local windowNotif = nil
local windowedMode = nil
local changeName = nil

function onCreate()
    --makeLuaSprite("dying", null, 0, 0)
    --makeGraphic('dying', screenWidth + 800, screenHeight + 800, '000000')
    --setScrollFactor('dying', 0, 0)
    --setObjectCamera("dying", 'other')
    --addLuaSprite("dying", true)
    --debug text
    --makeLuaText("dyingDebug", "Aaa", 0, 0.0, 0.0)
    --addLuaText("dyingDebug")
    -----------------------------SETTINGS----------------------------
    if getModSetting("windowNotif", "NO MORE INNOCENCE") == true then
        windowNotif = true
        if debug == true then
            --debugPrint('Window Notifications are On')
        end
    else
        windowNotif = false
        if debug == true then
            --debugPrint('Window Notifications are off')
        end
    end

    if getModSetting("windowMode", "NO MORE INNOCENCE") == true then
        
        windowedMode = true
    else
        windowedMode = false
    end

    if getModSetting("nameChanging", "NO MORE INNOCENCE") == true then
        changeName = true
    else
        changeName = false
    end
    ----------------------------NOT-SETTINGS-------------------------
    --Sets window stuff
    if changeName == true then
        setPropertyFromClass('lime.app.Application', 'current.window.title', 'NO MORE INNOCENCE')
        addHaxeLibrary('Application', 'lime.app')
        addHaxeLibrary('Image','lime.graphics')
        runHaxeCode([[
            var Icon:Image=Image.fromFile(Paths.modFolders('images/icon.png'));
            Application.current.window.setIcon(Icon);
        ]])  
    end

    if windowedMode == true then
        setPropertyFromClass("lime.app.Application", "current.window.width", "1280")
        setPropertyFromClass("lime.app.Application", "current.window.height", "720")
        --setPropertyFromClass("lime.app.Application", "current.window.x", 320)
        --setPropertyFromClass("lime.app.Application", "current.window.y", 180)
        setPropertyFromClass("openfl.Lib", "application.window.resizable", false)
    end
    
    

    

    --"GOOD LUCK" Notif
    if buildTarget == 'windows' and not debug then
        if windowNotif == true then
            os.execute([[ powershell -Command "& {$ErrorActionPreference = 'Stop';$title = ]] ..  [['GOOD LUCK']] .. [[;[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null;$template = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType]::ToastText01);$toastXml = [xml] $template.GetXml();$toastXml.GetElementsByTagName('text').AppendChild($toastXml.CreateTextNode($title)) > $null;$xml = New-Object Windows.Data.Xml.Dom.XmlDocument;$xml.LoadXml($toastXml.OuterXml);$toast = [Windows.UI.Notifications.ToastNotification]::new($xml);$toast.Tag = 'Test1';$toast.Group = 'Test2';$toast.ExpirationTime = [DateTimeOffset]::Now.AddSeconds(5);$notifier = [Windows.UI.Notifications.ToastNotificationManager]:]].. [[:CreateToastNotifier('M.R. INNOCENCE');]].. [[$notifier.Show($toast);}"]] )
            addHaxeLibrary('Application', 'lime.app')
            runHaxeCode("Application.current.window.focus();")
        end
    end
    
    --Shows mouse in gameplay
    runHaxeCode([[
        FlxG.mouse.visible = true;
        FlxG.mouse.unload();
        FlxG.mouse.load(Paths.image("cursor").bitmap, 0.23, 0);
    ]]);
end

function onUpdatePost()
    --[[deathAlpha = (1 + getHealth()) * 1.25
    if deathAlpha > 1 then
        deathAlpha = 1
    end
    setProperty('camHud.alpha', deathAlpha)
    --setTextString("dyingDebug", deathAlpha)--]]
end

function onBeatHit()
    --Changes mouse to the Laughing variation
    if curBeat == 423 then
        runHaxeCode([[
            FlxG.mouse.unload();
            FlxG.mouse.load(Paths.image("laugh").bitmap, 1, 0);
        ]]);
    end
    if curBeat%2==0 then
        if getHealth() >= 0.023 then
            addHealth(-0.023)
        end
    end
end


function onDestroy()
    --Resets window shit to normal FNF (except icon, fuck you)
    if changeName == true then
        setPropertyFromClass('lime.app.Application', 'current.window.title', "Friday Night Funkin': Psych Engine")
    end
    if windowedMode == true then
        setPropertyFromClass("openfl.Lib", "application.window.resizable", true)
    end
    runHaxeCode([[
        FlxG.mouse.visible = false;
        FlxG.mouse.unload();
        FlxG.mouse.load(Paths.image("cursor").bitmap, 0.23, 0);
    ]]);
end

function onSectionHit()
    
end