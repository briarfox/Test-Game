Ground = class()

local lastTile

function Ground:init(y,t)
    -- you can accept and set parameters here
    self.y= y
    self.myMesh = mesh()
    self.moving = true
    self.spriteW,self.spriteH = spriteSize(t)
    self.visible = true
    self.speed = 2
    self.myMesh.texture = t
    self.floor = self: setupGround()
    self.loveCoords = vec2(WIDTH,100)
    self.marriageCoords = vec2(WIDTH,120)
    self.babyCoords = vec2(WIDTH,50)
    
    
    
    
     
      
    
    
    
end

function Ground:draw()
    
    -- Codea does not automatically call this method
    self.myMesh:clear()
    
    
    
    pushMatrix()
    scale(1.5,1.5)
    
    for i=1,#self.floor do
        local idx = self.myMesh:addRect(self.floor[i].x,self.floor[i].y,self.spriteW,self.spriteH)
        self.myMesh:setRectTex(idx,0,0,1,1)
    --sprite(self.groundTexture,self.floor[i].x,self.floor[i].y)
    end
    self.myMesh:draw()
    
    self :groundMove(self.speed)
    
    if gameTime >= 5 then
        
        pushStyle()
        textMode(CENTER)
        textSize(32)
        fill(236, 15, 15, 255)
        --text("First Comes Love",self.loveCoords.x,self.loveCoords.y +150)
        sprite("Small World:Tower",self.loveCoords.x,self.loveCoords.y)
        
        if self.moving == true then
        self.loveCoords.x = self.loveCoords.x - self.speed
        end
        popStyle()
    end
    if gameTime >= 15 then
        
        pushStyle()
        textMode(CENTER)
        textSize(32)
        fill(236, 15, 15, 255)
        --text("Then Comes Marriage",self.marriageCoords.x,self.marriageCoords.y +150)
        sprite("Small World:Church",self.marriageCoords.x,self.marriageCoords.y)
        if self.moving == true then
        self.marriageCoords.x = self.marriageCoords.x - self.speed
        end
        popStyle()
    end
    if gameTime >= 25 then
        
        pushStyle()
        textMode(CENTER)
        textSize(32)
        fill(236, 15, 15, 255)
       -- text("Then Comes the baby in the Baby Caraige",self.babyCoords.x,self.babyCoords.y +150)
        sprite("Small World:House White",self.babyCoords.x,self.babyCoords.y)
        if self.moving == true then
        self.babyCoords.x = self.babyCoords.x - self.speed
        end
        popStyle()
    end
    
    popMatrix()
end

function Ground:touched(touch)
    -- Codea does not automatically call this method
end

function Ground:setupGround()
    
    
    local tiles = (WIDTH/self.spriteW)+1
    local xGround = 0
    local f = {}
    
    for i=1,tiles do
        
        f[i] = {x = xGround+(self.spriteW/2), y = (self.spriteH/2)-15 }
        lastTile = xGround
        xGround = xGround + self.spriteW
        
    end
    return f
end

function Ground:groundMove(speed)
   
    if self.moving == true then
        
        for i=1,#self.floor do
            self.floor[i].x = self.floor[i].x - speed
            if self.floor[i].x <= -70 then
                self.floor[i].x = lastTile
                cats:spawn()
            end
        end
        
    else
        print("Stopped")
    end 
    
end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
