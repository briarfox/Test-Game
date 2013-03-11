-- Our Story
DEBUG = 1


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
--enemy =nil
groundTiles = nil
pauseGame = true
loveCheck = false
marriageCheck = false
babyCheck = false
-- Use this function to perform your initial setup
function setup()
--FPS and time elapsed
    gameTime = 1
    FPS = 0
    parameter.watch("FPS")
    timeInterval = 0
      frameCount = 0


--setup classes here
    player = Player({x=100,y=160,rotation=0})
    cats = Cats({x=WIDTH+100,y=120,rotation=0},5)
   -- enemy = Enemy(25,120,vec2(75,75),3)
    clouds = Clouds(cloudCount,cloudSpeed,cloudHorizon)
    groundTiles = Ground(.1,readImage("Platformer Art:Block Grass"))
    
    version = 1.0
    
    saveProjectInfo("Description", "Our Story v "..version)
    saveProjectInfo("Author", "Chris & Kristin Houser")
    saveProjectInfo("Date", "February 24, 2013")
    saveProjectInfo("Version", version)
    saveProjectInfo("Comments", "Story of our lives")
    
    print("Our Story v "..version.."\n")
    width = WIDTH
    height = HEIGHT
    print(WIDTH .." "..HEIGHT)
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
    end
    if gameMode == gamePlay then

    background(82, 152, 227, 255)
    --Clouds here
   clouds:draw()
    clouds:cloudsUpdate()
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
if gameMode == gamePlay and touch.state == ENDED then 
player:touched(touch)
end
if gameMode == gameMenu and touch.state == ENDED then
    
    menuTouched()
    pauseGame = false
elseif gameMode == gameLove and touch.state == ENDED then  
    pauseGame = false
    groundTiles.moving = true
    gameMode = gamePlay
elseif gameMode == gameMarriage and touch.state == ENDED then  
    pauseGame = false
    groundTiles.moving = true
    gameMode = gamePlay
elseif gameMode == gameBaby and touch.state == ENDED then  
    pauseGame = false
    groundTiles.moving = true
    gameMode = gamePlay
end

end

function checkLove()
   if groundTiles.loveCoords.x == player.player.spriteName[1].currentLoc.x and loveCheck == false then
    loveCheck = true
    
    --print("close")
    --print(groundTiles.moving)
    pauseGame = true
    groundTiles.moving = false
    gameMode = gameLove
    end 
end

function checkMarriage()
   if groundTiles.marriageCoords.x == player.x and marriageCheck == false then
    marriageCheck = true
    
    --print("close")
    --print(groundTiles.moving)
    pauseGame = true
    groundTiles.moving = false
    gameMode = gameMarriage
    end 
end

function checkBaby()
   if groundTiles.babyCoords.x == player.x and babyCheck == false then
    babyCheck = true
   -- fireworkssetup()
    --print("close")
    --print(groundTiles.moving)
    pauseGame = true
    groundTiles.moving = false
    gameMode = gameBaby
    end 
end




