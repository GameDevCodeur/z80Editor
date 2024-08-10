--
-- GRILLE DE PIXELS
--

GRID = {}
GRID.param 				= {}
GRID.param.PL			= PALETTE.param	-- PARAMETRE DE LA PALETTE
--
GRID.param1				= {}
GRID.param1.DIMENSION 	= 16			-- DIMENSION 
GRID.param1.COLORINDEX  = {}			-- MATRICE COLORINDEX

--
local isCollidedGrid = function()
	
	local AABB = CheckCollision(LM.getX(), LM.getY(), 1, 1, 
								GRID.Position.x, GRID.Position.y, 
								GRID.param1.DIMENSION * GRID.param.PL.BOXSIZE, 
								GRID.param1.DIMENSION * GRID.param.PL.BOXSIZE)
	--
	if AABB then LM.setCursor(GRID.param.PL.HANDCURSOR) end
--
end

--
local DrawCells = function()
--
	for idy = 1, GRID.param1.DIMENSION do
	--
		local posY = ((idy - 1) * GRID.param.PL.BOXSIZE) + GRID.Position.y
		--
		for idx = 1, GRID.param1.DIMENSION do
		--
			local posX = ((idx - 1) * GRID.param.PL.BOXSIZE) + GRID.Position.x
			local fillColor = GRID.param.PL.PALCPCINDEX[GRID.param1.COLORINDEX[idy][idx]]
			--
			DrawBox(posX, posY, 
					GRID.param.PL.BOXSIZE, GRID.param.PL.BOXSIZE, 
					fillColor, GRID.param.PL.LINE)
		--
		end
	--
	end
--
end

--
local SetColor = function()
--
	for idy = 1, GRID.param1.DIMENSION do
	--
		local posY = ((idy - 1) * GRID.param.PL.BOXSIZE) + GRID.Position.y
		--
		for idx = 1, GRID.param1.DIMENSION do
		--
			local posX = ((idx - 1) * GRID.param.PL.BOXSIZE) + GRID.Position.x
			--
			if CheckCollision(LM.getX(), LM.getY(), 1, 1, 
							  posX, posY, 
							  GRID.param.PL.BOXSIZE, GRID.param.PL.BOXSIZE) then
			--
				GRID.param1.COLORINDEX[idy][idx + 0] = GRID.param.PL.COLORINDEX
				GRID.param1.COLORINDEX[idy][idx + 1] = GRID.param.PL.COLORINDEX
				break
			--
			end
		--
		end
	--
	end
--
end

--
GRID.Load = function(pos)
--
	GRID.Position = pos
	
	-- Initialise la matrice de la GRID COLORINDEX
	for idy = 1, GRID.param1.DIMENSION do
	-- Création d'un nouveau rang
		GRID.param1.COLORINDEX[idy] = {}
		-- Remplir la  matrice avec la couleur selectionnée de la PALETTE
		for idx = 1, GRID.param1.DIMENSION do
		--  
			GRID.param1.COLORINDEX[idy][idx] = GRID.param.PL.COLORINDEX
		--
		end
	--
	end
--
end

--
GRID.Update = function()
--		
	isCollidedGrid()
--
end

--
GRID.Draw = function()
--
	DrawCells()
--
end

--
GRID.MousePressed = function(mx, my, button, istouch)
--
	if button == 1 then SetColor() end
--
end
