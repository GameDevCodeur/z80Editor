--
-- onEriseColor
--

onEriseColor = function ()
--
	local eriseColorIndex = function (arrColor, eriseColor, newColor )
	--	
		for _,row in ipairs(arrColor) do 
		--
			for idx, v in ipairs(row) do 
			--
				if (v == eriseColor) then row[idx] = newColor end
			--
			end
		--
		end
	--
	end
	
	local ERISECOLORINDEX = 0
	--
	local posY = 1
	local posX = 1
	
	for idy = 1, GR.arrSIZE.y do
	--
		posY = ((idy - 1) * GR.BOXSIZE) + GR.Position.y
		--
		for idx = 1, GR.arrSIZE.x do
		--
			posX = ((idx - 1) * GR.BOXSIZE) + GR.Position.x
			--
			if CheckCollision(LM.getX(), LM.getY(), 1, 1, posX, posY, GR.BOXSIZE, GR.BOXSIZE) then
			--
				ERISECOLORINDEX = GR.arrCOLORINDEX[idy + GR.STEPOFSY][idx + GR.STEPOFSX]				
				break
			--
			end			
		--
		end
		--		
		if (ERISECOLORINDEX > 0) then break end
	--
	end
	
	eriseColorIndex(GR.arrCOLORINDEX, ERISECOLORINDEX, PL.COLORINDEX)
	--
	idxPalette(CPC.PALETTE, GR.arrCOLORINDEX)
--
end