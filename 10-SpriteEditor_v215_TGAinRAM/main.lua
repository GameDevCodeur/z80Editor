--
-- Modules & Librairies
--
require "z80Sprite"

-- Chargement des valeurs par defaut
function love.load()
--
	-- Sauvegarder la palette par default
	savePalette("PAL", CPC.PALETTE)
 
--	Font des textes de l'éditeur 
	FONT = LG.newFont("fonts/fbuton.ttf", 20)
	LG.setFont(FONT)
	
-- 	X:1088=34*34, Y:768=32*24
	PL.Load({x = 32*07, y = (32*02)+14})
	--
	GR.Load({x = 32*01, y = 32*03}, onSetColor)
	
	-- TEXTBOX
	TB.Load({x = 32*22, y = 32*01}, "Z80SCR", nil)
	
	-- RGB NUMUPDOWN
	RN = NUMUPDOWN.NEW({x = 32*26, y = 32*06}, 1, onNumUpDown)
	GN = NUMUPDOWN.NEW({x = 32*26, y = 32*07}, 1, onNumUpDown)	
	BN = NUMUPDOWN.NEW({x = 32*26, y = 32*08}, 1, onNumUpDown)
	
	--
	BS.Load({x = 32*22, y = 32*03}, "Enregistrer le travail", onSave)	
	BL.Load({x = 32*22, y = 32*04}, "Charger le travail", onLoad)	
	--
	VW.Load({x = 32*22, y = (32*10)+16})
	--
	AH.STEPMAX = 6
	AH.Load({x = 32*01, y = (32*02)+14})
	--
	AV.STEPMAX = 8
	AV.Load({x = (32*21)+2, y = 32*03})
	
	-- Outils
	
	GO = BUTTON.NEW({x = (32*1) + 00, y = 32*01}, 
					 "Changer une couleur.", "gfx/gomme.png", onGomme)
	--
	GO.mousemoved = function(self, x, y, dx, dy, istouch )
	--	
		if self.SELECTED then return end
		self.IMAGECOLOR = self:Collided() and {0,1,0,1} or {1,1,1,1}	
	--
	end	
	
	--
	SC = BUTTON.NEW({x = (32*2) + 04, y = 32*01}, 
					 "Selecteur de couleurs.", "gfx/selector.png", onSelector)
	--
	SC.mousemoved = function(self, x, y, dx, dy, istouch )
	--	
		if self.SELECTED then return end
		self.IMAGECOLOR = self:Collided() and {0,1,0,1} or {1,1,1,1}	
	--
	end	
	
	--
	SA = BUTTON.NEW({x = (32*3) + 08, y = 32*01}, 
					"Saugarder la palette (.asm).", "gfx/save.png", onExport)
		
	-- Ajout effet au survole de la souris
	SA.mousemoved = function(self, x, y, dx, dy, istouch )
	--	
		self.IMAGECOLOR = self:Collided() and {0,1,0,1} or {1,1,1,1}	
	--
	end
	--
--
end

-- Logique
function love.update(dt)
--
	LM.setCursor()
	
	--
	BS.Update()
	BL.Update()
	PL.Update()
	AH.Update()
	AV.Update()
	--
	TB.Update()	-- TEXTBOX
	
	RN:Update()	-- RNUMUPDOWN
	GN:Update()	-- GNUMUPDOWN
	BN:Update()	-- BNUMUPDOWN
	
	--
	GO:Update()
	SA:Update()
	SC:Update()
	
	--
	GR.Update()
--
end

