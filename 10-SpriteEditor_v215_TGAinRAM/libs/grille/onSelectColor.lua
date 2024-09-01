
--
-- onSelectColor
--

onSelectColor = function()
--
	--
	local trouve = false
	--
	for idy = 1, GR.arrSIZE.y do
	--
		--
		local posY = ((idy - 1) * GR.BOXSIZE) + GR.Position.y
		--
		for idx = 1, GR.arrSIZE.x do
		--
			local posX = ((idx - 1) * GR.BOXSIZE) + GR.Position.x
			--
			if CheckCollision(LM.getX(), LM.getY(), 1, 1, posX, posY, GR.BOXSIZE, GR.BOXSIZE) then
			--
				--
				PL.COLORINDEX = GR.arrCOLORINDEX[idy + GR.STEPOFSY][idx + GR.STEPOFSX]
				--
				trouve = true
				--
				break
				--
			--
			end
		--
		end
		--
		if (trouve) then break end
		--
	--
	end
	--
--
end