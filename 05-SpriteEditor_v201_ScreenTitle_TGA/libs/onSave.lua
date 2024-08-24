
--
-- onSave Editeur
--

onSave 					= {}
onSave.FILENAME 		= "z80Sprite.zse"
onSave.arrCOLORINDEX	= GRID.arrCOLORINDEX
onSave.SCREENSIZE		= GRID.SCREENSIZE

onSave.Editeur = function()
--
	M0.writeFileToOCR(GR.arrCOLORINDEX)
	M0.screenTitleToTGA(GR.arrCOLORINDEX)
	
	
	-- file = io.open(onSave.FILENAME, "wb")
	-- for idy = 1, onSave.SCREENSIZE.y do
		-- for idx = 1, onSave.SCREENSIZE.x do
			-- local ind = ((idy - 1) * onSave.SCREENSIZE.x) + idx
			-- file:write(string.char(onSave.arrCOLORINDEX[idy][idx]))
		-- end
	-- end	
	-- file:close()
--
end
