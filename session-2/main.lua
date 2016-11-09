game = require('./game')
game_over_state = require('./game_over_state')

function love.load()
  man = love.graphics.newImage('man.png')
  man2 = love.graphics.newImage('man2.png')
  log_blank = love.graphics.newImage('tree2.png')
  log_right = love.graphics.newImage('tree.png')
  pwnd = love.graphics.newImage('pwnd.png')

  love.graphics.setBackgroundColor(255, 255, 255)

  game.restart()
end

function love.update(delta_time)
  if not game_over then
    game.update(delta_time)
  end
end

function love.draw()
  if game_over then
    game_over_state.draw()
  else
    game.draw()
  end
end

function love.keypressed(key)
  if not game_over then
    game.keypressed(key)
  end
end
