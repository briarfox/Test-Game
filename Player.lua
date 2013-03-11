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
    self.alive = true
    

  
  
  
  
  
    
end

function Player:draw()
  
      self.player:draw()
    
    -- Codea does not automatically call this method
    if self.jump == true then
        self.jumping = true
        self.player.spriteName[1].currentLoc.rotation=0
        
        local t1 = tween(.3,self.player.spriteName[1].currentLoc,{y=300,rotation=360},tween.easing.linear,function() print("jumping") end)
        local t2 = tween(0.3,self.player.spriteName[1].currentLoc,{y=140,},tween.easing.linear,function() 
                                                                                    print("finished") 
                                                                                    self.jumping = false
                                                                                    end)
        tween.sequence(t1,t2)
        self.jump = false
    
    end
    --popMatrix()
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