
--
-- loadPalette
--

loadPalette = function(fileName, arrPalette)
--
	-- convertir la composante en couleur cpc
	local toComposante = function(c)
	--
		if (c == 0) then return 0 end
		return (c > 127) and 1 or .5
	--
	end
	
	local torgba = function(b, g, r, a)
	--		
		local _r = toComposante(r)
		local _g = toComposante(g)
		local _b = toComposante(b)
		local _a = toComposante(a)
		
		-- retourne table couleur rgba		
		return {_r, _g, _b, _a}
	--
	end
	
	--
	file = io.open(fileName..".zed", "rb")
	
	--	
	if file == nil then return end
	
	-- DATA
	for idx, _ in ipairs(arrPalette) do
	--
		local _b = string.byte(file:read(1)) -- 1 bytes
		local _g = string.byte(file:read(1)) -- 1 bytes
		local _r = string.byte(file:read(1)) -- 1 bytes		
		local _a = string.byte(file:read(1)) -- 1 bytes		
		--
		arrPalette[idx] = torgba(_b, _g, _r, _a)		
	--
	end
	
	--
	file:close()
	
--
end