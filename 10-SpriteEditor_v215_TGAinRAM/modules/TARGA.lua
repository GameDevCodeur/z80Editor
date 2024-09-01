
--
-- TARGA
--

TARGA = {}
TARGA.DATA = {}
TARGA.SIZE = 160 * 200 * 4

TARGA.toArray = function(arrData, arrPalette, DRN, DGN, DBN)
--
	local width  = #arrData[1]
    local height = #arrData
	
	-- convertir la composante en couleur cpc
	local toComposante = function(c, delta)
	--
		--
		c = (c == nil) and 0 or c
		--
		delta = (delta == nil) and 0 or delta
		--
		if (c <= 000 + delta) then return 0 end
		--
		if (c <= 127 + delta) then return 5 end 
		--
		return 1
		--
	--
	end
	
	-- convertire bgra en rgba
	local torgba = function(b, g, r, a)
	--			
		_r = toComposante(r, DRN)
		_g = toComposante(g, DGN)
		_b = toComposante(b, DBN)
		_a = 1 --toComposante(a)
		
		-- retourne couleur format text "bgra" ex: "1051"
		return _r.._g.._b.._a
	--
	end
	
	local idxData = 1
	
	-- lecture des datas
	for rows = 1, height do
	--
		 for cols = 1, width do
		 --			
			local b = TARGA.DATA[idxData+0] -- 1 bytes
			local g = TARGA.DATA[idxData+1] -- 1 bytes
			local r = TARGA.DATA[idxData+2] -- 1 bytes
			local a = TARGA.DATA[idxData+3] -- 1 bytes
			--
			local rgba = torgba(b,g,r,a)
			local indx = arrPalette[rgba][3] or 6 -- couleur 6 absente
			--
			arrData[rows][cols] = indx
			--
			idxData = idxData + 4
			--
		--
		end
	--
	end
--	
end

--
TARGA.load = function(fileName)
--
	--
	TARGA.DATA = {}
	
	--
	local file = io.open(fileName..".tga", "rb")

	--	si ko retour
	if file == nil then return end
	
	-- lecture du header tga
	local bytes = file:read(18) -- 18 bytes header

	-- lecture des datas
	for idx = 1, TARGA.SIZE do
	--
		local b = string.byte(file:read(1)) -- 1 bytes
		table.insert(TARGA.DATA, b)
	--
	end
	--
	file:close()	
--
end


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
TARGA.toSave = function(fileName, arrData, arrPalette)
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
--
end
