
-----------------------------------------------------------
-- toFileTGA	: cré un fichier tga           	  		 --
-----------------------------------------------------------
-- sortie 		: fichier format TARGA (filename.tga)	 -- 
-----------------------------------------------------------
-- filename 	: nom du fichier de sortie 'xxxxx.tga'	 --
-- arrPalette	: table couleurs format rgba {0,0,0,1}   --
-- arrData  	: table d'index de couleurs arrPalette	 --
-----------------------------------------------------------
-- 					GAMEDEVCODEUR 						 --
-----------------------------------------------------------

--
toFileTGA = function(fileName, arrData, arrPalette)
--
	local width  = #arrData[1]
    local height = #arrData
	
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
	
	-- 00 00 02 00000000 00 0000 0000 A000C800 2008
	local TgaHeader =
      "\0"..       -- image id length
      "\0"..       -- color map type
      "\2"..       -- image type (2 == uncompressed true-color)
      "\0\0\0\0".. -- color map stuff
      "\0"..       -- color map bits per channel
      "\0\0"..   	-- x origin
      "\0\0"..   	-- y origin
      --"\0\0"..    -- image width (2 bytes, little endian)
      --"\0\0"..    -- image height (2 bytes, little endian)
      string.char(math.floor(width/256)%256, width%256):reverse()..
      string.char(math.floor(height/256)%256, height%256):reverse()..
      "\32"..      -- bits per pixel
      "\32"	       -- image display direction 0 renversée verticalement 32 sens normal 
	
	--
	local file = io.open(fileName..".tga", "wb")
	
	--	
	if file == nil then return end
	
	--
	file:write(TgaHeader)
	
	-- DATA	bgra
	for r = 1, height do
	--
		for c = 1, width do
		--
			local data = arrData[r][c]
			local rgba = arrPalette[data]
			local bgra = tobgra(unpack(rgba))
			file:write(bgra)
		--
		end
	--
	end
	
	--
	file:close()	
--
end
