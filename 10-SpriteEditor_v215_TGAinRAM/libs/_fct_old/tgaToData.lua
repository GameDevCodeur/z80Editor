--
-- tgaToData
--

tgaToData =  function(fileName, arrData, arrPalette)
--
	local width  = #arrData[1]
    local height = #arrData
		
	-- convertir la composante en couleur cpc
	local toComposante = function(c, delta)
	--
		--
		if (c <= 000 + delta) then return 0 end
		if (c <= 127 + delta) then return 5 end 
		--
		return 1
	--
	end
	
	-- convertire bgra en rgba
	local torgba = function(b, g, r, a)
	--			
		_r = toComposante(r, RN.VALUE)
		_g = toComposante(g, GN.VALUE)
		_b = toComposante(b, BN.VALUE)
		_a = 1 --toComposante(a)
		
		-- retourne couleur format text "bgra" ex: "1051"
		return _r.._g.._b.._a
	--
	end
	
	--
	local file = io.open(fileName..".tga", "rb")
	
	--	si ko retour
	if file == nil then return end
	
	-- lecture du header tga
	local bytes = file:read(18) -- 18 bytes header
	
	-- lecture des datas
	for rows = 1, height do
	--
		 for cols = 1, width do
		 --			
			local b = string.byte(file:read(1)) -- 1 bytes
			local g = string.byte(file:read(1)) -- 1 bytes
			local r = string.byte(file:read(1)) -- 1 bytes
			local a = string.byte(file:read(1)) -- 1 bytes
			--
			local rgba = torgba(b,g,r,a)
			local indx = arrPalette[rgba][3] or 6	-- si couleur absente MODIF
			--
			arrData[rows][cols] = indx
		--
		end
	--
	end
	--
	file:close()
--	
end