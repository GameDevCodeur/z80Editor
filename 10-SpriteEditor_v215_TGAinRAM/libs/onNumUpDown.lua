--
-- onNumUpDown
--

onNumUpDown = function()
--
	--
	TARGA.toArray(GR.arrCOLORINDEX, CPC.PALSFT, RN.VALUE, GN.VALUE, BN.VALUE)
	
	-- 
	loadPalette("PAL", CPC.PALETTE)
	
	--
	idxPalette(CPC.PALETTE, GR.arrCOLORINDEX)
	--
--
end