local current_state

function setState(state, options)
    current_state = require('./' .. state)
    current_state.load(options)
end

function love.load()
    setState('game') 
end

function love.update(dt)
    current_state.update(dt)
end

function love.draw()
    current_state.draw()
end

function love.keypressed(key)
    current_state.keypressed(key)
end
