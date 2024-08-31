--
-- IDXPALETTE
--

IDXPALETTE 				= {}
IDXPALETTE.HANDCURSOR 	= LM.getSystemCursor("hand")
IDXPALETTE.BOXSIZE 		= 32
--
IDXPALETTE.LINE			= CPC.RED
IDXPALETTE.LINECOLOR	= CPC.BRIGHTWHITE
IDXPALETTE.LINEOVER		= CPC.BRIGHTMARGENTA
--
IDXPALETTE.SELECTED		= 0

--
IDXPALETTE.IMAGE		= nil

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
								IDXPALETTE.Position.x, IDXPALETTE.Position.y, 
								IDXPALETTE.BOXSIZE, IDXPALETTE.BOXSIZE)
	--
	if AABB then LM.setCursor(IDXPALETTE.HANDCURSOR) end
	--
	return AABB
--
end

--
IDXPALETTE.Load = function(pos)
--
	IDXPALETTE.Position = pos
	IDXPALETTE.IMAGE = loadTransparent("gfx/idx.png", 0, 0, 0)
--
end

--
IDXPALETTE.Update = function()
--
	IDXPALETTE.LINE = isCollided() and IDXPALETTE.LINEOVER or IDXPALETTE.LINECOLOR
--
end

--
IDXPALETTE.Draw = function()
--
	LG.setColor(1,1,1,1)
	--
	LG.draw(IDXPALETTE.IMAGE, IDXPALETTE.Position.x, IDXPALETTE.Position.y)
	--
	DrawBoxLine(IDXPALETTE.Position.x, IDXPALETTE.Position.y,	IDXPALETTE.BOXSIZE, IDXPALETTE.BOXSIZE, IDXPALETTE.LINE)
--
end

--
IDXPALETTE.MousePressed = function(mx, my, button, istouch)
--
	if isCollided() then
	--
		IDXPALETTE.SELECTED 	= (IDXPALETTE.SELECTED == 0) and 1 or 0
		IDXPALETTE.LINECOLOR	= (IDXPALETTE.SELECTED == 1) and IDXPALETTE.LINEOVER or  CPC.BRIGHTWHITE
		
	--
	end
	--	
--
end