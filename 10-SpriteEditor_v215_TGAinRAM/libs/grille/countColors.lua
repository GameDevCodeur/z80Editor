--
-- countColors
--

countColors = function ()
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
	for row = 1, GRID.SCREENSIZE.y do
	--
		local temp = copyRow(GRID.arrCOLORINDEX[row])
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
	return #idxColor
--	
end