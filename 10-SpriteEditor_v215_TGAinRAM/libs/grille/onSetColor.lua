--
-- onSetColor
--

onSetColor = function()
--
	for idy = 1, GR.arrSIZE.y do
	--
		local posY = ((idy - 1) * GR.BOXSIZE) + GR.Position.y
		--
		for idx = 1, GR.arrSIZE.x do
		--
			local posX = ((idx - 1) * GR.BOXSIZE) + GR.Position.x
			--
			if CheckCollision(LM.getX(), LM.getY(), 1, 1, posX, posY, GR.BOXSIZE, GR.BOXSIZE) then
			--
				if (GR.PENSIZE == 1) then
				--
					GR.arrCOLORINDEX[idy + GR.STEPOFSY][idx + GR.STEPOFSX] = GR.COLORINDEX
				--
				else
				--
					for rows = 1, GR.PENSIZE do
					--
						local _idy = idy + rows - 1
						-- test overflow sur y
						if (_idy + GR.STEPOFSY > GR.SCREENSIZE.y) then break end
						--
						for cols = 1, GR.PENSIZE do
						--
							local _idx = idx + cols - 1
							-- test overflow sur x (pas obligatoire)
							if (_idx + GR.STEPOFSX > GR.SCREENSIZE.x) then break end
							--
							GR.arrCOLORINDEX[_idy + GR.STEPOFSY][_idx + GR.STEPOFSX] = GR.COLORINDEX
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