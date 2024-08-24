--
-- GRILLE DE PIXELS
--

GRID = {}
GRID.HANDCURSOR 		= LM.getSystemCursor("hand")
GRID.arrPALCPC 			= PALETTE.param.PALCPCINDEX
GRID.COLORINDEX			= PALETTE.COLORINDEX

GRID.LINE			  	= {.8,.8,.3,.1}
GRID.BOXSIZE			= 16
GRID.SCREENSIZE 		= CPC.M0.SCREENSIZE
--
GRID.arrSIZE			= {x=40, y=40}
GRID.arrCOLORINDEX  	= {}			-- MATRICE COLORINDEX
--
GRID.PENSIZE			= 1
GRID.STEPOFSX			= 0
GRID.STEPOFSY			= 0
--
local isCollidedGrid = function()
	
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
local SetColor = function()
--
	for idy = 1, GRID.arrSIZE.y do
	--
		local posY = ((idy - 1) * GRID.BOXSIZE) + GRID.Position.y
		--
		for idx = 1, GRID.arrSIZE.x do
		--
			local posX = ((idx - 1) * GRID.BOXSIZE) + GRID.Position.x
			--
			if CheckCollision(LM.getX(), LM.getY(), 1, 1, 
							  posX, posY, 
							  GRID.BOXSIZE, GRID.BOXSIZE) then
			--
				if GRID.PENSIZE==1 then
				--
					GRID.arrCOLORINDEX[idy + GRID.STEPOFSY][idx + GRID.STEPOFSX] = GRID.COLORINDEX
				--
				else
				--
					for rows = 1, GRID.PENSIZE do
					--
						local _idy = idy + rows - 1
						-- test overflow sur y
						if (_idy + GRID.STEPOFSY > GRID.SCREENSIZE.y) then break end
						--
						for cols = 1, GRID.PENSIZE do
						--
							local _idx = idx + cols - 1
							-- test overflow sur x (pas obligatoire)
							if (_idx + GRID.STEPOFSX > GRID.SCREENSIZE.x) then break end
							--
							GRID.arrCOLORINDEX[_idy + GRID.STEPOFSY][_idx + GRID.STEPOFSX] = GRID.COLORINDEX
						--
						end
					--
					end
				--
				end
				--
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
