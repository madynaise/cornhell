function love.load()
  love.graphics.setDefaultFilter("nearest", "nearest")
  font = love.graphics.newFont("gamefont.ttf")
  love.graphics.setFont(font)
  love.graphics.setBackgroundColor(0.15,0.15,0.15,1)
  logo = love.graphics.newImage("art/cornhelllogo.png")
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
  if love.keyboard.isDown("1") then
    loadfile("game.lua")()
    love.load()
  end
  
  love.graphics.setColor(0.9,0.9,0.9,1)
  love.graphics.rectangle("fill",400,200,200,200)
  love.graphics.setColor(0,0,0,1)
  love.graphics.rectangle("fill",420,220,160,160)
  love.graphics.setColor(0.9,0.9,0.9,1)
  love.graphics.print("quit",440,240,0,2,2)
  love.graphics.print("press 3",440,300,0,2.5,4)
  if love.keyboard.isDown("3") then
    love.event.quit()
  end
  
  love.graphics.draw(logo,200,30,0,0.5,0.5)
  
  love.graphics.print("cornhell version 0.1")
end

function love.keypressed(key)
  if key == "1" then
  end
end