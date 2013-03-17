UI = class()

function UI:init(x)
    -- you can accept and set parameters here
    self.x = x
    self.m = mesh()
    self.heartSize = vec2(45,60)
    self.img = readImage("Planet Cute:Heart")
    self.m.texture = self.img
    local x = WIDTH - self.heartSize.x
    local y = HEIGHT - self.heartSize.y
    self.m:addRect(x,y,self.heartSize.x,self.heartSize.y)
    x = x - self.heartSize.x 
    self.m:addRect(x,y,self.heartSize.x,self.heartSize.y)
    x = x - self.heartSize.x 
    self.m:addRect(x,y,self.heartSize.x,self.heartSize.y)
end

function UI:draw()
    self.m:draw()
    -- Codea does not automatically call this method
    sprite("SpaceCute:Health Heart")
end

function UI:touched(touch)
    -- Codea does not automatically call this method
end

function UI:hearts()
    
end
