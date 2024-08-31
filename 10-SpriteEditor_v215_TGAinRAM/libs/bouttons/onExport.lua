
--
-- onExport
--

exportPalette = function(fileName, arrPalette, arrCorrespondance, indFin)
--
	--
	local torgba = function(r,g,b,a)
	--
		_r = "0"
		_g = "0"
		_b = "0"
		_a = "0"
		--
		if (r > 0) then _r = (r==1) and "1" or "5" end
		if (g > 0) then _g = (g==1) and "1" or "5" end
		if (b > 0) then	_b = (b==1) and "1" or "5" end
		if (a > 0) then _a = (a==1) and "1" or "5" end
		--
		return _r.._g.._b.._a
	--
	end
	
	local palFRW = {}
	local palHRD = {}
	
	-- Construire les tables 
	for idx = 1, indFin do
	--
		-- Recuperer les donnees
		local rgba = torgba(unpack(arrPalette[idx]))
		--		
		local FRW  = "$"..string.format("%02x", arrCorrespondance[rgba][1])..", "
		local HDR  = "$"..string.format("%02x", arrCorrespondance[rgba][2])..", "
		
		-- Supprimer la virgule dernier item
		FRW = (idx==indFin) and string.sub(FRW,1,-3) or FRW
		HDR = (idx==indFin) and string.sub(HDR,1,-3) or HDR
		
		-- Insert en majuscule
		table.insert(palFRW, string.upper(FRW))
		table.insert(palHRD, string.upper(HDR))
		--
	--
	end
	
	-- Sauvegarde asmfile
	file = io.open(fileName..".asm", "w")
	
	-- Quiter si fichier ko
	if file == nil then return end
	
	-- Ecrire
	file:write("\nzedPalette_FRW:\n\tDB ")

	for idx = 1, #palFRW do file:write(palFRW[idx])	end
	
	-- Ecrire
	file:write("\n\nzedPalette_HRD:\n\tDB ")
	for idx = 1, #palHRD do file:write(palHRD[idx])	end

	-- Fermer le fichier
	file:close()
	--
--
end

onExport = function()
--
	--
	local OS = string.upper(LS.getOS())
	--
	local path = ""
	
	if (OS == "WINDOWS") then
	--
		--
		os.execute( "mkdir season\\".. TB.TEXT)		
		path = "season/"..TB.TEXT.."/"..TB.TEXT
		--
	--
	else
	--
		--
		path = TB.TEXT
		--
	--		
	end
		
	--
	local message = "Etes-vous sur ?"
	local buttons = {"OK", "No!", escapebutton = 2}
	local pressedbutton = LW.showMessageBox("Exporter "..TB.TEXT..".asm ?", message, buttons, "info", true)
	
	-- OK == 1
	if pressedbutton == 1 then 
	--
		--
		--- idxPalette(CPC.PALETTE, GR.arrCOLORINDEX)
		--
		exportPalette(path, CPC.PALETTE, CPC.PALSFT, 16)
		--
	--
	end
	--
--
end