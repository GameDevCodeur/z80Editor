--
-- SAVE
--

SAVE 				= {}
SAVE.HANDCURSOR 	= LM.getSystemCursor("hand")
SAVE.BOXSIZE 		= 32
--
SAVE.LINE			= CPC.RED
SAVE.LINECOLOR		= CPC.BRIGHTWHITE
SAVE.LINEOVER		= CPC.BRIGHTMARGENTA
--
SAVE.TEXT			= "ASM Export"
SAVE.TEXTOVER		= ""
SAVE.TEXTSELECTED	= "Exporter Palette ASM."
--
SAVE.SELECTED		= 0
--
SAVE.IMAGE			= nil

--
local function loadTransparent(imagePath, transR, transG, transB)
--
	imageData = LI.newImageData( imagePath )
	--
	function mapFunction(x, y, r, g, b, a)
	--
		if r == transR and g == transG and b == transB then a = 0 end
		--
		return r,g,b,a
	--
	end
	--
	imageData:mapPixel( mapFunction )
	--
	return LG.newImage( imageData )
--
end

--
local isCollided = function()
--	
	local AABB = CheckCollision(LM.getX(), LM.getY(), 1, 1, 
								SAVE.Position.x, SAVE.Position.y, 
								SAVE.BOXSIZE, SAVE.BOXSIZE)
	--
	SAVE.TEXTOVER = ""
	--
	if AABB then 
	--
		LM.setCursor(SAVE.HANDCURSOR) 
		--
		SAVE.TEXTOVER = SAVE.TEXT
	--
	end
	--
	if SAVE.SELECTED == 1 then
	--
		SAVE.TEXTOVER = SAVE.TEXTSELECTED
	--
	end
	--
	return AABB
--
end

--
SAVE.Load = function(pos)
--
	SAVE.Position = pos
	SAVE.IMAGE = loadTransparent("gfx/save.png", 0, 0, 0)
--
end

--
SAVE.Update = function()
--
	SAVE.LINE = isCollided() and SAVE.LINEOVER or SAVE.LINECOLOR
--
end

--
SAVE.Draw = function()
--	
	local posX = SAVE.Position.x
	local posY = SAVE.Position.y
	--	
	LG.setColor(1,1,1,1)
	--
	LG.print(SAVE.TEXTOVER, posX - 80, posY - 32)
	--
	LG.draw(SAVE.IMAGE, posX, posY)
	--
	DrawBoxLine(posX, SAVE.Position.y,	SAVE.BOXSIZE, SAVE.BOXSIZE, SAVE.LINE)
--
end

--
SAVE.MousePressed = function(mx, my, button, istouch)
--
	if isCollided() then
	--
		SAVE.SELECTED 	= (SAVE.SELECTED == 0) and 1 or 0
		SAVE.LINECOLOR	= (SAVE.SELECTED == 1) and SAVE.LINEOVER or  {1,1,1,1}		
	--
	end
	--	
--
end