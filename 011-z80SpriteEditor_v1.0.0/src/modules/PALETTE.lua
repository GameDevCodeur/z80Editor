
--
-- Barre de couleurs - v0.0.2
--

PALETTE	= {}
--
PALETTE.param 					= {}
PALETTE.param.BOXSIZE 		  	= 32						  -- Taille boite de couleur
PALETTE.param.COLORINDEX		= 1							  -- Index  selectionée
PALETTE.param.HANDCURSOR	  	= LM.getSystemCursor("hand")  -- Cursor survole
PALETTE.param.LINE			  	= {.8,.8,.3,1}				  -- Color  line
PALETTE.param.PALCPCINDEX		= CPC.PALETTE	 			  -- Palette CPC
--
PALETTE.param1 					= {}
PALETTE.param1.BOXSIZESELECT   	= PALETTE.param.BOXSIZE * .2 -- Taille boite selectionée
PALETTE.param1.BOXOFFSETSELECT 	= {}			 			  -- Offset boite selectionée
PALETTE.param1.LINECOLLIDED	  	= { 1,.8, 1,1}				  -- Color  line collision
PALETTE.param1.SELECTED		  	= {.6,.4,.7,1}				  -- Color  boite selectionée

--
-- Variables
--
local LineColor	= {}

--
-- Dessine la boite de la couleur selectionée
--
local DrawBoxSelected = function()
--
	local posY = PALETTE.param1.BOXOFFSETSELECT.H + PALETTE.Position.y
	local posX = PALETTE.param1.BOXOFFSETSELECT.W + PALETTE.Position.x +
				 ((PALETTE.param.COLORINDEX - 1) * PALETTE.param.BOXSIZE)	
	--
	DrawBoxFill(posX, posY, 
				PALETTE.param1.BOXSIZESELECT, PALETTE.param1.BOXSIZESELECT, 
				PALETTE.param1.SELECTED)
--
end

--
-- Dessine les boites de couleur
--
local DrawBoxColors = function()
--
	for idx = 1, PALETTE.Colors do
	--
		local posX = PALETTE.Position.x + ((idx - 1) * PALETTE.param.BOXSIZE)
		DrawBox(posX, PALETTE.Position.y, PALETTE.param.BOXSIZE, PALETTE.param.BOXSIZE, 
				PALETTE.param.PALCPCINDEX[idx], LineColor[idx])
	--
	end
--
end

--
-- Detecte si il y a collition sur un index de couleur
--
local isCollided = function(idxColor)
--
	local posX = ((idxColor - 1) * PALETTE.param.BOXSIZE) + PALETTE.Position.x
	local posY = PALETTE.Position.y
	--
	local AABB = CheckCollision(LM.getX(), LM.getY(), 1, 1, 
								posX, posY, 
								PALETTE.param.BOXSIZE, PALETTE.param.BOXSIZE)
	--
	if AABB then LM.setCursor(PALETTE.param.HANDCURSOR) end
	--
	return AABB
end

--
-- Place dans ColorIndex l'index de la couleur selectionée
--
local setColorIndex = function ()
--
	for idx = 1, PALETTE.Colors do
	--
		PALETTE.param.COLORINDEX = isCollided(idx) and idx or PALETTE.param.COLORINDEX
	--
	end
--
end

--
-- Update les boites de couleur
--
local UpdateBoxColors = function ()
--
	for idx = 1, PALETTE.Colors do
	--
		LineColor[idx] = isCollided(idx) and 
						 PALETTE.param1.LINECOLLIDED or 
						 PALETTE.param.LINE
	--
	end	
--
end

--
-- Initialise les variables
--
PALETTE.Load = function(pos)
--	
	PALETTE.Position 	= pos
	PALETTE.Colors		= 16
	
	-- Calcule les Offsets de la boite de selection
	PALETTE.param1.BOXOFFSETSELECT 	= {H = 1, 
	                                   W = PALETTE.param.BOXSIZE - 
									       PALETTE.param1.BOXSIZESELECT - 1}
	
	-- Initialise la matrice LineColore
	for idx = 1, PALETTE.Colors do LineColor[idx] = PALETTE.param.LINE end
--
end

--
-- Update les boites de couleur.
--
PALETTE.Update = function()
--	
	UpdateBoxColors()
--
end

--
-- Dessine les boites 
--
PALETTE.Draw = function()
--	
	DrawBoxColors()
	DrawBoxSelected()
--
end

--
-- Si button gauche pressed Colorindex = couleur selectionée
--
PALETTE.MousePressed = function(mx, my, button, istouch)
--
	if button == 1 then setColorIndex() end
--
end
