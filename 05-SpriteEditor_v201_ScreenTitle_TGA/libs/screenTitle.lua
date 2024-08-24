
--
-- screenTitle
--

encodeRowToDecimal = function(arrData, row)
--  
	-- print("Row :"..row)
	
	if row > 200 then return end

	local Row80Bytes = {}
	-- 
	for idx = 1, 160, 2 do
	--
		local c0  = arrData[row][idx+0] - 1
		local c1  = arrData[row][idx+1] - 1
		local bP0 = toBinary(c0, "n")
		local bP1 = toBinary(c1, "n")
		local b1CPC = CPC.M0.toEncode(bP0, bP1)
		--
		local dec = tonumber(b1CPC, 2)
		--		
		table.insert(Row80Bytes, dec)
	--
	end
	--
	--	print("row80:"..Row80Bytes[1])
	--
	return Row80Bytes
--
end 


toScreenCPC = function (arrData)
--
	for rows = 1, 25 do
		CPC.SCREEN[00 + rows] = encodeRowToDecimal(arrData, ((rows-1) * 8) + 1)
	end
	
	-- Spart Start & Spart End à zero
	CPC.SCREEN[26] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	                  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
	
	for rows = 1, 25 do
		CPC.SCREEN[26 + rows] = encodeRowToDecimal(arrData, ((rows-1) * 8) + 2)
	end
	
	-- Spart Start & Spart End à zero
	CPC.SCREEN[52] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	                  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
	
	for rows = 1, 25 do
		CPC.SCREEN[52 + rows] = encodeRowToDecimal(arrData, ((rows-1) * 8) + 3)
	end
	
	-- Spart Start & Spart End à zero
	CPC.SCREEN[78] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	                  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		
	for rows = 1, 25 do
		CPC.SCREEN[78 + rows] = encodeRowToDecimal(arrData, ((rows-1) * 8) + 4)
	end
	
	-- Spart Start & Spart End à zero
	CPC.SCREEN[104] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	                  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
	
	for rows = 1, 25 do
		CPC.SCREEN[104 + rows] = encodeRowToDecimal(arrData, ((rows-1) * 8) + 5)
	end
	
	-- Spart Start & Spart End à zero
	CPC.SCREEN[130] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	                  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
	
	for rows = 1, 25 do
		CPC.SCREEN[130 + rows] = encodeRowToDecimal(arrData, ((rows-1) * 8) + 6)
	end
	
	-- Spart Start & Spart End à zero
	CPC.SCREEN[156] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	                  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
	
	for rows = 1, 25 do
		CPC.SCREEN[156 + rows] = encodeRowToDecimal(arrData, ((rows-1) * 8) + 7)
	end
	
	-- Spart Start & Spart End à zero
	CPC.SCREEN[182] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	                  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
	
	for rows = 1, 25 do
		CPC.SCREEN[182 + rows] = encodeRowToDecimal(arrData, ((rows-1) * 8) + 8)
	end	
	
	-- Spart Start & Spart End à zero
	CPC.SCREEN[208] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	                  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
	
--
end

--
CPC.M0.writeFileToOCR = function(arrData)
--	
	toScreenCPC(arrData)
	--
	file = io.open("zedScr.ocr", "wb")	
	--
	for rows = 1, 208 do
		file:write(string.char(unpack(CPC.SCREEN[rows])))		
	end
	--
	file:close()
--
end

--
CPC.M0.tgaToscreenTitle =  function(arrData)
--
	local width  = CPC.M0.SCREENSIZE.x
    local height = CPC.M0.SCREENSIZE.y
	--
	local bgraTorgba = function(b, g, r, a)
	--			
		_r = 0
		_g = 0
		_b = 0
		_a = 0
		
		if (r>0) then _r = (r==255) and 1 or 5 end
		if (g>0) then _g = (g==255) and 1 or 5 end
		if (b>0) then _b = (b==255) and 1 or 5 end
		if (a>0) then _a = (a==255) and 1 or 5 end
		
		return _r.._g.._b.._a
	--
	end
	--
	file = io.open("z80Screen.tga", "rb")
	--	
	if file == nil then return end
	--
	local bytes = file:read(18) -- 18 bytes header	
	--
	for rows = 1, height do
	--
		 for cols = 1, width do
		 --			
			local b = string.byte(file:read(1)) -- 1 bytes
			local g = string.byte(file:read(1)) -- 1 bytes
			local r = string.byte(file:read(1)) -- 1 bytes
			local a = string.byte(file:read(1)) -- 1 bytes
						
			--
			local rgba = bgraTorgba(b,g,r,a)
			local indx = CPC.PALTGA[rgba]
			
			--print("r:"..rows.." c:"..cols.."-- indx:"..indx or "err")
			
			arrData[rows][cols] = indx
		--
		end
	--
	end
	--
	file:close()
--	
end

--
CPC.M0.screenTitleToTGA =  function(arrData)
--
	local width  = CPC.M0.SCREENSIZE.x
    local height = CPC.M0.SCREENSIZE.y
	
	local rgbaTobgra = function(r, g, b, a)
		-- 1, .5, 0 
				
		_r = "\0"
		_g = "\0"
		_b = "\0"
		_a = "\0"
		
		if (r>0) then _r = (r==1) and "\255" or "\127" end
		if (g>0) then _g = (g==1) and "\255" or "\127" end
		if (b>0) then _b = (b==1) and "\255" or "\127" end
		if (a>0) then _a = (a==1) and "\255" or "\127" end
		
		-- print (string.byte(_b))
		-- print (string.byte(_g))
		-- print (string.byte(_r))
		-- print (string.byte(_a))
		
		return _b.._g.._r.._a
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
	
	file = io.open("z80Screen.tga", "wb")
	file:write(TgaHeader)
	
	-- DATA	bgra
	for r = 1, height do
	--
		for c = 1, width do
		--
			local data = arrData[r][c]
			local rgba = CPC.PALETTE[data]
			local bgra = rgbaTobgra(unpack(rgba))
			file:write(bgra)
		--
		end
	--
	end
	--
	file:close()	
--
end