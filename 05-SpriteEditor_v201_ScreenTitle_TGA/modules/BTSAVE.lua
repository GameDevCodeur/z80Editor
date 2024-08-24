
--
-- Bouton de Sauvegarde
--

BTSAVE = {}
BTSAVE.arrSIZE		= {x = 32 * 6, y = 32}				-- Dimension
BTSAVE.FILLCOLOR	= CPC.BLUE							-- Couleur du bouton
BTSAVE.HANDCURSOR 	= LM.getSystemCursor("hand")		-- Cursor
BTSAVE.LINECOLOR	= {.8,.8,.3,.3}						-- Couleur Bordure
BTSAVE.TEXTCOLOR	= CPC.BRIGHTWHITE					-- Couleur de text
BTSAVE.TEXTOFFSET	= {x = 25, y = 5}					-- Offset du text
--
local isCollided = function()
--
	local AABB = CheckCollision(LM.getX(), LM.getY(), 1, 1, 
						  BTSAVE.arrPosition.x, BTSAVE.arrPosition.y,
						  BTSAVE.arrSIZE.x, BTSAVE.arrSIZE.y)
	--
	if AABB then LM.setCursor(BTSAVE.HANDCURSOR) end
	--
	return AABB
--
end
--
local onClick = function() end
--
BTSAVE.Load  = function(pos, text, callBack)
--
	BTSAVE.text 	 	= text
	BTSAVE.arrPosition  = pos
	onClick 		 	= callBack or onClick
--
end
--
BTSAVE.Draw = function ()
--
	DrawBox(BTSAVE.arrPosition.x, BTSAVE.arrPosition.y,
			BTSAVE.arrSIZE.x, BTSAVE.arrSIZE.y,
			BTSAVE.FILLCOLOR, BTSAVE.LINECOLOR)	
	--
	LG.setColor(unpack(BTSAVE.TEXTCOLOR))
	LG.print(BTSAVE.text, 
			 BTSAVE.arrPosition.x + BTSAVE.TEXTOFFSET.x, 
			 BTSAVE.arrPosition.y + BTSAVE.TEXTOFFSET.y)
--
end
--
BTSAVE.Update = function()
--
	BTSAVE.TEXTCOLOR = isCollided() and CPC.BRIGHTMARGENTA or CPC.BRIGHTWHITE
--
end
--
BTSAVE.MousePressed = function(mx, my, button, istouch)
--
	if not isCollided() then return end
	--
	if button == 1 then 
	--
		local message = "Etes-vous sur ?"
		local buttons = {"OK", "No!", escapebutton = 2}
		local pressedbutton = LW.showMessageBox(BTSAVE.text, message, buttons, "info", true)
		-- test si OK
		if pressedbutton == 1 then onClick() end
	--
	end
--
end
--