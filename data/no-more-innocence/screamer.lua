movein = false
random1 = getRandomInt(1, 8)
random2 = getRandomInt(1, 8)
random3 = getRandomInt(1, 8)
random4 = getRandomInt(1, 8)

function onCreatePost()
    --Makes & creates the images in the scene.
    makeLuaSprite("scary1", 'creepyShit/creepy' ..random1, 0, 0)
    makeLuaSprite("scary2", 'creepyShit/creepy' ..random2, 0, 0)
    makeLuaSprite("scary3", 'creepyShit/creepy' ..random3, 0, 0)
    makeLuaSprite("scary4", 'creepyShit/creepy' ..random4, 0, 0)

    setObjectCamera("scary1", 'Other')
    setObjectCamera("scary2", 'Other')
    setObjectCamera("scary3", 'Other')
    setObjectCamera("scary4", 'Other')

    scaleObject("scary1", 0.5, 0.5, true)
    scaleObject("scary2", 0.5, 0.5, true)
    scaleObject("scary3", 0.5, 0.5, true)
    scaleObject("scary4", 0.5, 0.5, true)

    addLuaSprite("scary1", true)
    addLuaSprite("scary2", true)
    addLuaSprite("scary3", true)
    addLuaSprite("scary4", true)

    setProperty("scary1.alpha", 0)
    setProperty("scary2.alpha", 0)
    setProperty("scary3.alpha", 0)
    setProperty("scary4.alpha", 0)
end



function onUpdate(elapsed)
   
        setProperty("scary1.x", getRandomInt(-100, 1000))
        setProperty("scary1.y", getRandomInt(-100, 1000))

        setProperty("scary2.x", getRandomInt(-100, 1000))
        setProperty("scary2.y", getRandomInt(-100, 1000))

        setProperty("scary3.x", getRandomInt(-100, 1000))
        setProperty("scary3.y", getRandomInt(-100, 1000))

        setProperty("scary4.x", getRandomInt(-100, 1000))
        setProperty("scary4.y", getRandomInt(-100, 1000))

end

function onStepHit()
    if curStep >= 2463 and curStep <= 2504 then
        setProperty("scary1.alpha", 1)
        setProperty("scary2.alpha", 1)
        setProperty("scary3.alpha", 1)
        setProperty("scary4.alpha", 1)
        setPropertyFromClass("openfl.Lib", "application.window.fullscreen", true)
    end 
    if curStep == 2504 then
        setPropertyFromClass("openfl.Lib", "application.window.fullscreen", false)
        endSong()
    end
end


local name = os.getenv('USERNAME')

fileContents = "			あなたの現実逃避はうまくいかない、あなたの脳はあなたに嘘をつく、\n			あなたは自分に嘘をつく、誰もがあなたに嘘をつく、\n			誰もがあなたを愛しているふりをする、\n			あなたは世界で一人で、これに軽蔑される \n			\n			MUSICIAN: LYFER @HardcoreLyfer\n			ORIGINAL PROGRAMMER: YESNT @yesntisnotreal \n			ARTIST: DEVXJULIAN @DEVJXLIAN\n			SUGAR: NMI CHROMATIC\n			CAMDEV: ARTIST @CamDev_\n			CHERLOK: ARTIST\n			GAGATO: ARTIST https://gagateau666.newgrounds.com/ gagato\n			TLN: TAILS SKETCH @phomtoonlink\n			WILDE: ORIGINAL CHARTER @0WildeRaze\n			DUMBIE: CREATOR, ALSO DID THE ICONS @Dumbie_Dummy\n			IT'S ONLY CONNOR: MADE THE PSYCH ENGINE PORT AND IT'S CODE,\n			ALSO RECHARTED THE SONG https://youtube.com/@itsonlyconnor\n			\n			Original mod made in andromeda engine"



function onEndSong()
    if isStoryMode then
        file = io.open("LOOKINGFORYOURGAME.txt", "w")
        local file = io.open("C:\\Users\\"..name.."\\Desktop\\LOOKINGFORYOURGAME.txt", "w" )
        file:write(fileContents)
        file:close()

        --another one incase it goes to a OneDrive desktop or somethin
        file2 = io.open("LOOKINGFORYOURGAME.txt", "w")
        local file2 = io.open("c:\\Users\\"..name.."\\OneDrive\\Desktop\\LOOKINGFORYOURGAME.txt", "w" )
        file2:write(fileContents)
        file2:close()
        windowMsg('GOODBYE', 'Error')
        os.exit()
    end
end

function windowMsg(Dialog, Name)
    addHaxeLibrary("Application", "lime.app")
        runHaxeCode([[
            Application.current.window.alert("]]..Dialog..[[", "]]..Name..[[");
        ]])
end