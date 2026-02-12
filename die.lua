function love.load()
  love.graphics.setDefaultFilter("nearest", "nearest")
  font = love.graphics.newFont("gamefont.ttf")
  love.graphics.setFont(font)
  love.graphics.setBackgroundColor(0.1,0,0,1)
end

function love.update()
  if love.keyboard.isDown("1") then
    loadfile("game.lua")()
    love.load()
  end
  
  if love.keyboard.isDown("2") then
    loadfile("menu.lua")()
    love.load()
  end
end

function love.draw()
  love.graphics.setColor(0.9,0.2,0.2,1)
  love.graphics.rectangle("fill",100,200,200,200)
  love.graphics.setColor(0,0,0,1)
  love.graphics.rectangle("fill",120,220,160,160)
  love.graphics.setColor(0.9,0.2,0.2,1)
  love.graphics.print("try again",140,240,0,2,2)
  love.graphics.print("press 1",140,300,0,2.5,4)
  
  love.graphics.setColor(0.9,0.2,0.2,1)
  love.graphics.rectangle("fill",500,200,200,200)
  love.graphics.setColor(0,0,0,1)
  love.graphics.rectangle("fill",520,220,160,160)
  love.graphics.setColor(0.9,0.2,0.2,1)
  love.graphics.print("to menu",540,240,0,2,2)
  love.graphics.print("press 2",540,300,0,2.5,4)
end
