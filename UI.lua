UI = class()
local DEBUG = true
hitCount = 0
currentHit = 0
hit = false
function UI:init(x)
    -- you can accept and set parameters here
    self.x = x
    self.m = mesh()
    self.soundPlayed = false
    self.heartSize = vec2(45,60)
    self.img = readImage("Planet Cute:Heart")
    self.m.texture = self.img
    self.xh = WIDTH - self.heartSize.x
    self.yh = HEIGHT - self.heartSize.y
   h1 = self.m:addRect(self.xh,self.yh,self.heartSize.x,self.heartSize.y)
   -- h1 = self.m:addRect(x,y,self.heartSize.x,self.heartSize.y)
    self.xh = self.xh - self.heartSize.x 
    h2 = self.m:addRect(self.xh,self.yh,self.heartSize.x,self.heartSize.y)
    self.xh = self.xh - self.heartSize.x 
    h3 = self.m:addRect(self.xh,self.yh,self.heartSize.x,self.heartSize.y)
end

function UI:draw()
    local x = WIDTH - self.heartSize.x
    local y = HEIGHT - self.heartSize.y
    sprite("Small World:Heart Empty",x,y)
    x = x - self.heartSize.x
    sprite("Small World:Heart Empty",x,y)
    self.m:draw()
    -- Codea does not automatically call this method
    sprite("SpaceCute:Health Heart")
    self:hearts()
end

function UI:touched(touch)
    -- Codea does not automatically call this method
end

function UI:hearts()
if player.damage == true then
    local p = player.player.spriteName[1].rectLoc
    for i,j in pairs(cats.cats.spriteName) do
        --local p = player.spriteName[1].rectLoc
        if collision(p,cats.cats.spriteName    [i].rectLoc) then hit = true end
        
        if hit == true then
            
            if self.soundPlayed == false then sound(SOUND_POWERUP, 40621); self.soundPlayed = true end
            if currentHit == 0 then hitCount = hitCount+1 end
        currentHit = currentHit + DeltaTime
            self:hitHeart()
            --writeText("Ouch",{x=WIDTH/2, y=HEIGHT/2},color(255, 0, 0, 255,360)
            if currentHit >= 3 then currentHit = 0; hit = false; self.soundPlayed = false end
        end
    
    end
    end
    
end

function UI:hitHeart()
    local x = WIDTH - self.heartSize.x
    local y = HEIGHT - self.heartSize.y
    if hitCount == 1 then 
    self.m:setRect(h1,0,0,0,0) 
    sprite("Small World:Heart Empty",x,y)
    end      
    if hitCount == 2 then 
    self.m:setRect(h2,0,0,0,0) 
    sprite("Small World:Heart Empty",x,y)
    x = x - self.heartSize.x
    sprite("Small World:Heart Empty",x,y)
    
    end
    if hitCount == 3 then 
    self.m:setRect(h3,0,0,0,0); gameMode = gameLose end  
    
    
end

function UI:resetHearts()
    local x = WIDTH - self.heartSize.x
    local y = HEIGHT - self.heartSize.y
    
    h1 = self.m:addRect(x,y,self.heartSize.x,self.heartSize.y)
   -- h1 = self.m:addRect(x,y,self.heartSize.x,self.heartSize.y)
    x = x - self.heartSize.x 
    h2 = self.m:addRect(x,y,self.heartSize.x,self.heartSize.y)
    x = x - self.heartSize.x 
    h3 = self.m:addRect(x,y,self.heartSize.x,self.heartSize.y)
    
end








