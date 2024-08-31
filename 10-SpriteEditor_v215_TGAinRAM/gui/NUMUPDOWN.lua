--
-- NUMUPDOWN Représente une zone de sélection numérique.
--

NUMUPDOWN  				= {}
NUMUPDOWN.HANDCURSOR 	= LM.getSystemCursor("hand")	-- Cursor
NUMUPDOWN.POSITION		= {x=0, y=0}
--

NUMUPDOWN.arrSIZE		= {x = 32*2, y = 24*1}
NUMUPDOWN.arrIMAGESIZE	= {x = 14, y = 10}

--
NUMUPDOWN.IMAGEDOWNOFS	= {x = 49, y = 13}
NUMUPDOWN.IMAGEUPOFS	= {x = 49, y =  1}

-- 
NUMUPDOWN.IMAGEUP		= LG.newImage("gfx/up.png")
NUMUPDOWN.IMAGEDOWN		= LG.newImage("gfx/down.png")

--
NUMUPDOWN.LINE			= {.8,.8,.3,.1}
NUMUPDOWN.FILE			= {1,1,1,1}

--
NUMUPDOWN.VALUECOLOR 	= {0,0,.5,1}
NUMUPDOWN.VALUEOFFSET	= {x=2,y=-2}

--
NUMUPDOWN.VALUE			= 0
NUMUPDOWN.STEP			= 1
NUMUPDOWN.VALUEMAX		= 255

NUMUPDOWN.NEW = function (pos, step, callBack)
--

	return setmetatable(
						{
							POSITION	= pos,
							onClick 	= (callBack == nil) and NUMUPDOWN.onClick or callBack,
							HANDCURSOR 	= LM.getSystemCursor("hand"),
							arrSIZE		= {x = 32*2, y = 24*1},
							STEP		= 1,
							VALUE		= 0,							
							VALUEMAX	= 255,
							VALUECOLOR 	= { 0, 0,.5, 1},
							LINE		= {.8,.8,.3,.1},
							FILE		= { 1, 1, 1, 1},
							
							IMAGEPOSDOWN = {x = pos.x + NUMUPDOWN.IMAGEDOWNOFS.x, 
											y = pos.y + NUMUPDOWN.IMAGEDOWNOFS.y},
							   
							IMAGEPOSUP	 = {x = pos.x + NUMUPDOWN.IMAGEUPOFS.x, 
											y = pos.y + NUMUPDOWN.IMAGEUPOFS.y}
							
						}, 	{ __index = NUMUPDOWN })
--
end

NUMUPDOWN.isCollidedDOWN = function(self)
--
	local AABB = guiCollided(LM.getX(), LM.getY(), 1, 1, 
							 self.IMAGEPOSDOWN.x, self.IMAGEPOSDOWN.y,
							 NUMUPDOWN.arrIMAGESIZE.x, NUMUPDOWN.arrIMAGESIZE.y)
	--
	if AABB then LM.setCursor(self.HANDCURSOR) end
	--
	return AABB
--
end

--
NUMUPDOWN.isCollidedUP = function(self)
--
	local AABB = guiCollided(LM.getX(), LM.getY(), 1, 1, 
							 self.IMAGEPOSUP.x, self.IMAGEPOSUP.y,
							 NUMUPDOWN.arrIMAGESIZE.x, NUMUPDOWN.arrIMAGESIZE.y)
	--
	if AABB then LM.setCursor(self.HANDCURSOR) end
	--
	return AABB
--
end

--
NUMUPDOWN.onClick = function()
--
--
end

--
NUMUPDOWN.Update = function(self)
--
	self:isCollidedUP()
	self:isCollidedDOWN()
--
end

--
NUMUPDOWN.Draw = function(self)
--
	local posX =  self.POSITION.x
	local posY =  self.POSITION.y	
	--
	DrawBox(posX, posY,	self.arrSIZE.x, self.arrSIZE.y, self.FILE, self.LINE)
	--
	LG.setColor(unpack(self.VALUECOLOR))
	--
	LG.print(string.format("%03d", self.VALUE),
			 posX + NUMUPDOWN.VALUEOFFSET.x, 
			 posY + NUMUPDOWN.VALUEOFFSET.y)
	--	
	LG.setColor(1,1,1,1)
	--
	LG.draw(NUMUPDOWN.IMAGEUP, self.IMAGEPOSUP.x, self.IMAGEPOSUP.y)
	--
	LG.draw(NUMUPDOWN.IMAGEDOWN, self.IMAGEPOSDOWN.x, self.IMAGEPOSDOWN.y)
--
end

NUMUPDOWN.MousePressed = function(self, mx, my, button, istouch)
--
	if (self:isCollidedUP() or self:isCollidedDOWN()) == false then return end
	--
	
	if button == 1 then 
	--
		self.VALUE = self:isCollidedUP()   and self.VALUE + self.STEP or self.VALUE
		self.VALUE = self:isCollidedDOWN() and self.VALUE - self.STEP or self.VALUE
		
		self.VALUE = (self.VALUE > self.VALUEMAX) and self.VALUEMAX or self.VALUE
		self.VALUE = (self.VALUE < 0) and 0 or self.VALUE
		
		--
		self.onClick()
	--
	end
	--	
--
end
