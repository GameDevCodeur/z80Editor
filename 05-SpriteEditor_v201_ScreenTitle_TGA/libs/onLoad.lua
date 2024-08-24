--
-- onLoad Editeur
--

onLoad 					= {}
onLoad.FILENAME 		= "z80Sprite.zse"
onLoad.SCREENSIZE		= GRID.SCREENSIZE
onLoad.arrCOLORINDEX	= GRID.arrCOLORINDEX

onLoad.Editeur = function()
--
	M0.tgaToscreenTitle(GRID.arrCOLORINDEX)

	-- file = io.open(onLoad.FILENAME ,"rb")
	-- if file == nil then return end
	-- for idy = 1, onLoad.SCREENSIZE.y do
		-- for idx = 1, onLoad.SCREENSIZE.x do
			-- local bytes = file:read(1) -- 1 bytes
			-- onLoad.arrCOLORINDEX[idy][idx] = tonumber(string.byte(bytes))
		-- end
	-- end
	-- file:close()
--
end
