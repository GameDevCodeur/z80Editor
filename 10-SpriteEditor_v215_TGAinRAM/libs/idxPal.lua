
--
-- idxPalette
--

local arrIdxPalette = function(arrData)
--
	local indexOf = function(array, value)
	--
		for i, v in ipairs(array) do
		--
			if v == value then return i end
		--
		end
		--
		return nil
	--
	end
	
	--
	local copyRow = function (dataRow)
	--
		local temp = {}		
		for _,v in ipairs(dataRow) do table.insert(temp,v) end		
		return temp
	--
	end
	
	local idxColor = {}
	
	--
	for row = 1, #arrData do
	--
		local temp = copyRow(arrData[row])
		--
		table.sort(temp)
		--
		for idx, value in ipairs(temp) do
		--
			if value ~= temp[idx + 1] then
			--
				if indexOf(idxColor, value) == nil then
				--
					table.insert(idxColor, value)
				--
				end
			--
			end
		--
		end
	--
	end
	--
	table.sort(idxColor)
	--
	return idxColor
--
end

--
idxPalette = function (arrPalette, arrData)
--
	local idxColor = arrIdxPalette(arrData)
	--
	for _idx = 1, #idxColor do
	--
		local idxCpc = _idx
		local idxNew = idxColor[_idx]

		if idxNew ~= idxCpc then
		--
			-- Reindexer la grille de données
			for row = 1, #arrData do
			--
				for idx, color in ipairs(arrData[row]) do
				--
					if (color == idxNew) then 
					--
						arrData[row][idx] = idxCpc 
					--
					end
				--
				end
			--
			end
			
			--	Permutation dans la palette
			local temp = arrPalette[idxCpc]
			arrPalette[idxCpc] = arrPalette[idxNew]
			arrPalette[idxNew] = temp
			--
		end
	--
	end
--
end

