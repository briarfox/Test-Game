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
        local rndS = math.random(1,3)
        if rndS == 1 then rndS = .75 end
        if rndS == 2 then rndS = 1 end
        if rndS == 3 then rndS = 1.25 end
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
                                img = spriteImg, 
                                size = rndS
                                }
        tween(self.cloudTable[i].speed,self.cloudTable[i],{x = -70},tween.easing.linear)  
    end
    
end

function Clouds:draw()
    

  
    
    self :cloudsUpdate()
    
    for i=1,#self.cloudTable do
       pushMatrix() 
    scale(self.cloudTable[i].size)
    local x,y = 0
    if self.cloudTable[i].size < 1 then
        x = ((1-self.cloudTable[i].size)*self.cloudTable[i].x)+self.cloudTable[i].x
    else
        x = self.cloudTable[i].x
    end
        sprite(self.cloudTable[i].img,x,self.cloudTable[i].y)
    popMatrix()
    end
    
    -- Codea does not automatically call this method
end

function Clouds:touched(touch)
    -- Codea does not automatically call this method
end

function Clouds:cloudsUpdate()
    
    
   for i=1,#self.cloudTable do
    pushMatrix()
    scale(self.cloudTable[i].size)
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
        
        popMatrix()
    end
    
    
    end
