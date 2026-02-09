function love.load()
  love.graphics.setDefaultFilter("nearest", "nearest")
  font = love.graphics.newFont("gamefont.ttf")
  love.graphics.setFont(font)
end

function love.update()

end

function love.draw()
  love.graphics.setColor(0.9,0.9,0.9,1)
  love.graphics.rectangle("fill",100,200,200,200)
  love.graphics.setColor(0,0,0,1)
  love.graphics.rectangle("fill",120,220,160,160)
  love.graphics.setColor(0.9,0.9,0.9,1)
  love.graphics.print("play game",140,240,0,2,2)
  love.graphics.print("press 1",140,300,0,2.5,4)
end

function love.keypressed(key)
  if key == "1" then
    dofile("game.lua")
    love.load()
  end
end