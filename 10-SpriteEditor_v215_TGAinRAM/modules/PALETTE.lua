
--
-- Barre de couleurs - v0.0.2
--

PALETTE	= {}
--
PALETTE.COLORS				= 28
PALETTE.COLORINDEX			= 1							  -- Index  selectionée
PALETTE.HANDCURSOR			= LM.getSystemCursor("hand")  -- Cursor survole
PALETTE.LINE		 		= {.8,.8,.3,.1}				  -- Color  line
PALETTE.arrPALETTE			= CPC.PALETTE	 			  -- Palette CPC
--
PALETTE.BOXSIZE 	  		= 16						  -- Taille boite de couleur
--
PALETTE.BOXSIZESELECT  		= PALETTE.BOXSIZE * .2 		  -- Taille boite selectionée
PALETTE.BOXOFFSETSELECT		= {}			 			  -- Offset boite selectionée
PALETTE.LINECOLLIDED		= { 1,.8, 1,1}				  -- Color  line collision
PALETTE.SELECTED			= {1,1,1,1}				  -- Color  boite selectionée

--
-- Variables
--
local LineColor	= {}

--
-- Dessine la boite de la couleur selectionée
--
local DrawBoxSelected = function()
--
	local posY = PALETTE.BOXOFFSETSELECT.H + PALETTE.Position.y
	local posX = PALETTE.BOXOFFSETSELECT.W + PALETTE.Position.x +
				 ((PALETTE.COLORINDEX - 1) * PALETTE.BOXSIZE)	
	--
	DrawBoxFill(posX, posY, 
				PALETTE.BOXSIZESELECT, PALETTE.BOXSIZESELECT, 
				PALETTE.SELECTED)
--
end

--
-- Dessine les boites de couleur
--
local DrawBoxColors = function()
--
	for idx = 1, PALETTE.COLORS do
	--
		local posX = PALETTE.Position.x + ((idx - 1) * PALETTE.BOXSIZE)
		DrawBoxFill(posX, PALETTE.Position.y, PALETTE.BOXSIZE, PALETTE.BOXSIZE,	PALETTE.arrPALETTE[idx])
		DrawBoxLine(posX, PALETTE.Position.y, PALETTE.BOXSIZE - 1, PALETTE.BOXSIZE, LineColor[idx])
	--
	end		
--
end

--
-- Detecte si il y a collition sur un index de couleur
--
local isCollided = function(idxColor)
--
	local posX = ((idxColor - 1) * PALETTE.BOXSIZE) + PALETTE.Position.x
	local posY = PALETTE.Position.y
	--
	local AABB = CheckCollision(LM.getX(), LM.getY(), 1, 1, 
								posX, posY, 
								PALETTE.BOXSIZE, PALETTE.BOXSIZE)
	--
	if AABB then LM.setCursor(PALETTE.HANDCURSOR) end
	--
	return AABB
--
end

--
-- Place dans ColorIndex l'index de la couleur selectionée
--
local setColorIndex = function ()
--
	for idx = 1, PALETTE.COLORS do
	--
		PALETTE.COLORINDEX = isCollided(idx) and idx or  PALETTE.COLORINDEX
	--
	end
--
end

--
-- Update les boites de couleur
--
local UpdateBoxColors = function ()
--
	for idx = 1, PALETTE.COLORS do
	--
		LineColor[idx] = isCollided(idx) and PALETTE.LINECOLLIDED or PALETTE.LINE
	--
	end	
--
end

--
-- Initialise les variables
--
PALETTE.Load = function(pos)
--
	-- Position de la palette
	PALETTE.Position = pos	
	
	-- Calcule les Offsets de la boite de selection de la couleur
	PALETTE.BOXOFFSETSELECT	= {H = 2, W = PALETTE.BOXSIZE - PALETTE.BOXSIZESELECT - 2}
	
	-- Initialise la matrice LineColore
	for idx = 1, PALETTE.COLORS do LineColor[idx] = PALETTE.LINE end
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
	--
	-- if not isCollided() then return end
	--
	if button == 1 then setColorIndex() end
--
end
