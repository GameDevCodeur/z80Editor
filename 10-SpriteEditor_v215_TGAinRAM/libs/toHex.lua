--
-- BintoHex
--

local bintohex = function (sb)
	-- 8 4 2 1  8 4 2 1
	-- 0 1 1 0  1 0 0 1 -> 69
	local HEX = {"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"}
	--
	local H = 0
	local L = 0
	--
	if GetStrChar(sb, 1) == "1" then H = 8 end
	if GetStrChar(sb, 2) == "1" then H = H + 4 end
	if GetStrChar(sb, 3) == "1" then H = H + 2 end
	if GetStrChar(sb, 4) == "1" then H = H + 1 end
	--
	if GetStrChar(sb, 5) == "1" then L = 8 end
	if GetStrChar(sb, 6) == "1" then L = L + 4 end
	if GetStrChar(sb, 7) == "1" then L = L + 2 end
	if GetStrChar(sb, 8) == "1" then L = L + 1 end
	--
	return HEX[H+1]..HEX[L+1]
--
end
--
function toHex(c, base) -- base "sb", "n"
--
	if base == "sb" then return bintohex(c) end
--
end
--