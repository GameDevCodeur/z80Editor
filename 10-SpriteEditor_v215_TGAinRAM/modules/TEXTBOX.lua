--
-- TEXTBOX
--

TEXTBOX  			= {}
TEXTBOX.HANDCURSOR 	= LM.getSystemCursor("hand")	-- Cursor
TEXTBOX.arrSIZE		= {x = 32*10, y = 32*1}
TEXTBOX.LINE		= {.8,.8,.3,.1}
TEXTBOX.FILE 		= {1,1,1,1}
--
TEXTBOX.TEXT	 	= ""
TEXTBOX.TEXTCOLOR 	= {0,0,.5,1}
TEXTBOX.TEXTOFFSET  = {x=5,y=5}
TEXTBOX.CURSOR		= "|"

TEXTBOX.COUNT		= 0
TEXTBOX.MAX			= 10
--
TEXTBOX.SELECTED	= false


local isCollided = function()
--
	local AABB = CheckCollision(LM.getX(), LM.getY(), 1, 1, 
								TEXTBOX.arrPosition.x, TEXTBOX.arrPosition.y,
								TEXTBOX.arrSIZE.x, TEXTBOX.arrSIZE.y)
	--
	if AABB then LM.setCursor(TEXTBOX.HANDCURSOR) end
	--
	return AABB
--
end

TEXTBOX.KeyPressed = function(key)
--
	if not TEXTBOX.SELECTED then return end
	--
	if key == "backspace" then
	--
		TEXTBOX.TEXT  = string.sub(TEXTBOX.TEXT, 1, - 4).." "..TEXTBOX.CURSOR
		TEXTBOX.COUNT = TEXTBOX.COUNT - 1
	--
	elseif key == "kpenter" or key == "return" then
	--
		TEXTBOX.TEXT = string.gsub(TEXTBOX.TEXT, TEXTBOX.CURSOR,"")
		TEXTBOX.TEXT = string.gsub(TEXTBOX.TEXT, " ", "")
		TEXTBOX.SELECTED = false		
		TEXTBOX.COUNT = 0
		
		if (#TEXTBOX.TEXT==0) then
		--
			TEXTBOX.TEXT = "Z80SCR"
		--
		end
	--
	end
--
end
--
TEXTBOX.TextInput 	= function(TEXT)
--
	if not TEXTBOX.SELECTED then return end	
	
	--
	if(TEXTBOX.COUNT >= TEXTBOX.MAX) then return end
	
	-- allow only lowercase a-z (also no spaces, etc)	
	TEXTBOX.TEXT = TEXTBOX.TEXT..TEXT:gsub("[^a-z-0-9]", "")
	--
	TEXTBOX.TEXT = string.gsub(TEXTBOX.TEXT, " ","")
	TEXTBOX.TEXT = string.gsub(TEXTBOX.TEXT, TEXTBOX.CURSOR,"").." "..TEXTBOX.CURSOR
	TEXTBOX.TEXT = string.upper(TEXTBOX.TEXT)
	
	TEXTBOX.COUNT = #TEXTBOX.TEXT - 2
	--	
--
end

TEXTBOX.onClick = function()
--
--
end

--
TEXTBOX.Load = function(pos, text, callBack)
--
	TEXTBOX.arrPosition = pos
	TEXTBOX.TEXT	 	= text
	TEXTBOX.onClick  	= (callBack == nil) and TEXTBOX.onClick or callBack
--
end

--
TEXTBOX.Update = function()
--
	isCollided()
--
end

--
TEXTBOX.Draw = function()
--
	local posX =  TEXTBOX.arrPosition.x
	local posY =  TEXTBOX.arrPosition.y
	--
	DrawBox(posX, posY,	TEXTBOX.arrSIZE.x, TEXTBOX.arrSIZE.y, TEXTBOX.FILE, TEXTBOX.LINE)
	--
	LG.setColor(unpack(TEXTBOX.TEXTCOLOR))
	--
	LG.print(TEXTBOX.TEXT, 
			 TEXTBOX.arrPosition.x + TEXTBOX.TEXTOFFSET.x, 
			 TEXTBOX.arrPosition.y + TEXTBOX.TEXTOFFSET.y)
--
end

TEXTBOX.MousePressed = function(mx, my, button, istouch)
--
	if not isCollided() then return end
	--
	if button == 1 then 
	--
		--
		TEXTBOX.SELECTED = true
		TEXTBOX.TEXT = TEXTBOX.CURSOR		
		--
		TEXTBOX.onClick()
	--
	end
	
--
end
