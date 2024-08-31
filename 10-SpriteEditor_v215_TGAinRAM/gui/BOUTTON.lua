--
--  BUTTON Représente un contrôle bouton
--

BUTTON = {}

BUTTON.POSITION		= {x=0, y=0}

BUTTON.HANDCURSOR 	= LM.getSystemCursor("hand")
BUTTON.BOXSIZE 		= {x=32, y=32}
--
BUTTON.LINE			= {1,1,1,1}
----
BUTTON.TEXT			= ""
BUTTON.TEXTOVER		= ""
BUTTON.TEXTCOLOR  	= LG.setColor(1,1,1,1)
--
BUTTON.SELECTED		= false
--
BUTTON.IMAGE		= nil
BUTTON.IMAGECOLOR	= {1,1,1,1}

--
BUTTON.NEW = function(pos, text, imagePath, callBack)
--
	local loadTransparent = function(imagePath, R, G, B)
	--
		--
		imageData = LI.newImageData(imagePath ) 
		--
		function mapFunction(x, y, r, g, b, a)
		--
			--
			if r == R and g == G and b == B then a = 0 end
			--
			return r,g,b,a
			--
		--
		end
		--
		imageData:mapPixel( mapFunction )
		--
		return LG.newImage( imageData )
	--
	end

    return setmetatable(
						{
							POSITION	= pos,
							TEXT 		= text,							
							onClick 	= (callBack == nil) and BUTTON.onClick or callBack,
							HANDCURSOR 	= LM.getSystemCursor("hand"),
							SELECTED	= false,
							IMAGE		= (imagePath) and loadTransparent(imagePath, 0, 0, 0) or nil,
							IMAGECOLOR	= {1,1,1,1},
							TEXTOVER	= "",
							SIZE 		= {x=32,y=32},
							LINE		= {1,1,1,1},
							TEXTCOLOR	= {1,1,1,1}
							
						}, 	{ __index = BUTTON })
--
end

--
BUTTON.onClick = function() end

--
BUTTON.Update = function(self)
--
	--
	self.TEXTOVER = self:Collided() and self.TEXT or ""
	--
--
end

--
BUTTON.Draw = function(self)
--
	--
	local posX = self.POSITION.x
	local posY = self.POSITION.y
	--
	LG.setColor(unpack(self.TEXTCOLOR))
	LG.print(self.TEXTOVER, posX, posY - 32)	
	--
	if (self.IMAGE) then
	--
		--
		LG.setColor(unpack(self.IMAGECOLOR))
		LG.draw(self.IMAGE, self.POSITION.x, self.POSITION.y)
		--
	--
	end
	--	
	DrawBoxLine(posX, posY,	self.SIZE.x, self.SIZE.y, self.LINE)
	--
--
end

--
BUTTON.MousePressed = function(self, mx, my, button, istouch)
--
	--
	if not self:Collided() then return end	
	--
	if button == 1 then	
	--
		self.SELECTED = not (self.SELECTED)
		self.onClick()
	--
	end
	--	
--
end

--
BUTTON.Collided = function(self)
--
	--
	local AABB = guiCollided(LM.getX(), LM.getY(), 1, 1, 
							 self.POSITION.x, self.POSITION.y, 
							 self.SIZE.x, self.SIZE.y)
	--
	if AABB then LM.setCursor(self.HANDCURSOR) end
	--
	return AABB
	--
--
end


