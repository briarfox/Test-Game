Cats = class()

function Cats:init(coords,max)
    -- you can accept and set parameters here
    spawnCount = 1
    self.max = max
    self.coords = coords
    self.img = readImage("Dropbox:cats")
    self.cats = Animation(self.img,8,12)
    self :loadCats(self.max)
    --dump(self.cats)
    
    

    
end

function Cats:draw()
    -- Codea does not automatically call this method
   -- local x = WIDTH
    --for i,k in pairs(self.enemies) do
   self.cats:draw()
end

function Cats:touched(touch)
    -- Codea does not automatically call this method
end

--[[
function Cats:loadEnemy(id)
    
    
        for i=1, self.maxEnemy do
            
        self.enemies[i] = {
                            id = id ..i,
                            coords = vec2(math.random(WIDTH,WIDTH+10000),self.y),
                            size = self.size,
                            speed = 9,
                            alive = true,
                            visible = false
                           }
       -- spriteSheet:loadAnimation(id,coords,size,speed,3,0)
            
        end
                
         for i,j in pairs(self.enemies) do
            
                 -- spriteSheet:loadAnimation(j["id"],j["coords"],j["size"],j["speed"],0,4)      
        end               

    
end
]]--

function Cats:loadCats(max)
    
    
    
    for i=1, 5 do
        local rndCat = math.random(1,8)
       self.cats:addSprite(i,self.coords,vec2(80,80))
    self.cats:speed(i,math.random(4,5),4)
        if rndCat == 1 then
            self.cats:addAnimation(i,"left",{27,26,25})
           self.cats.spriteName[i].visible = false
        elseif rndCat ==2 then
            self.cats:addAnimation(i,"left",{30,29,28})
            self.cats.spriteName[i].visible = false
        elseif rndCat ==3 then
            self.cats:addAnimation(i,"left",{33,32,31}) 
            self.cats.spriteName[i].visible = false
        elseif rndCat ==4 then
            self.cats:addAnimation(i,"left",{36,35,34})
            self.cats.spriteName[i].visible = false
        elseif rndCat ==5 then
            self.cats:addAnimation(i,"left",{75,74,73})
            self.cats.spriteName[i].visible = false
        elseif rndCat ==6 then
            self.cats:addAnimation(i,"left",{78,77,76})
            self.cats.spriteName[i].visible = false
        elseif rndCat ==7 then
            self.cats:addAnimation(i,"left",{81,80,79})
            self.cats.spriteName[i].visible = false
        elseif rndCat ==8 then
            self.cats:addAnimation(i,"left",{84,83,82})
            self.cats.spriteName[i].visible = false
            
        end
    end
   -- dump(self.cats.spriteName,"--")
end

function Cats:spawn()
    
    if self.cats.spriteName[spawnCount].currentLoc.x <= 0 then
      
        self.cats:moveSpawn(spawnCount)
    end
    local rnd = math.random(1,4)
    --self.cats.spriteName[1].speed = 10
    if rnd == 1 then
        --print(self.cats.spriteName[1].speed)
        --print(self.cats.spriteName[1].coords)
            --self.cats.spriteName[spawnCount].coords = vec3(WIDTH,120,0)
       self.cats.spriteName[spawnCount].visible = true
        self.cats:moveTo(spawnCount,vec2(-100,120)) 
        spawnCount = spawnCount + 1
        if spawnCount > self.max then
            spawnCount = 1
        end
    end
    
end

function Cats:collision(p)
    --[[
    local catW = (self.img.x/12)
    local catH = (self.img.y/8)
   
    for i,j in pairs(self.cats.spriteName) do
        local x = j.currentLoc.x + (catW/2)
        local y = j.currentLoc.Y + (catH/2)
 
    -- self bottom < other sprite top
    if y + catH < p.y then
        return false
    end
    -- self top > other sprite bottom
    if self:getY() > sprite2:getY() + sprite2:getHeight() then
        return false
    end
    -- self left > other sprite right
    if self:getX() > sprite2:getX() + sprite2:getWidth() then
        return false
    end
    -- self right < other sprite left
    if self:getX() + self:getWidth() < sprite2:getX() then
        return false
    end
    
    return true
end

    
    end
    --]]
     
end















