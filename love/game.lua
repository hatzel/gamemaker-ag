local state = {}

function state.load()
    man = love.graphics.newImage("images/man2.png")
    man_chopping = love.graphics.newImage("images/man.png")
    log = love.graphics.newImage("images/tree.png")
    log_blank = love.graphics.newImage("images/tree2.png")

    logs = {"left"}
    side = "right"
    for i = 1, 2, 1 do
        generate_log()
    end

    score = 0
    man_chopping_timer = 0
    game_over_timer = 5
end

function gameOver()
    setState('game_over', {score = score})
end

function state.update(dt)
    man_chopping_timer = man_chopping_timer - dt
    game_over_timer = game_over_timer - (dt * score/10)

    if game_over_timer <= 0 then
        gameOver()
    end
end

function state.draw()
    love.graphics.clear(255, 255, 255)

    local position_x = 450
    local scale_x = 1

    if side == "left" then
        position_x = 350
        scale_x = -1
    end

    local man_image = man
    if man_chopping_timer > 0 then
        man_image = man_chopping
    end
    love.graphics.draw(man_image, position_x, 250, 0, scale_x, 1)

    for i, direction in ipairs(logs) do
        local scale_x = 1
        local image = log
        if direction == "left" then
            scale_x = -1
        elseif direction == "blank" then
            image = log_blank
        end
        love.graphics.draw(image, 400, 500 - (i * 200), 0, scale_x, 1, log:getWidth()/2)
    end

    love.graphics.setColor(0, 0, 0)
    love.graphics.print(score, 20, 20)
    love.graphics.rectangle('fill', 50, 20, 20 * game_over_timer, 10)
end

function state.keypressed(key)
   if key == "right" then
       side = "right"
       chop()
   elseif key == "left" then
       side = "left"
       chop()
   end
end

function chop()
    if side == logs[1] or side == logs[2] then
        gameOver()
    else
        score = score + 1
        table.remove(logs, 1)
    end
    man_chopping_timer = 0.1
    game_over_timer = math.min(game_over_timer + 1, 10)
    generate_log()
end

function generate_log()
    local top_log = logs[#logs]
    if top_log == "blank" then
        local opposite
        if logs[#logs-1] == "right" then
            opposite = "left"
        else
            opposite = "right"
        end
        table.insert(logs, opposite)
    else
        if love.math.random() < 0.3 then
            table.insert(logs, "blank")
        else
            table.insert(logs, top_log)
        end
    end
end

return state
