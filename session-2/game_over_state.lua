game_over_state = {}

game_over_state.draw = function()
  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(pwnd, 0, 0)
end

return game_over_state
