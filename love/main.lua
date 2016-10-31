function love.load()
    man = love.graphics.newImage("images/man.png")
    log = love.graphics.newImage("images/tree.png")

    restart()
end

function restart()
    logs = {"left"}
    side = "right"
    for i = 1, 2, 1 do
        generate_log()
    end

    score = 0
end

function love.draw()
    love.graphics.clear(255, 255, 255)

    local position_x = 450
    local scale_x = 1

    if side == "left" then
        position_x = 350
        scale_x = -1
    end

    love.graphics.draw(man, position_x, 250, 0, scale_x, 1)

    for i, direction in pairs(logs) do
        local scale_x = 1
        if direction == "left" then
            scale_x = -1
        end
        love.graphics.draw(log, 400, 500 - (i * 200), 0, scale_x, 1, log:getWidth()/2)
    end

    love.graphics.setColor(0, 0, 0)
    love.graphics.print(score, 20, 20)
end

function love.keypressed(key)
   if key == "right" then
       side = "right"
       chop()
   elseif key == "left" then
       side = "left"
       chop()
   end
end

function chop()
    if side == logs[2] then
        score = score - 1
        restart()
    else 
        score = score + 1
        table.remove(logs, 1)
    end
    generate_log()
end

function generate_log()
    if love.math.random(0, 1) > 0.5 then
       table.insert(logs, "left") 
    else
        table.insert(logs, "right")
    end
end
