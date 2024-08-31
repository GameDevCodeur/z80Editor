--
-- onGomme
--

onGomme = function()
--
	-- Deselectionner Selecteur de couleurs
	SC.SELECTED = false
	SC.LINE		= {1,1,1,1}
	SC.TEXT		= "Selecteur de couleurs."
	
	--
	GO.LINE 	  = (GO.SELECTED) and {1,0,1,1} or {1,1,1,1}
	GO.IMAGECOLOR = (GO.SELECTED) and {0,1,0,1} or {1,1,1,1}
	GO.TEXT		  = (GO.SELECTED) and "Cliquez la couleur." or "Changer une couleur."
	
	--
	GR.onClick 	  = (GO.SELECTED) and onEriseColor or onSetColor
	--
--
end