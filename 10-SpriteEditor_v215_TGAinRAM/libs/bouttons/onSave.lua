
--
-- onSave Editeur
--

onSave = function()
--
	local OS = string.upper(LS.getOS())
	local path = TB.TEXT
	
	--
	if (OS == "WINDOWS") then
	--
		--
		path = "season/"..TB.TEXT.."/"..TB.TEXT
		--
		mkdir("season")
		mkdir("season\\"..TB.TEXT)		
		--
	--
	end

	--
	if (countColors() < 17) then toFileOCR(path, GR.arrCOLORINDEX) end
	--	
	TARGA.toSave(path, GR.arrCOLORINDEX, CPC.PALETTE)
	--
	idxPalette(CPC.PALETTE, GR.arrCOLORINDEX)
	--
	exportPalette(path, CPC.PALETTE, CPC.PALSFT, 16)
	--
--
end
