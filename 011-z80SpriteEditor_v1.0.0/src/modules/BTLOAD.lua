
--
-- Bouton de Chargement
--

BTLOAD = {}
BTLOAD.param = {}
BTLOAD.param.DIMENSION	= {h = 32, w = 32 * 6}					-- Dimension
BTLOAD.param.FILLCOLOR	= CPC.BLUE								-- Couleur du bouton
BTLOAD.param.FONT		= LG.newFont("fonts/fbuton.ttf", 25) 	-- Font
BTLOAD.param.HANDCURSOR = LM.getSystemCursor("hand")			-- Cursor
BTLOAD.param.LINECOLOR	= {.8,.8,.3,1}							-- Couleur Bordure
BTLOAD.param.TEXTCOLOR	= CPC.BRIGHTWHITE						-- Couleur de text
BTLOAD.param.TEXTOFFSET	= {x = 25, y = 5}						-- Offset du text
--
local isCollided = function()
--
	local AABB = CheckCollision(LM.getX(), LM.getY(), 1, 1, 
						  BTLOAD.Position.x, BTLOAD.Position.y,
						  BTLOAD.param.DIMENSION.w, BTLOAD.param.DIMENSION.h)
	--
	if AABB then LM.setCursor(BTLOAD.param.HANDCURSOR) end
	--
	return AABB
--
end
--
local onClick = function() end
--
BTLOAD.Load  = function(pos, text, callBack)
--
	BTLOAD.text 	 = text
	BTLOAD.Position  = pos
	onClick 		 = callBack or onClick
--
end
--
BTLOAD.Draw = function ()
--
	DrawBox(BTLOAD.Position.x, BTLOAD.Position.y,
			BTLOAD.param.DIMENSION.w, BTLOAD.param.DIMENSION.h,
			BTLOAD.param.FILLCOLOR, BTLOAD.param.LINECOLOR)	
	--
	LG.setFont(BTLOAD.param.FONT)
	LG.setColor(unpack(BTLOAD.param.TEXTCOLOR))
	LG.print(BTLOAD.text, 
			 BTLOAD.Position.x + BTLOAD.param.TEXTOFFSET.x, 
			 BTLOAD.Position.y + BTLOAD.param.TEXTOFFSET.y)
--
end
--
BTLOAD.Update = function()
--
	BTLOAD.param.TEXTCOLOR = isCollided() and CPC.BRIGHTMARGENTA or CPC.BRIGHTWHITE
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