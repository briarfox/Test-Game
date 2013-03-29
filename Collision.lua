--[[
function collision(rectA,rectB)
    local ax2, bx2, ay2, by2 = rectA.x + rectA.width, rectB.x + rectB.width, rectA.y + rectA.height, rectB.y + rectB.height
    return ax2 > rectB.x and bx2 > rectA.x and ay2 > rectB.y and by2 > rectB.y
end

end

--]]
