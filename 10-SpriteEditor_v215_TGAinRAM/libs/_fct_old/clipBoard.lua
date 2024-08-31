--
-- ClipBoard
--

CPC.M0.ClipBoard = function(GR, DIMENSION)
--
	local DataSprite = "\n"
	--
	for idy = 1, DIMENSION.y do
	--
		local DataRow = "\tDB\t"
		--
		for idx = 1, DIMENSION.x, 2 do
		--
			local c0 	= GR[idy][idx+0] - 1
			local c1 	= GR[idy][idx+1] - 1
			local bP0 	= toBinary(c0, "n")
			local bP1 	= toBinary(c1, "n")
			local b1CPC = M0.toEncode(bP0, bP1)
			local h1CPC = "$"..toHex(b1CPC, "sb")
			DataRow 	= DataRow..h1CPC..", "
		--
		end
		--
		DataSprite = DataSprite..DataRow.."\n"..DataRow.."\n"		
	--
	end
	--
	LS.setClipboardText(DataSprite)
--
end