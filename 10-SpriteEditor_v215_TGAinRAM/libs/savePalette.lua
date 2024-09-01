
--
-- savePalette
--

savePalette = function(fileName, arrPalette)
--
	local tobgra = function(r, g, b, a)
	--		
		_r = "\0"
		_g = "\0"
		_b = "\0"
		_a = "\0"
		
		-- convertir intensité de couleur 0, 127, 255
		if (r>0) then _r = (r==1) and "\255" or "\127" end 	-- 1, .5, 0 
		if (g>0) then _g = (g==1) and "\255" or "\127" end	-- 1, .5, 0 
		if (b>0) then _b = (b==1) and "\255" or "\127" end	-- 1, .5, 0 
		if (a>0) then _a = (a==1) and "\255" or "\127" end	-- 1, .5, 0 
		
		-- retourne couleur format bgra
		return _b.._g.._r.._a
	--
	end
	
	--
	file = io.open(fileName..".zed", "wb")
	--	
	if file == nil then return end
	
	-- DATA	bgra
	for _, rgba in ipairs(arrPalette) do
	--
		file:write(tobgra(unpack(rgba)))
	--
	end
	
	--
	file:close()
	
--
end