--
-- ASCENSEUR HORIZONTALE
--

HASCENSOR  		 		= {}

HASCENSOR.HANDCURSOR 	= LM.getSystemCursor("hand")
HASCENSOR.arrBOXSIZE	= {x = 32, y = 16}

HASCENSOR.FILECOLOR		= {.3, .3, .3, .5}
HASCENSOR.LINECOLOR		= {.8, .8, .3, .3}

HASCENSOR.ENABLEDCOLOR	= CPC.BRIGHTWHITE
HASCENSOR.DISABLEDCOLOR	= {.6, .6, .6, .6}
HASCENSOR.SELECTCOLOR	= CPC.BRIGHTMARGENTA

HASCENSOR.arrTEXTCOLOR	= {HASCENSOR.DISABLEDCOLOR, HASCENSOR.ENABLEDCOLOR, HASCENSOR.ENABLEDCOLOR}

HASCENSOR.arrBOXTEXTOFS = {x = 4, y = -6}
HASCENSOR.arrBOXTEXT	= {" -- ", " 0 "," + "}

HASCENSOR.STEP			= 0
HASCENSOR.STEPMIN		= 0
HASCENSOR.STEPMAX		= 0

--
local isCollidedBox1 = function()
--
	if HASCENSOR.STEP == HASCENSOR.STEPMIN then 
	--
		HASCENSOR.arrTEXTCOLOR[1] = HASCENSOR.DISABLEDCOLOR
		return false
	--
	else
	--
		HASCENSOR.arrTEXTCOLOR[1] = HASCENSOR.ENABLEDCOLOR
	--
	end
	--
	local AABB = CheckCollision(LM.getX(), LM.getY(), 1, 1, 
								HASCENSOR.arrPosition.x, HASCENSOR.arrPosition.y,
								HASCENSOR.arrBOXSIZE.x, HASCENSOR.arrBOXSIZE.y)
	--	
	if AABB then 
	--
		LM.setCursor(HASCENSOR.HANDCURSOR)
		HASCENSOR.arrTEXTCOLOR[1] = HASCENSOR.SELECTCOLOR
	--
	end
	--
	return AABB
--
end

--
local isCollidedBox3 = function()
--
	if HASCENSOR.STEP == HASCENSOR.STEPMAX then	
	--
		HASCENSOR.arrTEXTCOLOR[3] = HASCENSOR.DISABLEDCOLOR
		return false
	--
	else
	--
		HASCENSOR.arrTEXTCOLOR[3] = HASCENSOR.ENABLEDCOLOR
	--
	end
	--
	local posXBOX = HASCENSOR.arrPosition.x + (HASCENSOR.arrBOXSIZE.x * 2)
	--
	local AABB = CheckCollision(LM.getX(), LM.getY(), 1, 1, 
								posXBOX, HASCENSOR.arrPosition.y,
								HASCENSOR.arrBOXSIZE.x, HASCENSOR.arrBOXSIZE.y)
	--
	if AABB then 
	--
		LM.setCursor(HASCENSOR.HANDCURSOR) 
		HASCENSOR.arrTEXTCOLOR[3] = HASCENSOR.SELECTCOLOR
	--
	end
	--
	return AABB
--
end

--
HASCENSOR.Load = function(pos)
--
	HASCENSOR.arrPosition = pos
--
end

--
HASCENSOR.Update = function()
--
	isCollidedBox1()	
	isCollidedBox3()
--
end

--
HASCENSOR.Draw = function()
--
	for r = 1,3 do
	--
		local posX = ((r - 1) * HASCENSOR.arrBOXSIZE.x) + HASCENSOR.arrPosition.x
		local posY = HASCENSOR.arrPosition.y
		--
		DrawBox(posX, posY,
				HASCENSOR.arrBOXSIZE.x, HASCENSOR.arrBOXSIZE.y, 
				HASCENSOR.FILECOLOR, HASCENSOR.LINECOLOR)
		
		-- Affiche les TEXTES
		LG.setColor(unpack(HASCENSOR.arrTEXTCOLOR[r]))
		--
		posX = posX + HASCENSOR.arrBOXTEXTOFS.x
		posY = posY + HASCENSOR.arrBOXTEXTOFS.y
		--
		LG.print(HASCENSOR.arrBOXTEXT[r], posX, posY )
	--
	end	
--
end

--
HASCENSOR.MousePressed = function(mx, my, button, istouch)
--
	HASCENSOR.STEP = isCollidedBox1() and HASCENSOR.STEP - 1 or HASCENSOR.STEP
	HASCENSOR.STEP = (HASCENSOR.STEP < HASCENSOR.STEPMIN) and HASCENSOR.STEPMIN or HASCENSOR.STEP
	--
	HASCENSOR.STEP = isCollidedBox3() and HASCENSOR.STEP + 1 or HASCENSOR.STEP
	HASCENSOR.STEP = (HASCENSOR.STEP > HASCENSOR.STEPMAX) and HASCENSOR.STEPMAX or HASCENSOR.STEP	
	--
	HASCENSOR.arrBOXTEXT[2] = " "..HASCENSOR.STEP.." "
--
end