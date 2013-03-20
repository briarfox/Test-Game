Player = class()

function Player:init(coords,s,i)
    -- you can accept and set parameters here
        img = readImage("Dropbox:ZombieSpriteSheet")
        self.spriteW,self.spriteH = spriteSize(img)
    self.player = Animation(img,5,5)
    self.player:addSprite(1,coords,vec2(self.spriteW,self.spriteH))
    self.player:addAnimation(1,1,{11,12,13,14,15})
    self.jumping = false
    self.jump = false
    self.pauseJump = false
    self.alive = true
    

  
  
  
  
  
    
end

function Player:draw()
  
      self.player:draw()
     self:isJumping()
    
    -- Codea does not automatically call this method
    --[[
    if self.jump == true then
        self.jumping = true
        self.player.spriteName[1].currentLoc.rotation=0
        
        local t1 = tween(.3,self.player.spriteName[1].currentLoc,{y=300,rotation=360,size=vec2(.5,.5)},tween.easing.linear,function() print("jumping") end)
        local t2 = tween(0.3,self.player.spriteName[1].currentLoc,{y=self.player.spriteName[1].currentLoc.y,size=vec2(1,1)},tween.easing.linear,function() 
                                                                                    print("finished") 
                                                                                    self.jumping = false
                                                                                    end)
        tween.sequence(t1,t2)
        self.jump = false
    
    end
    --]]
    --popMatrix()
end

function Player:isJumping()
    
    if self.jump == true and self.pauseJump == false then
        self.jumping = true
        sound(SOUND_JUMP, 2656)
        local p = self.player.spriteName[1]
        p.currentLoc.rotation=0
        
        local t1 = tween(.3,p.currentLoc,{y=400},tween.easing.linear,function() print("jumping") end)
local t2 =  tween(0.3,p.currentLoc,{y=p.currentLoc.y},tween.easing.linear,function() 
                                                                                    print("finished") 
                                                                                    self.jumping = false
                                                                                    end)
        tween.sequence(t1,t2)
        self.jump = false
    
    end
end

function Player:checkPoint(distance,mode)
    sound(SOUND_POWERUP, 40616)
    self.player.spriteName[1].currentLoc.y = self.player.spriteName[1].spawnLoc.y
    self.pauseJump = true
    local finished = false
    local m = mode
    local s = vec2(.25,.25)
    local t = tween.easing.linear
    local p = self.player.spriteName[1]
    local tweenParam = {y=p.spawnLoc.y,x=p.currentLoc.x + distance,rotation=360,size=s}
    function f()
        print("Call Back")
     
    gameMode = mode
    p.currentLoc.size.x = 1
    p.currentLoc.size.y = 1
    p.currentLoc.x = p.spawnLoc.x
    if mode == gameLove then dLoveSprite = false end
    if mode == gameMarriage then dMarriageSprite = false end
    if mode == gameBaby then dBabySprite = false end
    self.pauseJump = false
    end
    
    p.currentLoc.rotation = 0
    local t1 = tween(.5,p.currentLoc,{y=400,rotation=0},tween.easing.linear)
    local t2 = tween(.5,p.currentLoc,tweenParam,t,f)
    tween.sequence(t1,t2)
    
    
    
end

function Player:touched(touch)
    -- Codea does not automatically call this method
    if self.jumping == false then
       -- sound(DATA, "ZgJAMQBRQEtAQEBAAAAAALUtnj5kCWw+QABAf0BAQEBAQEBA")
    self.jump = true
    end
end

function Player:startAnimation()

tween(10,self,{x = 1000},
    {easing =tween.easing.cubicInOut,
    loop = tween.loop.pingpong})
end
