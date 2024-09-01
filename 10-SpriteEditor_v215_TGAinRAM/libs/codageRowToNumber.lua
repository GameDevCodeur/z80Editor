
-----------------------------------------------------------
-- codageRowToNumber : encode M0 ligne index de couleurs --
-----------------------------------------------------------
-- sortie 		: ligne de 80 nombres encoder M0	 	 -- 
-----------------------------------------------------------
-- rowData 		: ligne d'index de couleurs	 			 --
-- 				: table couleurs format rgba {0,0,0,1}   --
-----------------------------------------------------------
-- 					GAMEDEVCODEUR 						 --
-----------------------------------------------------------

codageRowToNumber = function(rowData)
-- 	
	local toPoint = function(idx)
	--
		local c0  = rowData[idx+0] - 1
		local c1  = rowData[idx+1] - 1
		--
		local bP0 = toBinary(c0, "n")
		local bP1 = toBinary(c1, "n")
		--
		return CPC.M0.toEncode(bP0, bP1)	
	--
	end
	--	
	local Row80Number = {}
	-- 
	for idx = 1, #rowData, 2 do
	--
		table.insert(Row80Number, tonumber(toPoint(idx), 2))
	--
	end
	--
	return Row80Number
--
end
