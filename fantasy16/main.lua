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

function love.load()
  bg(1,1)


end

function love.update()



  timeopen=timeopen+1
end

function love.draw()

  if editormode>0 then
    for i=1,#palettes[1] do
      rect(0+i*4,0,4+i*4,4,true,1,i)
    end
    rect(65,0,512,5,true,1,2)
    rect(0,6,512,6,false,1,2)
  end

  if editormode==1 then

  else

  end
end
