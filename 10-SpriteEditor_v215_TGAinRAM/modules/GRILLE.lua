--
-- GRILLE DE PIXELS
--

GRID = {}
--
GRID.HANDCURSOR 		= LM.getSystemCursor("hand")
GRID.arrPALCPC 			= CPC.PALETTE
GRID.COLORINDEX			= PALETTE.COLORINDEX

GRID.LINE			  	= {.8,.8,.3,.1}
GRID.BOXSIZE			= 16
GRID.SCREENSIZE 		= CPC.M0.SCREENSIZE
--
GRID.arrSIZE			= {x=40, y=40}
GRID.arrCOLORINDEX  	= {}				-- MATRICE COLORINDEX
--
GRID.PENSIZE			= 1
GRID.STEPOFSX			= 0
GRID.STEPOFSY			= 0

--
local isCollided = function()
	
	local AABB = CheckCollision(LM.getX(), LM.getY(), 1, 1, 
								GRID.Position.x, GRID.Position.y, 
								GRID.arrSIZE.x * GRID.BOXSIZE, 
								GRID.arrSIZE.y * GRID.BOXSIZE)
	--
	if AABB then LM.setCursor(GRID.HANDCURSOR) end
--
end

--
local DrawCells = function()
--
	for idy = 1, GRID.arrSIZE.y do
	--
		local posY = ((idy - 1) * GRID.BOXSIZE) + GRID.Position.y
		--
		for idx = 1, GRID.arrSIZE.x do
		--
			local posX = ((idx - 1) * GRID.BOXSIZE) + GRID.Position.x
			local fillColor = GRID.arrPALCPC[GRID.arrCOLORINDEX[idy + GRID.STEPOFSY][idx + GRID.STEPOFSX]]
			DrawBox(posX, posY,	GRID.BOXSIZE, GRID.BOXSIZE, fillColor, GRID.LINE)
		--
		end
	--
	end
--
end
--

local onClick = function() end

--
GRID.Load = function(pos, callBack)
--
	GRID.Position = pos
	GRID.onClick = (callBack == nil) and onClick or callBack
	
	-- Initialise la matrice de la GRID COLORINDEX
	for idy = 1, GRID.SCREENSIZE.y do
	-- Création d'un nouveau rang
		GRID.arrCOLORINDEX[idy] = {}
		-- Remplir la  matrice avec la couleur selectionnée de la PALETTE
		for idx = 1, GRID.SCREENSIZE.x do
		--  
			GRID.arrCOLORINDEX[idy][idx] = GRID.COLORINDEX
		--
		end
	--
	end
--
end

--
GRID.Update = function() isCollided() end

--
GRID.Draw = function() DrawCells() end

--
GRID.MousePressed = function(mx, my, button, istouch)
--
	if (button == 1) then GRID.onClick() end
--
end
