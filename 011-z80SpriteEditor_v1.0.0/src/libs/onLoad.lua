--
-- onLoad Editeur
--

onLoad = {}
onLoad.param = {}
onLoad.param.FILENAME 	= "z80Sprite.zse"
onLoad.param.GRID		= GRID.param1

onLoad.Editeur = function()
--
	file = io.open(onLoad.param.FILENAME ,"rb")
	--
	if file == nil then return end
	--
	for idy = 1, onSave.param.GRID.DIMENSION do
	--
		for idx = 1, onSave.param.GRID.DIMENSION do
		--
			local bytes = file:read(1) -- 1 bytes
			onLoad.param.GRID.COLORINDEX[idy][idx] = tonumber(string.byte(bytes))
		--
		end
	--
	end
	--
	file:close()
--
end
