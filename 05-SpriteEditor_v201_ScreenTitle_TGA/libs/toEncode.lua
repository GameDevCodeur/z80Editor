--
-- Encodage point ecran en Mode0
--

-- 
-- 1 point ecran <=> 2 pixels (4bpp)
-- p0="0000" et p1="0000" => pr="00000000"

CPC.M0.toEncode = function(bP0, bP1)
--
	-- Composition de chaque bit de l'octet
	local cB7 = GetStrChar(bP0,4) -- C0B0 -- bit 7
	local cB6 = GetStrChar(bP1,4) -- C1B0 -- bit 6
	local cB5 = GetStrChar(bP0,2) -- C0B2 -- bit 5
	local cB4 = GetStrChar(bP1,2) -- C1B2 -- bit 4
	local cB3 = GetStrChar(bP0,3) -- C0B1 -- bit 3
	local cB2 = GetStrChar(bP1,3) -- C1B1 -- bit 2
	local cB1 = GetStrChar(bP0,1) -- C0B3 -- bit 1
	local cB0 = GetStrChar(bP1,1) -- C1B3 -- bit 0
	-- retourne le resultat
	return cB7..cB6..cB5..cB4..cB3..cB2..cB1..cB0
--
end
--