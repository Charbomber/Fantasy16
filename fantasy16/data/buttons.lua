
function btn(btnp)

  if (love.keyboard.isDown('z')) and (btnp==1) then
    return true
  end
  if (love.keyboard.isDown('x')) and (btnp==2) then
    return true
  end
  if (love.keyboard.isDown('c')) and (btnp==3) then
    return true
  end
  if (love.keyboard.isDown('v')) and (btnp==4) then
    return true
  end
  if (love.keyboard.isDown('up')) and (btnp==5) then
    return true
  end
  if (love.keyboard.isDown('down')) and (btnp==6) then
    return true
  end
  if (love.keyboard.isDown('left')) and (btnp==7) then
    return true
  end
  if (love.keyboard.isDown('right')) and (btnp==8) then
    return true
  end
  if (love.keyboard.isDown('a')) and (btnp==9) then
    return true
  end
  if (love.keyboard.isDown('s')) and (btnp==10) then
    return true
  end
end
