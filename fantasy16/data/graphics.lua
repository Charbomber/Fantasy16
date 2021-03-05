
spritesheet={}

for i=1,32768 do
  spritesheet[i]={
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0
  }
end

spritesheet[1]={
9,9,9,9,9,9,9,9,
9,9,9,9,9,9,9,9,
9,9,9,9,9,9,9,9,
9,9,9,9,9,9,9,9,
9,9,9,9,9,9,9,9,
9,9,9,9,9,9,9,9,
9,9,9,9,9,9,9,9,
9,9,9,9,9,9,9,9
}

function pix(x,y,pal,col)

  love.graphics.setColor(RGBtoDEC(palettes[pal][col]))

  if not (col==1) then
    local pointspots={{x*2, y*2}, {x*2+1, y*2}, {x*2, y*2+1}, {x*2+1, y*2+1}}
    love.graphics.points(pointspots)
  end
end

function rect(x1,y1,x2,y2,fill,pal,col)

  for i=0,x2-x1 do
    pix(x1+i,y1,pal,col)
    pix(x1+i,y2,pal,col)
  end

  for i=0,y2-y1 do
    pix(x1,y1+i,pal,col)
    pix(x2,y1+i,pal,col)
  end

  if (fill) then
    for y=1,y2-y1-1 do
      for x=1,x2-x1-1 do

        pix(x+x1,y+y1,pal,col)

      end
    end
  end
end

function circ(x,y,r,pal,col)  -- WIP
      for i=0, 360 do
            angle = i
            x1 = r * cos(angle * math.pi / 180)
            y1 = r * sin(angle * math.pi / 180)
            pix(math.floor(x + x1), math.floor(y + y1), pal, col)
      end
end

-- Thank you SO MUCH Wikipedia! EDIT: Fuck you SO MUCH Wikipedia!
function line(x0t,y0t,x1,y1,pal,col) -- WIP
    local x0 = x0t
    local y0 = y0t
    local sx=0
    local sy=0
    local dx = math.abs(x1-x0)
    if (x0<x1) then sx=1 else sx=-1 end
    local dy = -math.abs(y1-y0)
    if (y0<y1) then sy=1 else sy=-1 end
    local err = dx+dy
    while (true) do
        pix(x0, y0, pal, col)
        if (sx >= 0) and (sy >= 0) then
          if (x0 >= x1 and y0 >= y1) then break end
        elseif (sx <= 0) and (sy >= 0) then
          if (x0 <= x1 and y0 >= y1) then break end
        elseif (sx >= 0) and (sy <= 0) then
          if (x0 >= x1 and y0 <= y1) then break end
        elseif (sx <= 0) and (sy <= 0) then
          if (x0 <= x1 and y0 <= y1) then break end
        end
        if (sx==0) or (sy==0) then break end
        local e2 = 2*err
        if (e2 >= dy) then
            err = err + dy
            x0 = x0 + sx
        end
        if (e2 <= dx) then
            err = err + dx
            y0 = y0 + sy
        end
    end
end

function spr(x,y,sprite,pal)
  local iy=0
  for i=1,64 do
    pix(x+(i%8),y+iy,pal,spritesheet[sprite][i]+1)
    if (i%8==7) then
      iy = iy + 1
    end
  end
end

function bg(pal,col)
  local paltemp
  if (pal > 8) then
    paltemp=1
  else
    paltemp=pal
  end

  love.graphics.setBackgroundColor(RGBtoDEC(palettes[paltemp][col]))
end


