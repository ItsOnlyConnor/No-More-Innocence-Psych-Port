local shadname = "static"

function onCreatePost()
    -- Shader Credits What Suppoed To Look Like, tbh this is better https://www.shadertoy.com/view/lsfGD2#
    luaDebugMode = true
    
    if shadname == "static" then
        if getModSetting("static", 'NO MORE INNOCENCE') then
            initLuaShader(shadname)
        
            makeLuaSprite("temporaryShader")
            makeGraphic("temporaryShader", screenWidth, screenHeight)
            --your mom
            --Unholy
            --setProperty("temporaryShader.alpha", 0.2, false)
            setSpriteShader("temporaryShader", shadname)
            --setSpriteShader("botplayTxt", shadname)

            addHaxeLibrary("ShaderFilter", "openfl.filters")
            -- change  cam.Game  to cam.HUD for colored notes
            runHaxeCode([[
                trace(ShaderFilter);
                //FlxG.game.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
                FlxG.game.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
            ]])
        end
    end
end
function onUpdate()
    if getModSetting("static", "NO MORE INNOCENCE") then
        setShaderFloat('temporaryShader','iTime',os.clock())
        --setShaderFloat('botplayTxt','iTime',os.clock())
    end
end

function onDestroy()
    if shadersEnabled then
        if getModSetting("static", "NO MORE INNOCENCE") then
            runHaxeCode([[
                FlxG.game.setFilters([]);
            ]])
        end
    end
end