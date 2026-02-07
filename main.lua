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
  
  monsters = {}
  createmon()
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
  
  --gun and bullet
  gun.x = corn.x + 90
  gun.y = corn.y + 50
  gun.r = math.atan2(dy, dx)
  
  --if love.mouse.isDown(1) then
    --shoot()
  --end
  
  function love.mousepressed()
    shoot()
  end
  
  for i, bullet in ipairs(bullets) do
    bullet.x = bullet.x + math.cos(bullet.r) * 900 * dt
    bullet.y = bullet.y + math.sin(bullet.r) * 900 * dt
  end

  --monster
  if love.keyboard.isDown("y") then
    createmon()
  end
  

  for mi, monster in ipairs(monsters) do
    for bi, bullet in ipairs(bullets) do
      if bullet.x + 20 > monster.x and bullet.x - 20 < monster.x + 80 then
        if bullet.y + 20 > monster.y and bullet.y - 20 < monster.y + 80 then
          monster.hp = monster.hp - 1
          table.remove(bullets, bi)
        end
      end
    end
  end
  
  for i, monster in ipairs(monsters) do
    if monster.hp < 1 then
      table.remove(monsters, i)
    end
  end
  
  for i, monster in ipairs(monsters) do
    monster.mdy = (corn.y+40) - monster.y
    monster.mdx = (corn.x+40) - monster.x
    monster.r = math.atan2(monster.mdy, monster.mdx) - 3.15
  end
  
  for i, monster in ipairs(monsters) do
    monster.x = monster.x - math.cos(monster.r) * 100 * dt
    monster.y = monster.y - math.sin(monster.r) * 100 * dt
    if monster.x == corn.x and monster.y == corn.y then
      monster.x = monster.x + math.random(-200,200)
      monster.y = monster.y + math.random(-200,200)
    end
  end
  
  for i, monster in ipairs(monsters) do
    if monster.timer > 0 then
      monster.timer = monster.timer - dt
    end
    if monster.timer <= 0 then
      monster.timer = 3
      monster.x = monster.x + math.random(-50,50)
      monster.y = monster.y + math.random(-50,50)
    end
  end
  
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
  
  --bullet
  for i,bullet in ipairs(bullets) do
    love.graphics.setColor(0.9,0,0,1)
    love.graphics.circle("fill",bullet.x,bullet.y,20)
    love.graphics.setColor(1,1,1,1)
    love.graphics.circle("fill",bullet.x,bullet.y,14)
  end
  --monsters
  for monster, monster in ipairs(monsters) do
    love.graphics.setColor(1,1,1,1)
    love.graphics.draw(monster.spr, monster.x, monster.y,monster.r,10,10,4,4)
  end
  
end

function shoot()
  bullet = {
    x = gun.x, y = gun.y, r = gun.r
  }
  table.insert(bullets, bullet)
end

function createmon()
  monster = { x = math.random(0,720), y = math.random(0,520), spr = love.graphics.newImage("art/slime.png"), hp = 2, 
  r = 0, timer = 3}
  mdy = corn.y - monster.y
  mdx = corn.x - monster.x
  table.insert(monsters, monster)
end
