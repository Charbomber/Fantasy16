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
editpalette=1
editcolor=2
editcolorvalue=1
highlight=12
lowlight=8

buttontimer=0

function love.load()
  bg(1,1)


end

function love.update()
	
	if btn(6) then
		if (buttontimer<1) then
			editpalette = editpalette + 1
			if (editpalette > 8) then editpalette = 1 end
			buttontimer = 15
		end
	end
	if btn(5) then
		if (buttontimer<1) then
			editcolor = editcolor + 1
			if (editcolor > 16) then editcolor = 1 end
			buttontimer = 15
		end
	end
	if btn(7) then
		palettes[editpalette][editcolor][editcolorvalue] = palettes[editpalette][editcolor][editcolorvalue] - 1
		if palettes[editpalette][editcolor][editcolorvalue]<=0 then
			palettes[editpalette][editcolor][editcolorvalue] = 0
		end
	end
	if btn(8) then
		palettes[editpalette][editcolor][editcolorvalue] = palettes[editpalette][editcolor][editcolorvalue] + 1
		if palettes[editpalette][editcolor][editcolorvalue]>=255 then
			palettes[editpalette][editcolor][editcolorvalue] = 255
		end
	end
	if dbtn(1) then
		--for i=#palettes[editpalette]
		--if love.mouse.getX() and love.mouse.getY() then
			
		--end
	end
	
	buttontimer = buttontimer-1
	timeopen=timeopen+1
end

function love.draw()
	
	local ico1col = 12
	local ico2col = 12
	local ico3col = 12
	local ico4col = 12
	if (editormode<3) or (editormode>3) then
		for i=1,#palettes[uipalette] do
			rect((i-1)*4,0,i*4+4,4,true,uipalette,i,true)
		end
	end
  
	if editormode==2 then 
		ico1col=10 
	end
	if editormode==3 then 
		ico2col=10 
		line(196,96,196,112,uipalette,12)
		line(188,104,204,104,uipalette,12)
		line(188-64,104,204-64,104,uipalette,12)
		love.graphics.print(palettes[editpalette][editcolor][1]..", "..palettes[uipalette][editcolor][2]..", "..palettes[uipalette][editcolor][3],(188-40)*2,104*2)
		for i=1,#palettes[editpalette] do
			rect((i-1)*4,0,i*4+4,4,true,editpalette,i,true)
		end
		if editcolor==highlight then rect((editcolor-1)*4,0,editcolor*4,4,false,uipalette,lowlight) else rect((editcolor-1)*4,0,editcolor*4,4,false,uipalette,highlight) end
	end
	if (editormode>1) then
		rect(65,0,512,5,true,uipalette,2)
		line(0,6,512,6,uipalette,2)
	end
	if editormode==4 then 
		ico3col=10 
	end
	if editormode==5 then 
		ico4col=10 
	end

	rect(70,0,111,10,true,uipalette,3)
	icon(72,1,0,1,ico1col)
	icon(82,1,1,1,ico2col)
	icon(92,1,2,1,ico3col)
	icon(102,1,3,1,ico4col)
end
