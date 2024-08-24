--
-- Modules & Librairies
--
require "z80Sprite"

-- Chargement des valeurs par defaut
function love.load()

--	Font des textes de l'éditeur 
	FONT = LG.newFont("fonts/fbuton.ttf", 20)
	LG.setFont(FONT)
	
-- 	X:1088=34*34, Y:768=32*24
	PL.Load({x = 32*05, y = 32*1})
	--
	GR.Load({x = 32*01, y = 32*3})
	--
	BS.Load({x = 32*22, y = 32*3}, "Enregistrer...", onSave.Editeur)	
	BL.Load({x = 32*22, y = 32*4}, "Charger...", onLoad.Editeur)	
	--
	VW.Load({x = 32*22, y = (32*10) + 16})
	--
	AH.STEPMAX = 6
	AH.Load({x = 32*01, y = (32*02) + 16})
	--
	AV.STEPMAX = 8
	AV.Load({x = 32*21, y = 32*03})
--
end

-- Logique
function love.update(dt)
--
	LM.setCursor()
	PL.Update()
	GR.Update()
	BS.Update()
	BL.Update()	
	AH.Update()
	AV.Update()
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
	
	--
	VW.Draw()
	AH.Draw()
	AV.Draw()
	
	--
	LG.setColor(1,1,1,1)
	LG.print("PEN : "..GR.PENSIZE, 32, 40)
--
end

-- Redimensionne la fenetre
function love.resize(w, h)	
--
--
end

-- Click souris
function love.mousepressed(mx, my, button, istouch)
--
	PL.MousePressed(mx, my, button, istouch)
	--
	GR.COLORINDEX = PALETTE.COLORINDEX
	GR.MousePressed(mx, my, button, istouch)	
	--
	BS.MousePressed(mx, my, button, istouch)
	BL.MousePressed(mx, my, button, istouch)
	--
	AH.MousePressed(mx, my, button, istouch)
	GR.STEPOFSX	= ((AH.STEP > AH.STEPMAX) and AH.STEPMAX or AH.STEP) * GR.arrSIZE.x / 2
	AV.MousePressed(mx, my, button, istouch)
	GR.STEPOFSY	= ((AV.STEP > AV.STEPMAX) and AV.STEPMAX or AV.STEP) * GR.arrSIZE.y / 2
--
end

-- Pression touche du clavier
function love.keypressed(key)
--	
	if key == "f1" then
	--				
		-- M0.ClipBoard(GR.param1.COLORINDEX, CPC.M0.SCREENSIZE)
		-- M0.screenTitleToTGA(GR.arrCOLORINDEX)
		-- M0.tgaToscreenTitle(GR.arrCOLORINDEX)
		
		--encodeRowToDecimal(GR.arrCOLORINDEX, 2)		
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
