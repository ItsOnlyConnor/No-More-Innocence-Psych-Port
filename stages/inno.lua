function onCreatePost()
    setProperty("gf.alpha", 0, false)
    
    luaDebugMode = false
    

    --Shadow thing
    makeLuaSprite("shadows", 'stages/shadows', -550, -700)
    scaleLuaSprite("shadows", 1.2, 1.2)
    addLuaSprite("shadows", false)
    

    --Sky
    makeLuaSprite("sky", 'stages/sky', 0, -750)
    scaleLuaSprite("sky", 1.2, 1.2)
    setScrollFactor("sky", 0.75, 0.6)
    
    addLuaSprite("sky", false)

    if shadersEnabled then
        initLuaShader('wavy')
        setSpriteShader('sky','wavy')

        addHaxeLibrary('ShaderFilter', 'openfl.filters');
        runHaxeCode([[
            game.setFilters([new ShaderFilter(game.getLuaObject('sky').shader)]);
        ]])
    end

    --Floor
    makeLuaSprite("floor", 'stages/ground', 0, 0)
    scaleLuaSprite("floor", 1.2, 1.2)
    addLuaSprite("floor", false)



    
end


function onUpdatePost()
    if shadersEnabled then
        setShaderFloat('sky','iTime',os.clock())
    end
end

function onStepHit()
    if songName == 'NO MORE INNOCENCE' then
        if curStep == 1692 then
            setProperty("iconP1.alpha", 0, false)
            setProperty("iconP2.alpha", 0, false)

            setProperty('healthBar.angle', 90)
            setProperty('healthBar.x', 940) -- right is 920 | center is 345 | left is -240
            setProperty('healthBar.y', 360)

            setProperty('healthBar.scale.x', 0.93) -- initial size is a bit too big
            setProperty('healthBar.scale.y', 0.93)

            setProperty('healthBarBG.scale.x', 0.93)
            setProperty('healthBarBG.scale.y', 0.93)
            removeLuaSprite("sky", true)
            removeLuaSprite("shadows", true)
            removeLuaSprite("floor", true)

            setProperty("boyfriend.alpha", 0) 
                        
            triggerEvent("Camera Follow Pos", getProperty('dad.x') + 210, getProperty('dad.y') + 200)
        end
    end
end