function icon(x,y,iconum,pal,col)
	if (iconum==0) then
		pix(1+x,y,pal,col)
		pix(x,1+y,pal,col)
		pix(x,2+y,pal,col)
		pix(x,3+y,pal,col)
		pix(x,4+y,pal,col)
		pix(x,5+y,pal,col)
		pix(x,6+y,pal,col)
		pix(1+x,7+y,pal,col)
		pix(6+x,y,pal,col)
		pix(7+x,1+y,pal,col)
		pix(7+x,2+y,pal,col)
		pix(7+x,3+y,pal,col)
		pix(7+x,4+y,pal,col)
		pix(7+x,5+y,pal,col)
		pix(7+x,6+y,pal,col)
		pix(6+x,7+y,pal,col)
	elseif (iconum==1) then
		pix(x,7+y,pal,col)
		pix(x,6+y,pal,col)
		pix(x,5+y,pal,col)
		pix(1+x,7+y,pal,col)
		pix(2+x,7+y,pal,col)
		pix(x+1,4+y,pal,col)
		pix(x+2,3+y,pal,col)
		pix(x+3,2+y,pal,col)
		pix(x+4,1+y,pal,col)
		pix(x+5,y,pal,col)
		pix(3+x,6+y,pal,col)
		pix(4+x,5+y,pal,col)
		pix(5+x,4+y,pal,col)
		pix(6+x,3+y,pal,col)
		pix(7+x,2+y,pal,col)
		pix(6+x,1+y,pal,col)
	elseif (iconum==2) then
		pix(x,y,pal,col)
		pix(1+x,y,pal,col)
		pix(2+x,y,pal,col)
		pix(3+x,y,pal,col)
		pix(4+x,y,pal,col)
		pix(5+x,y,pal,col)
		pix(6+x,y,pal,col)
		pix(7+x,y,pal,col)
		pix(x,y+1,pal,col)
		pix(x,y+2,pal,col)
		pix(x,y+3,pal,col)
		pix(x,y+4,pal,col)
		pix(x,y+5,pal,col)
		pix(x,y+6,pal,col)
		pix(x,y+7,pal,col)
		pix(x+1,y+7,pal,col)
		pix(x+2,y+7,pal,col)
		pix(x+3,y+7,pal,col)
		pix(x+4,y+7,pal,col)
		pix(x+5,y+7,pal,col)
		pix(x+6,y+7,pal,col)
		pix(x+7,y+7,pal,col)
		pix(x+7,y+6,pal,col)
		pix(x+7,y+5,pal,col)
		pix(x+7,y+4,pal,col)
		pix(x+7,y+3,pal,col)
		pix(x+7,y+2,pal,col)
		pix(x+7,y+1,pal,col)
		pix(x+1,y+1,pal,col)
		pix(x+3,y+1,pal,col)
		pix(x+5,y+1,pal,col)
		pix(x+2,y+2,pal,col)
		pix(x+4,y+2,pal,col)
		pix(x+6,y+2,pal,col)
		pix(x+1,y+3,pal,col)
		pix(x+3,y+3,pal,col)
		pix(x+5,y+3,pal,col)
		pix(x+2,y+4,pal,col)
		pix(x+4,y+4,pal,col)
		pix(x+6,y+4,pal,col)
		pix(x+1,y+5,pal,col)
		pix(x+3,y+5,pal,col)
		pix(x+5,y+5,pal,col)
		pix(x+2,y+6,pal,col)
		pix(x+4,y+6,pal,col)
		pix(x+6,y+6,pal,col)
	elseif (iconum==3) then
		pix(1+x,7+y,pal,col)
		pix(1+x,6+y,pal,col)
		pix(2+x,7+y,pal,col)
		pix(2+x,6+y,pal,col)
		pix(2+x,5+y,pal,col)
		pix(3+x,6+y,pal,col)
		pix(3+x,5+y,pal,col)
		pix(4+x,4+y,pal,col)
		pix(4+x,3+y,pal,col)
		pix(4+x,2+y,pal,col)
		pix(4+x,1+y,pal,col)
		pix(4+x,y,pal,col)
		pix(5+x,y,pal,col)
		pix(6+x,1+y,pal,col)
	end
end

function RGBtoDEC(col)
  return col[1]/256, col[2]/256, col[3]/256
end

function DECtoRGB(col)
  return col[1]*256, col[2]*256, col[3]*256
end