--
-- VIEWER DE PIXELS
--

VIEWER  		 		= {}
VIEWER.arrSCREENSIZE 	= GRID.SCREENSIZE
VIEWER.COLS 	 		= VIEWER.arrSCREENSIZE.x / GRID.arrSIZE.x
VIEWER.ROWS 	 		= VIEWER.arrSCREENSIZE.y / GRID.arrSIZE.y

VIEWER.BOXSIZE			= 2
VIEWER.LINECOLOR 		= {.8,.8,.3, .02}
VIEWER.arrLINEGRIDSIZE 	= {x = GRID.arrSIZE.x * VIEWER.BOXSIZE, y = GRID.arrSIZE.y * VIEWER.BOXSIZE}

VIEWER.arrPALCPC		= GRID.arrPALCPC
VIEWER.arrCOLORINDEX	= GRID.arrCOLORINDEX

--
VIEWER.Load = function(pos)
--
	VIEWER.Position = pos
--
end

--
VIEWER.Update = function()
--		
--
end

--
VIEWER.Draw = function()
--	
	for idy = 1, VIEWER.arrSCREENSIZE.y do
	--
		local posY = ((idy - 1) * VIEWER.BOXSIZE) + VIEWER.Position.y
		--
		for idx = 1, VIEWER.arrSCREENSIZE.x  do
		--
			local posX = ((idx - 1) * VIEWER.BOXSIZE) + VIEWER.Position.x
			local fillColor = VIEWER.arrPALCPC[VIEWER.arrCOLORINDEX[idy][idx]]
			DrawBoxFill(posX, posY, VIEWER.BOXSIZE, VIEWER.BOXSIZE, fillColor)
		--
		end	
	end
	--
	for r = 1,VIEWER.ROWS do
	--
		for c = 1,VIEWER.COLS do
		--
			DrawBoxLine(VIEWER.Position.x, VIEWER.Position.y, 
						VIEWER.arrLINEGRIDSIZE.x * c, VIEWER.arrLINEGRIDSIZE.y * r, VIEWER.LINECOLOR)
		--
		end
	--
	end
--
end

--
VIEWER.MousePressed = function(mx, my, button, istouch)
--
--
end
