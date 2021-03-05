--  ___      ___
-- |   |    /  /
-- |   |   /  /____
-- |   |  |   /    \
-- |   |  |  |  __  \
-- |   |  |    /  \  \
-- |   |  |   |    | /
-- |   |   \   \__/ /
-- |___|    \______/

require("reqs")
timeopen=1
editormode=3
uipalette=1

function love.load()
  bg(1,1)


end

function love.update()
	
	
	
	timeopen=timeopen+1
end

function love.draw()
	
	local ico1col = 12
	local ico2col = 12
	local ico3col = 12
	local ico4col = 12
	if editormode==2 then 
		ico1col=10 
	end
	if editormode==3 then 
		ico2col=10 
		line(196,96,196,112,uipalette,12)
		line(188,104,204,104,uipalette,12)
		line(188-64,104,204-64,104,uipalette,12)
		love.graphics.print()
	end
	if editormode==4 then 
		ico3col=10 
	end
	if editormode==5 then 
		ico4col=10 
	end
	
  if editormode>1 then
    for i=1,#palettes[uipalette] do
      rect((i-1)*4,0,4+i*4,4,true,uipalette,i)
    end
    rect(65,0,512,5,true,uipalette,2)
	line(0,6,512,6,uipalette,2)
  end
	rect(70,0,111,10,true,uipalette,3)
	icon(72,1,0,1,ico1col)
	icon(82,1,1,1,ico2col)
	icon(92,1,2,1,ico3col)
	icon(102,1,3,1,ico4col)
end
