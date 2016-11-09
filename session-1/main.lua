function love.load()
  man = love.graphics.newImage('man.png')
  man2 = love.graphics.newImage('man2.png')
  log_blank = love.graphics.newImage('tree2.png')
  log_right = love.graphics.newImage('tree.png')

  love.graphics.setBackgroundColor(255, 255, 255)

  position = 'right'
  chop_timer = 0
  logs = {
    'blank',
    'left',
    'blank',
    'right'
  }
end

function love.update(delta_time)
  chop_timer = chop_timer + delta_time
end

function love.draw()
  man_image = man2

  if chop_timer < 0.1 then
    man_image = man
  end

  if position == 'right' then
    man_x = 700
    scale_x = 1
  else
    man_x = 100
    scale_x = -1
  end

  love.graphics.draw(
    man_image,
    man_x, 300,
    0,
    scale_x, 1,
    man:getWidth()/2, 0
  )

  for index, direction in ipairs(logs) do
    log_image = log_blank
    scale_x = 1
    if direction == 'right' then
      log_image = log_right
    elseif direction == 'left' then
      log_image = log_right
      scale_x = -1
    end
    love.graphics.draw(
      log_image,
      400, 600 - (index * log_image:getHeight()),
      0,
      scale_x, 1,
      log_image:getWidth()/2, 0
    )
  end
end

function love.keypressed(key)
  if key == 'right' then
    position = 'right'
    chop()
  elseif key == 'left' then
    position = 'left'
    chop()
  end
end

function chop()
  chop_timer = 0
end
