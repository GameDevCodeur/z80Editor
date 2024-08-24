
--
-- Bouton de Chargement
--

BTLOAD = {}
BTLOAD.arrBTSIZE	= {x = 32 * 6, y = 32}			-- Dimension
BTLOAD.FILLCOLOR	= CPC.BLUE						-- Couleur du bouton
BTLOAD.HANDCURSOR	= LM.getSystemCursor("hand")	-- Cursor
BTLOAD.LINECOLOR	= {.8, .8, .3, .3}					-- Couleur Bordure
BTLOAD.TEXTCOLOR	= CPC.BRIGHTWHITE				-- Couleur de text
BTLOAD.arrTEXTOFS	= {x = 25, y = 5}				-- Offset du text
--
local isCollided = function()
--
	local AABB = CheckCollision(LM.getX(), LM.getY(), 1, 1, 
						  BTLOAD.arrPosition.x, BTLOAD.arrPosition.y,
						  BTLOAD.arrBTSIZE.x, BTLOAD.arrBTSIZE.y)
	--
	if AABB then LM.setCursor(BTLOAD.HANDCURSOR) end
	--
	return AABB
--
end
--
local onClick = function() end
--
BTLOAD.Load  = function(pos, text, callBack)
--
	BTLOAD.text 		= text
	BTLOAD.arrPosition  = pos
	onClick 		 	= callBack or onClick
--
end
--
BTLOAD.Draw = function ()
--
	DrawBox(BTLOAD.arrPosition.x, BTLOAD.arrPosition.y,
			BTLOAD.arrBTSIZE.x, BTLOAD.arrBTSIZE.y,
			BTLOAD.FILLCOLOR, BTLOAD.LINECOLOR)	
	--
	LG.setColor(unpack(BTLOAD.TEXTCOLOR))
	LG.print(BTLOAD.text, 
			 BTLOAD.arrPosition.x + BTLOAD.arrTEXTOFS.x, 
			 BTLOAD.arrPosition.y + BTLOAD.arrTEXTOFS.y)
--
end
--
BTLOAD.Update = function()
--
	BTLOAD.TEXTCOLOR = isCollided() and CPC.BRIGHTMARGENTA or CPC.BRIGHTWHITE
--
end
--
BTLOAD.MousePressed = function(mx, my, button, istouch)
--
	if not isCollided() then return end	
	--
	if button == 1 then 
	--
		local message = "Etes-vous sur ?"
		local buttons = {"OK", "No!", escapebutton = 2}
		local pressedbutton = LW.showMessageBox(BTLOAD.text, message, buttons, "info", true)
		-- test si OK
		if pressedbutton == 1 then onClick() end
	--
	end
--
end
--