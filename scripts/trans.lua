--local intense = getModSetting("shaderInt", "NO MORE INNOCENCE")
function onCreatePost()
    luaDebugMode = true
    runHaxeCode([[
      game.initLuaShader('RGB_PIN_SPLIT');
      var shaderVarName = game.createRuntimeShader('RGB_PIN_SPLIT');
      shaderVarName.setFloat('amount', -0.015);
      var shaderVarName2 = game.createRuntimeShader('RGB_PIN_SPLIT');
      shaderVarName2.setFloat('amount', -0.015);
      var boobies = new ShaderFilter(shaderVarName);
      var boobies2 = new ShaderFilter(shaderVarName2);
      game.camGame.setFilters([boobies]);
      game.camHud.setFilters([boobies2]);
      resetCamCache = function(?spr) {
        if (spr == null || spr.filters == null) return;
        spr.__cacheBitmap = null;
        spr.__cacheBitmapData3 = spr.__cacheBitmapData2 = spr.__cacheBitmapData = null;
        spr.__cacheBitmapColorTransform = null;
      }  
      fixShaderCoordFix = function(?_) {
        resetCamCache(game.camGame.flashSprite);
        resetCamCache(game.camHUD.flashSprite);
        resetCamCache(game.camOther.flashSprite);
      }
      FlxG.signals.gameResized.add(fixShaderCoordFix);
      fixShaderCoordFix();  
    ]]);
  end
  
  function onDestroy()
    runHaxeCode('FlxG.signals.gameResized.remove(fixShaderCoordFix);');
  end


