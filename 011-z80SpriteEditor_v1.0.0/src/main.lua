--
require "z80Sprite"

-- Chargement des valeurs par defaut
function love.load()
-- X:800=32*25, Y:640=32*20
	PL.Load({x = 32,    y = 32*1})
	GR.Load({x = 32,    y = 32*3})
	BS.Load({x = 32*18, y = 32*3}, "Enregistrer...", onSave.Editeur)
	BL.Load({x = 32*18, y = 32*4}, "Charger...", onLoad.Editeur)	
--
end

-- Logique
function love.update(dt)
--
	LM.setCursor()
	--
	PL.Update()
	GR.Update()
	BS.Update()
	BL.Update()
--
end

-- Affichage
function love.draw()
--
	LG.setBackgroundColor(unpack(CPC.BLACK))
	--
	PL.Draw()
	GR.Draw()
	BS.Draw()
	BL.Draw()
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
	GR.MousePressed(mx, my, button, istouch)
	BS.MousePressed(mx, my, button, istouch)
	BL.MousePressed(mx, my, button, istouch)
--
end

-- Pression touche du clavier
function love.keypressed(key)
--	
	if key == "f1" then
	--				
		M0.ClipBoard(GR.param1.COLORINDEX)
	--
    elseif key == "f2" then
	--
	--
    end
--
end
