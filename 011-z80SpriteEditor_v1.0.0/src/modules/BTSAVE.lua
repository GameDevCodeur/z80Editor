
--
-- Bouton de Sauvegarde
--

BTSAVE = {}
BTSAVE.param = {}
BTSAVE.param.DIMENSION	= {h = 32, w = 32 * 6}				-- Dimension
BTSAVE.param.FILLCOLOR	= CPC.BLUE							-- Couleur du bouton
BTSAVE.param.FONT		= LG.newFont("fonts/fbuton.ttf", 25) -- Font
BTSAVE.param.HANDCURSOR = LM.getSystemCursor("hand")		-- Cursor
BTSAVE.param.LINECOLOR	= {.8,.8,.3,1}						-- Couleur Bordure
BTSAVE.param.TEXTCOLOR	= CPC.BRIGHTWHITE					-- Couleur de text
BTSAVE.param.TEXTOFFSET	= {x = 25, y = 5}					-- Offset du text
--
local isCollided = function()
--
	local AABB = CheckCollision(LM.getX(), LM.getY(), 1, 1, 
						  BTSAVE.Position.x, BTSAVE.Position.y,
						  BTSAVE.param.DIMENSION.w, BTSAVE.param.DIMENSION.h)
	--
	if AABB then LM.setCursor(BTSAVE.param.HANDCURSOR) end
	--
	return AABB
--
end
--
local onClick = function() end
--
BTSAVE.Load  = function(pos, text, callBack)
--
	BTSAVE.text 	 = text
	BTSAVE.Position  = pos
	onClick 		 = callBack or onClick
--
end
--
BTSAVE.Draw = function ()
--
	DrawBox(BTSAVE.Position.x, BTSAVE.Position.y,
			BTSAVE.param.DIMENSION.w, BTSAVE.param.DIMENSION.h,
			BTSAVE.param.FILLCOLOR, BTSAVE.param.LINECOLOR)	
	--
	LG.setFont(BTSAVE.param.FONT)
	LG.setColor(unpack(BTSAVE.param.TEXTCOLOR))
	LG.print(BTSAVE.text, 
			 BTSAVE.Position.x + BTSAVE.param.TEXTOFFSET.x, 
			 BTSAVE.Position.y + BTSAVE.param.TEXTOFFSET.y)
--
end
--
BTSAVE.Update = function()
--
	BTSAVE.param.TEXTCOLOR = isCollided() and CPC.BRIGHTMARGENTA or CPC.BRIGHTWHITE
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