function love.load()
  love.graphics.setDefaultFilter("nearest", "nearest")
  love.graphics.setBackgroundColor(0,0.3,0.1,1)
  
  corn = {}
  corn.x = 400
  corn.y = 300
  corn.spr = love.graphics.newImage("art/corn.png")
  corn.speed = 20
  corn.xv = 0
  corn.yv = 0
  corn.stop = false
  
  gun = {}
  gun.x = corn.x + 90
  gun.y = corn.y + 50
  gun.r = 0
  gun.spr = love.graphics.newImage("art/gun.png")
  
  bullets = {}
  
end


function love.update(dt)
  local mx = love.mouse.getX()
  local my = love.mouse.getY()
  
  local dx = mx - gun.x
  local dy = my - gun.y
  
  corn.stop = false
  --corn
  if corn.xv == 0 then
    corn.xv = 0
  end
    
  if corn.yv == 0 then
    corn.yv = 0
  end
  
  corn.y = corn.y + corn.yv
  corn.x = corn.x + corn.xv
  
  if corn.xv < 0 then
    corn.xv = corn.xv + 10 * dt
  end
  
  if corn.xv > 0 then
    corn.xv = corn.xv - 10 * dt
  end
  
  if corn.yv < 0 then
    corn.yv = corn.yv + 10 * dt
  end
  
  if corn.yv > 0 then
    corn.yv = corn.yv - 10 * dt
  end
  
  if love.keyboard.isDown("d") then
   corn.xv = corn.xv + corn.speed * dt
  end
  
  if love.keyboard.isDown("a") then
   corn.xv = corn.xv - corn.speed * dt
  end
  
  if love.keyboard.isDown("s") then
   corn.yv = corn.yv + corn.speed * dt
  end
  
  if love.keyboard.isDown("w") then
   corn.yv = corn.yv - corn.speed * dt
  end
  
  if love.keyboard.isDown("lshift") then
    corn.stop = true
  end
  
  if corn.stop == true then
    if corn.xv > 0 then
      corn.xv = corn.xv - 20 *dt
    end
    
    if corn.xv < 0 then
      corn.xv = corn.xv + 20 *dt
    end
    
    if corn.yv > 0 then
      corn.yv = corn.yv - 20 *dt
    end
    
    if corn.yv < 0 then
      corn.yv = corn.yv + 20 *dt
    end
    
    if corn.xv == 0 then
      corn.xv = 0
    end
    
    if corn.yv == 0 then
      corn.yv = 0
    end
  end
  
  
  -- borders
  if corn.x < 0 then
    corn.xv = -corn.xv/2
    corn.x = 1
  end
  
  if corn.x > 720 then
    corn.xv = -corn.xv/2
    corn.x = 719
  end
  
  if corn.y < 0 then
    corn.yv = -corn.yv/2
    corn.y = 1
  end
  
  if corn.y > 520 then
    corn.yv = -corn.yv/2
    corn.y = 519
  end
  
  --gun
  gun.x = corn.x + 90
  gun.y = corn.y + 50
  gun.r = math.atan2(dy, dx)
  
  --end(stuff that has to be at the end)
  if corn.xv > 50 then
    corn.xv = 50
  end
  
  if corn.yv > 50 then
    corn.yv = 50
  end
  
  if corn.xv < -50 then
    corn.xv = -50
  end
  
  if corn.yv < -50 then
    corn.yv = -50
  end
end


function love.draw()
  --corn
  love.graphics.setColor(1,1,1,1)
  love.graphics.draw(corn.spr,corn.x,corn.y,0,10,10)
  
  --gun
  love.graphics.setColor(1,1,1,1)
  love.graphics.draw(gun.spr,gun.x,gun.y,gun.r,10,10,0,3)
end

function shoot()
  
end
