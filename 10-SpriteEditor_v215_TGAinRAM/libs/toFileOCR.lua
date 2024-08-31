
--
-- toFileOCR
--

local toScreenCPC = function (arrData)
--
	for rows = 1, 25 do
	--
		CPC.SCREEN[ 00 + rows] = codageRowToNumber(arrData[((rows-1) * 8) + 1])
		CPC.SCREEN[ 26 + rows] = codageRowToNumber(arrData[((rows-1) * 8) + 2])
		CPC.SCREEN[ 52 + rows] = codageRowToNumber(arrData[((rows-1) * 8) + 3])
		CPC.SCREEN[ 78 + rows] = codageRowToNumber(arrData[((rows-1) * 8) + 4])
		CPC.SCREEN[104 + rows] = codageRowToNumber(arrData[((rows-1) * 8) + 5])
		CPC.SCREEN[130 + rows] = codageRowToNumber(arrData[((rows-1) * 8) + 6])
		CPC.SCREEN[156 + rows] = codageRowToNumber(arrData[((rows-1) * 8) + 7])
		CPC.SCREEN[182 + rows] = codageRowToNumber(arrData[((rows-1) * 8) + 8])
	--
	end
	--
	for idx = 1, 8 do
	--
		CPC.SCREEN[idx * 26] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
						 	    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
	--
	end
--
end

--
toFileOCR = function(fileName, arrData)
--	
	toScreenCPC(arrData)
	--
	file = io.open(fileName..".ocr", "wb")
	--
	if file == nil then return end
	--
	for _,v in ipairs(CPC.SCREEN) do
	--
		file:write(string.char(unpack(v)))
	--
	end	
	--
	file:close()
--
end
