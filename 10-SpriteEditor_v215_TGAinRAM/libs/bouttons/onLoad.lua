
--
-- onLoad Editeur
--

onLoad = function()
--
	--
	local OS = string.upper(LS.getOS())
	local path = TB.TEXT
	
	--
	if (OS == "WINDOWS") then
	--
		--
		path = "season/"..TB.TEXT.."/"..TB.TEXT
		os.execute( "mkdir /N season\\".. TB.TEXT)
		--	
	--
	end
	
	--
	RN.VALUE = 0
	GN.VALUE = 0
	BN.VALUE = 0
	
	--
	TARGA.load(path)
	TARGA.toArray(GR.arrCOLORINDEX, CPC.PALSFT, 0, 0, 0)
	
	-- 
	loadPalette("PAL", CPC.PALETTE)
	--
	idxPalette(CPC.PALETTE, GR.arrCOLORINDEX)
	--
--
end