-- Affichage
function love.draw()
--	
	LG.setBackgroundColor(.3,.5,.7,.3)
	
	--
	PL.Draw()	-- Affichage Palette
	GR.Draw()	-- Affichage Grille
	BS.Draw()	-- Affichage Bouton Sauvegarder
	BL.Draw()	-- Affichage Bouton Charger
	
	TB.Draw()	-- TEXTBOX
	
	RN:Draw()	-- RNUMUPDOWN
	GN:Draw()	-- GNUMUPDOWN
	BN:Draw()	-- BNUMUPDOWN
	
	AH.Draw()	-- 
	AV.Draw()	--
	
	--
	VW.Draw()	
	
	--
	GO:Draw()
	SA:Draw()
	SC:Draw()
	
	--
	LG.setColor(1,1,1,1)
	
	LG.print("R", (32*22), (32*6))
	LG.print("G", (32*22), (32*7))
	LG.print("B", (32*22), (32*8))
	
	LG.print("Delta", (32*24)+8, (32*6))
	LG.print("Delta", (32*24)+8, (32*7))
	LG.print("Delta", (32*24)+8, (32*8))
	
	LG.print(tostring(GR.PENSIZE), (32*5)+8, (32*2)+8)
	LG.print("Couleurs (16 max) : "..tostring(countColors()), (32*23)+16, (32*9)+16)
	
--
end

-- Redimensionne la fenetre
function love.resize(w, h)	
--
--
end

-- Souris bouge
function love.mousemoved( x, y, dx, dy, istouch )
--
	SA:mousemoved( x, y, dx, dy, istouch )
	GO:mousemoved( x, y, dx, dy, istouch )
	SC:mousemoved( x, y, dx, dy, istouch )
--
end

-- Click souris
function love.mousepressed(mx, my, button, istouch)
--
	-- Boite d'outils
	GO:MousePressed(mx, my, button, istouch)	
	SA:MousePressed(mx, my, button, istouch)
	SC:MousePressed(mx, my, button, istouch)
	
	--
	TB.MousePressed(mx, my, button, istouch) -- TEXTBOX
	
	RN:MousePressed(mx, my, button, istouch) -- RNUMUPDOWN
	GN:MousePressed(mx, my, button, istouch) -- GNUMUPDOWN
	BN:MousePressed(mx, my, button, istouch) -- BNUMUPDOWN
	
	-- Palette
	PL.MousePressed(mx, my, button, istouch)
	
	-- Grille
	GR.COLORINDEX = PALETTE.COLORINDEX
	GR.MousePressed(mx, my, button, istouch)
	
	-- Boutons
	BS.MousePressed(mx, my, button, istouch)
	BL.MousePressed(mx, my, button, istouch)
	
	-- Ascensseurs
	AH.MousePressed(mx, my, button, istouch)
	GR.STEPOFSX	= ((AH.STEP > AH.STEPMAX) and AH.STEPMAX or AH.STEP) * GR.arrSIZE.x / 2	
	AV.MousePressed(mx, my, button, istouch)
	GR.STEPOFSY	= ((AV.STEP > AV.STEPMAX) and AV.STEPMAX or AV.STEP) * GR.arrSIZE.y / 2

--
end

-- Text saisie
function love.textinput(text)
--
	TB.TextInput(text)	-- TEXTBOX
--
end

-- Pression touche du clavier
function love.keypressed(key)
--	

	TB.KeyPressed(key)
	
	if key == "f1" then
	--				
		-- M0.ClipBoard(GR.param1.COLORINDEX, CPC.M0.SCREENSIZE)
		-- M0.screenTitleToTGA(GR.arrCOLORINDEX)
		-- M0.tgaToscreenTitle(GR.arrCOLORINDEX)		
		-- encodeRowToDecimal(GR.arrCOLORINDEX, 2)
		-- idxPalette(CPC.PALETTE, GR.arrCOLORINDEX)		
		-- exportPalette(CPC.PALETTE, CPC.PALSFT, 16)
		-- os.execute( "mkdir season\\week1" )
		
	--
    elseif key == "kp+" then
	--
		GR.PENSIZE = GR.PENSIZE * 2
		GR.PENSIZE = (GR.PENSIZE<32) and GR.PENSIZE or 32
	--
	elseif key == "kp-" then
	--
		GR.PENSIZE = GR.PENSIZE / 2
		GR.PENSIZE = (GR.PENSIZE<1) and 1 or GR.PENSIZE
	--
    end	
--
end
