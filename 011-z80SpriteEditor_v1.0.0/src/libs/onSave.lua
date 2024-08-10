
--
-- onSave Editeur
--

onSave = {}
onSave.param = {}
onSave.param.FILENAME 	= "z80Sprite.zse"
onSave.param.GRID		= GRID.param1

onSave.Editeur = function()
--
	local DataSprite = {}
	--
	for idy = 1, onSave.param.GRID.DIMENSION do
	--
		for idx = 1, onSave.param.GRID.DIMENSION do
		-- 
			local ind = ((idy - 1) * onSave.param.GRID.DIMENSION) + idx
			DataSprite[ind] = onSave.param.GRID.COLORINDEX[idy][idx]
		--
		end
	--
	end	
	--
	file = io.open(onSave.param.FILENAME, "wb")
	file:write(string.char(unpack(DataSprite)))
	file:close()
--
end
