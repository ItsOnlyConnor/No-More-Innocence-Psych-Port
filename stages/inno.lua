function onCreatePost()
    
    luaDebugMode = false
    --Sky
    makeLuaSprite("sky", 'stages/sky', 0, -750)
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
    
        
    


    --Shadow thing
    makeLuaSprite("shadows", 'stages/shadows', -550, -750)
    addLuaSprite("shadows", false)

    --Floor
    makeLuaSprite("floor", 'stages/ground', 0, 0)
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
            removeLuaSprite("sky", true)
            removeLuaSprite("shadows", true)
            removeLuaSprite("floor", true)

            setProperty("boyfriend.alpha", 0) 
                        
            triggerEvent("Camera Follow Pos", getProperty('dad.x') + 200, getProperty('dad.y') + 200)
        end
    end
end