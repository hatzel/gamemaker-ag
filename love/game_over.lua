local state = {}
local score 

function state.load(options)
    score = options.score
end

function state.draw()
    love.graphics.setBackgroundColor(255, 255, 255)
    love.graphics.print('GAME OVER', 300, 100)
    love.graphics.print('You scored ' .. score, 300, 150)
    love.graphics.print('Press space to restart', 300, 200)
end

function state.update(dt) end
function state.keypressed(key) 
    if key == "space" then
        setState('game')
    end
end

return state
