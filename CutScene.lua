--cut scenes
parameter.integer("freq",.1,50,3)
local m = mesh()
m.texture = readImage("SpaceCute:Background")
--m.shader = shader("Effects:Ripple")
-----baby screen
local bLoc = {x=WIDTH/2,y=HEIGHT/2,s=1}

function tweenBaby()
   tween(.5,bLoc,{s=1.25},{easing = tween.easing.linear, loop = tween.loop.pingpong}) 
end
--fireworkssetup()
function menuTouched()
    cats:reset()
    spawnCount = 1
    pauseGame = true
    groundTiles.moving = true
    
    loveCheck = false
    marriageCheck = false
    babyCheck = false
    gameTime = 0
    hitCount = 0
    --uI:resetHearts()
    dLoveSprite = true
    dMarriageSprite = true
    dBabySprite = true
    groundTiles:resetScenes()
    
    gameMode = gamePlay
end

function menuScreen()
    ---tween.stopAll()
   local x = WIDTH/2
    local y = HEIGHT/2
    --local c = color(239, 53, 53, 255)
    --local m = mesh()
  --[[
      pushMatrix()
    m:clear()
   -- m.texture = readImage("SpaceCute:Background")

    local idx = m:addRect(WIDTH/2,HEIGHT/2,1024,768)
    m:setRectTex(idx,0,0,1,1)
    m.shader = shader("Effects:Ripple")
    m:setColors(255,255,255,255)
    m.shader.time = ElapsedTime
    m.shader.freq = freq
    m:draw()
    popMatrix()
    --]]
    sprite("Documents:OS_Title",x,y)
    --writeText("Our Story",{x=x,y=y},c,65)
    --writeText("by",{x=x,y=y-50},c,36)
    --writeText("Chris & Kristin Houser",{x=x,y=y-100},c,48)
    --[[
    pushStyle()
    textMode(CENTER)
    font("AmericanTypewriter-Bold")
    fontSize(46)
    fill(255, 0, 0, 255)
    text("The Story of Our Life!",x,y) 
    fontSize(32)
    text("TAP TO START",x,y-50)
    popStyle()
    --]]
end

function loveScreen()
    
    local x = WIDTH/2
    local y = HEIGHT/2
    sprite("Documents:OS_LoveScreen",x,y)
    --local m = mesh()
    --[[
    pushMatrix()
    m:clear()
   -- m.texture = readImage("SpaceCute:Background")

    local idx = m:addRect(WIDTH/2,HEIGHT/2,1024,768)
    m:setRectTex(idx,0,0,1,1)
    m.shader = shader("Effects:Ripple")
    m:setColors(255,255,255,255)
    m:draw()
    popMatrix()
    
    pushStyle()

    textMode(CENTER)
    font("AmericanTypewriter-Bold")
    fontSize(46)
    fill(255, 0, 0, 255)
    text("First Comes Love!",x,y) 
    fontSize(32)
    text("TAP TO START",x,y-50)
    popStyle()
    --]]
end

function marriageScreen()
    
    
    
    
    
    local x = WIDTH/2
    local y = HEIGHT/2
    sprite("Documents:OS_MarriageScreen",x,y)
    --local m = mesh()
    --[[
    pushMatrix()
    m:clear()
   -- m.texture = readImage("SpaceCute:Background")

    local idx = m:addRect(WIDTH/2,HEIGHT/2,1024,768)
    m:setRectTex(idx,0,0,1,1)
    m.shader = shader("Effects:Ripple")
    m:setColors(255,255,255,255)
    m:draw()
    popMatrix()
    
   -- pushStyle()
textMode(CENTER)
    writeText("Then Comes Marriage!",{x=x,y=y})
    writeText("TAP TO START",{x=x,y=y-50,s = .75})
    
    textMode(CENTER)
    font("AmericanTypewriter-Bold")
    fontSize(46)
    fill(255, 0, 0, 255)
    text("Then Comes Marriage!",x,y) 
    fontSize(32)
    text("TAP TO START",x,y-50)
    popStyle()
    
    
    --]]
    
    
end

function babyScreen()
    
    local x = WIDTH/2
    local y = HEIGHT/2
    gameTime = 0
    pauseGame = true
    sprite("Documents:OS_BabyScreen",x,y)
    --[[
    m.texture = readImage("Documents:baby")
    --local m = mesh()
    pushMatrix()
    m:clear()
   -- m.texture = readImage("SpaceCute:Background")

    local idx = m:addRect(WIDTH/2,HEIGHT/2,1024,768)
    m:setRectTex(idx,0,0,1,1)
  --  m.shader = shader("Effects:Ripple")
    --m:setColors(255,255,255,255)
    m:draw()
    popMatrix()
    
    textMode(CENTER)
    writeText("We Are Having A Baby!",{x=x,y=y+200,s=bLoc.s},color(255, 155, 0, 255))

    --]]
    
    --[[
    pushStyle()

    textMode(CENTER)
    font("AmericanTypewriter-Bold")
    fontSize(46)
    fill(255, 0, 0, 255)
    text("Yup thats Right, We are having a Baby!",x,y) 
    fontSize(32)
    text("YOU WON!!!",x,y-50)
    popStyle()
   -- fireworksdraw()
--]]
    
end

function writeText(t,coords,c,s)
    
    pushMatrix()
    pushStyle()
    --print(bloc)
    translate(coords.x,coords.y)
       if coords.s ~= nil then scale(coords.s) end
    
    
    textMode(CENTER)
    font("AmericanTypewriter-Bold")
    if s == nil then fontSize(46) else fontSize(s) end
    
    if c then fill(c) end
    --fill(255, 155, 0, 255)
    text(t,0,0) 
    
    --fontSize(32)
    --text("YOU WON!!!",x,y-50)
    popStyle()
    popMatrix()
end

function GameOver()
    gameTime = 0
    pauseGame = true
    sprite("Documents:OS_Background",WIDTH/2,HEIGHT/2)
    local c = color(244, 32, 32, 255)
    writeText("You Lost Her!",{x=WIDTH/2,y=HEIGHT/2},c)
end







