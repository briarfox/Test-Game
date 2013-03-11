Clouds = class()

function Clouds:init(c,s,h)
    -- you can accept and set parameters here
    self.speed = s
    self.count = c
    self.cloudTable = {}
    self.horizon = h
    self.visible = false
    --self.img1 = readImage("Platformer Art:Cloud 1")

    
    
    --populate clouds
    for i=1,self.count do
        local rnd = math.random(3)
        local spriteImg = nil
        local randSprite = math.random(1,3)
            if randSprite == 1 then
                spriteImg = readImage("Platformer Art:Cloud 1")
            elseif randSprite == 2 then
                spriteImg = readImage("Platformer Art:Cloud 2")
            elseif randSprite == 3 then
                spriteImg = readImage("Platformer Art:Cloud 3")
            end
        
       self.cloudTable[i] =  {  x = math.random(WIDTH,WIDTH +1500),
                                y = math.random(HEIGHT - self.horizon,HEIGHT - 32),
                                speed = math.random(10,self.speed),
                                img = spriteImg }
        tween(self.cloudTable[i].speed,self.cloudTable[i],{x = -70},tween.easing.linear)  
    end
    
end

function Clouds:draw()
    

  
    
    self :cloudsUpdate()
    
    for i=1,#self.cloudTable do
        sprite(self.cloudTable[i].img,self.cloudTable[i].x,self.cloudTable[i].y)
       -- translate(self.cloudTable[i].x - self.cloudTable[i].speed ,self.cloudTable[i].y)
       -- if self.cloudTable[i].img == 1 then
    --sprite("Platformer Art:Cloud 1",self.cloudTable[i].x,self.cloudTable[i].y)
      --  elseif self.cloudTable[i].img == 2 then
    --sprite("Platformer Art:Cloud 2",self.cloudTable[i].x,self.cloudTable[i].y)
      --  elseif self.cloudTable[i].img == 3 then
    --sprite("Platformer Art:Cloud 3",self.cloudTable[i].x,self.cloudTable[i].y)
    --end
    end
    
    -- Codea does not automatically call this method
end

function Clouds:touched(touch)
    -- Codea does not automatically call this method
end

function Clouds:cloudsUpdate()
    
    pushMatrix()
   for i=1,#self.cloudTable do
    
    if self.cloudTable[i].x <= -70 then
        self.cloudTable[i].visible = false
    else
        self.cloudTable[i].visible = true
    end
    --Old Cloud animation
     --   self.cloudTable[i].x = self.cloudTable[i].x -self.cloudTable[i].speed
       -- if self.cloudTable[i].x <=-64 then
         --   self.cloudTable[i].x = math.random(1100,1500)
           -- self.cloudTable[i].y = math.random(HEIGHT - self.horizon,HEIGHT - 32)
        --end
        if self.cloudTable[i].visible ~= true then
            self.cloudTable[i].x = math.random(1100,1500)
            self.cloudTable[i].y = math.random(HEIGHT - self.horizon,HEIGHT - 32)
            tween(self.cloudTable[i].speed,self.cloudTable[i],{
        x = -70},tween.easing.linear)
        end
    end
    
    popMatrix()
    end
