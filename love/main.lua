function love.load()
    man = love.graphics.newImage('images/man.png')
    log = love.graphics.newImage('images/tree.png')
    side = "right"

    logs = {}
    for i = 0, 3, 1 do
        generate_log()
    end
end

function love.update()

end

function love.draw()
    love.graphics.clear(255, 255, 255)

    local position_x
    local scale_x
    if side == "right" then
        position_x = 450
        scale_x = 1
    elseif side == "left" then
        position_x = 350
        scale_x = -1
    end
    love.graphics.draw(man, position_x, 400, 0, scale_x, 1)

    for i, direction in pairs(logs) do
        love.graphics.draw(log, 200, 500 - (i * 200))
    end
end

function love.keypressed(key)
   if key == "right" then
       side = "right"
   elseif key == "left" then
       side = "left"
   end
end

function chop(side)
    if side == logs[1] then
        -- lose score
    else 
        -- gain score
        table.remove(logs, 1)
    end
end

function generate_log()
    if love.math.random(0, 1) > 0.5 then
       table.insert(logs, "left") 
    else
        table.insert(logs, "right")
    end
end
