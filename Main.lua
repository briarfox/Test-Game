-- Our Story
DEBUG = 0
 

--set game states

gameLoading = 1
gameMenu = 2
gamePlay = 3
gameLove = 4
gameMarriage = 5
gameBaby = 6
gameWin = 7
gameLose  = 8

gameMode = gameMenu

--Setup Parameters
local groundSpeed = 1
local cloudSpeed = 25.10
local cloudHorizon = 300
local cloudCount = 5

displayMode(FULLSCREEN)

--Globals
spriteSheet = nil
gameTime =nil
player = nil
cats = nil
uI = nil
--enemy =nil
groundTiles = nil
pauseGame = true
loveCheck = false
marriageCheck = false
babyCheck = false
-- Use this function to perform your initial setup
function setup()
    --tweenBaby()
   displayMode(FULLSCREEN_NO_BUTTONS) 
    version = 0.3
    --------------------------
    b=Backup("Our Story v"..version)
    ----------------------------
   
--FPS and time elapsed
    gameTime = 1
    FPS = 0
    parameter.watch("FPS")
    timeInterval = 0
      frameCount = 0


--setup classes here
--readImage("Documents:OS_Grass")
    player = Player({x=200,y=160,rotation=0})
    cats = Cats({x=WIDTH+100,y=120,rotation=0},5)
    uI = UI()
   -- enemy = Enemy(25,120,vec2(75,75),3)
    clouds = Clouds(cloudCount,cloudSpeed,cloudHorizon)
    groundTiles = Ground(.1,readImage("Documents:OS_Grass"))
    
    
    
    saveProjectInfo("Description", "Our Story v "..version)
    saveProjectInfo("Author", "Chris & Kristin Houser")
    saveProjectInfo("Date", "February 24, 2013")
    saveProjectInfo("Version", version)
    saveProjectInfo("Comments", "Story of our lives")
    
    print("Our Story v "..version.."\n")
    width = WIDTH
    height = HEIGHT
    print(WIDTH .." "..HEIGHT)
    
    
--parameter.watch(player.player:getRect(1).x)
    --clouds:cloudsUpdate()
end

-- This function gets called once every frame
function draw()
    background(213, 211, 211, 255)
    
    

    
    if pauseGame == false then
    gameTime = gameTime + DeltaTime
    end
    frameCount = frameCount + 1
  timeInterval = timeInterval + DeltaTime
    if timeInterval > 1 then

      FPS = math.floor((frameCount / timeInterval)+0.5)
      timeInterval = 0
      frameCount = 0
    
    
    end
    -- This sets a dark background color 
    if gameMode == gameMenu then
        menuScreen()
    elseif gameMode == gameLove then
        loveScreen()
    elseif gameMode == gameMarriage then
        marriageScreen()
    elseif gameMode == gameBaby then
        babyScreen()
    elseif gameMode == gameLose then
        GameOver()
    end
    if gameMode == gamePlay then

    background(82, 152, 227, 255)
    sprite("Documents:OurStory",WIDTH/2,HEIGHT/2)
    --Clouds here
    
   clouds:draw()
    clouds:cloudsUpdate()
    uI:draw()
    --Ground here
    groundTiles:draw()
    --player Here
    cats:draw()
    player:draw()
    --enemy Here
 --   enemy:draw()
    --draw animations
    --spriteSheet:draw()
    
    --check states
    checkLove()
    checkMarriage()
    checkBaby()
    
end

--DEBUG info
if DEBUG == 1 then
    
    pushStyle()
    textMode(CORNER)
    local coordx = 100
    local coordy = HEIGHT-30
   text("DEBUG MODE ON",coordx,coordy)
text("FPS: "..FPS,coordx,coordy-25)
text("Time Elapsed: " ..math.floor(gameTime+0.5),coordx,coordy-50)
text("Game Mode: " ..gameMode,coordx,coordy-75)
popStyle()
end
    

    
    
    -- This sets the line thickness
  --  strokeWidth(5)

    -- Do your drawing here
    
end

function touched(touch)
--groundTiles.moving = true   
if gameMode == gamePlay and touch.state == BEGAN then 
player:touched(touch)
end
if gameMode == gameMenu and touch.state == ENDED then
    
    menuTouched()
    pauseGame = false
elseif gameMode == gameLove and touch.state == ENDED and touch.y >=HEIGHT/2 then  
    cats:reset()
    spawnCount = 1
    pauseGame = false
    groundTiles.moving = true
    gameMode = gamePlay
elseif gameMode == gameMarriage and touch.state == ENDED and touch.y >=HEIGHT/2 then  
    cats:reset()
    spawnCount = 1
    pauseGame = false
    groundTiles.moving = true
    gameMode = gamePlay
elseif gameMode == gameBaby and touch.state == ENDED and touch.y >=HEIGHT/2 then
    uI:resetHearts()
    gameMode = gameMenu 
--elseif gameMode == gameBaby and touch.state == ENDED then  
  --  pauseGame = true
    --groundTiles.moving = true
    --gameMode = gameMenu
elseif gameMode == gameLose and touch.state == ENDED and touch.y >=HEIGHT/2 then
    uI:resetHearts()
    gameMode = gameMenu
    
    
end

end

function checkLove()
   if groundTiles.loveCoords.x == player.player.spriteName[1].currentLoc.x  and loveCheck == false then
    loveCheck = true
    pauseGame = true
    groundTiles.moving = false
    player:checkPoint(0,gameLove)
    --print("close")
    --print(groundTiles.moving)
  -- gameMode = gameLove
    end 
end

function checkMarriage()
   if groundTiles.marriageCoords.x == player.player.spriteName[1].currentLoc.x and marriageCheck == false then
    marriageCheck = true
    
    --print("close")
    --print(groundTiles.moving)
    pauseGame = true
    groundTiles.moving = false
    player:checkPoint(500,gameMarriage)
    --gameMode = gameMarriage
    end 
end

function checkBaby()
   if groundTiles.babyCoords.x == player.player.spriteName[1].currentLoc.x and babyCheck == false then
    babyCheck = true
   -- fireworkssetup()
    --print("close")
    --print(groundTiles.moving)
    tweenBaby()
    pauseGame = true
    groundTiles.moving = false
    player:checkPoint(500,gameBaby)
   -- gameMode = gameBaby
    end 
end




