--
-- ASCENSEUR VERTICAL
--

VASCENSOR  		 		= {}

VASCENSOR.HANDCURSOR 	= LM.getSystemCursor("hand")
VASCENSOR.arrBOXSIZE	= {x = 16, y = 32}

VASCENSOR.FILECOLOR		= {.7, .7, .7, 1}
VASCENSOR.LINECOLOR		= {.8, .8, .3, .3}

VASCENSOR.ENABLEDCOLOR	= {.4, .4, 0, 1}
VASCENSOR.DISABLEDCOLOR	= {.4, 0, .4, 1}
VASCENSOR.SELECTCOLOR	= CPC.BRIGHTMARGENTA

VASCENSOR.arrTEXTCOLOR	= {VASCENSOR.DISABLEDCOLOR, VASCENSOR.ENABLEDCOLOR, VASCENSOR.ENABLEDCOLOR}

VASCENSOR.arrBOXTEXTOFS = {x = -4, y = 2}
VASCENSOR.arrBOXTEXT	= {" -- ", " 0 "," + "}

VASCENSOR.STEP			= 0
VASCENSOR.STEPMIN		= 0
VASCENSOR.STEPMAX		= 0

--
local isCollidedBox1 = function()
--
	if VASCENSOR.STEP == VASCENSOR.STEPMIN then 
	--
		VASCENSOR.arrTEXTCOLOR[1] = VASCENSOR.DISABLEDCOLOR
		return false
	--
	else
	--
		VASCENSOR.arrTEXTCOLOR[1] = VASCENSOR.ENABLEDCOLOR
	--
	end
	--
	local AABB = CheckCollision(LM.getX(), LM.getY(), 1, 1, 
								VASCENSOR.arrPosition.x, VASCENSOR.arrPosition.y,
								VASCENSOR.arrBOXSIZE.x, VASCENSOR.arrBOXSIZE.y)
	--	
	if AABB then 
	--
		LM.setCursor(VASCENSOR.HANDCURSOR)
		VASCENSOR.arrTEXTCOLOR[1] = VASCENSOR.SELECTCOLOR
	--
	end
	--
	return AABB
--
end

--
local isCollidedBox3 = function()
--
	if VASCENSOR.STEP == VASCENSOR.STEPMAX then	
	--
		VASCENSOR.arrTEXTCOLOR[3] = VASCENSOR.DISABLEDCOLOR
		return false
	--
	else
	--
		VASCENSOR.arrTEXTCOLOR[3] = VASCENSOR.ENABLEDCOLOR
	--
	end
	--
	local posYBOX = VASCENSOR.arrPosition.y + (VASCENSOR.arrBOXSIZE.y * 2)
	local posXBOX = VASCENSOR.arrPosition.x
	--
	local AABB = CheckCollision(LM.getX(), LM.getY(), 1, 1, 
								posXBOX, posYBOX,
								VASCENSOR.arrBOXSIZE.x, VASCENSOR.arrBOXSIZE.y)
	--
	if AABB then 
	--
		LM.setCursor(VASCENSOR.HANDCURSOR) 
		VASCENSOR.arrTEXTCOLOR[3] = VASCENSOR.SELECTCOLOR
	--
	end
	--
	return AABB
--
end

--
VASCENSOR.Load = function(pos)
--
	VASCENSOR.arrPosition = pos
--
end

--
VASCENSOR.Update = function()
--
	isCollidedBox1()	
	isCollidedBox3()
--
end

--
VASCENSOR.Draw = function()
--
	for c = 1,3 do
	--
		local posX = VASCENSOR.arrPosition.x
		local posY = ((c - 1) * VASCENSOR.arrBOXSIZE.y) + VASCENSOR.arrPosition.y
		--
		DrawBox(posX, posY,
				VASCENSOR.arrBOXSIZE.x, VASCENSOR.arrBOXSIZE.y, 
				VASCENSOR.FILECOLOR, VASCENSOR.LINECOLOR)
		
		-- Affiche les TEXTES
		LG.setColor(unpack(VASCENSOR.arrTEXTCOLOR[c]))
		--
		posX = posX + VASCENSOR.arrBOXTEXTOFS.x
		posY = posY + VASCENSOR.arrBOXTEXTOFS.y
		--
		LG.print(VASCENSOR.arrBOXTEXT[c], posX, posY )
	--
	end	
--
end

--
VASCENSOR.MousePressed = function(mx, my, button, istouch)
--
	VASCENSOR.STEP = isCollidedBox1() and VASCENSOR.STEP - 1 or VASCENSOR.STEP
	VASCENSOR.STEP = (VASCENSOR.STEP < VASCENSOR.STEPMIN) and VASCENSOR.STEPMIN or VASCENSOR.STEP
	--
	VASCENSOR.STEP = isCollidedBox3() and VASCENSOR.STEP + 1 or VASCENSOR.STEP
	VASCENSOR.STEP = (VASCENSOR.STEP > VASCENSOR.STEPMAX) and VASCENSOR.STEPMAX or VASCENSOR.STEP	
	--
	VASCENSOR.arrBOXTEXT[2] = " "..VASCENSOR.STEP.." "
--
end