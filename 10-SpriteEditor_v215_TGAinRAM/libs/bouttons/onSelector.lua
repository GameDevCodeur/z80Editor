--
-- onGomme
--

onSelector = function()
--
	-- Deselection la Gomme
	GO.SELECTED = false
	GO.LINE		= {1,1,1,1}
	GO.TEXT		= "Changer une couleur."
	
	-- Change coleur LINE et la couleur image
	SC.LINE 	  = (SC.SELECTED) and {1,0,1,1} or {1,1,1,1}
	SC.IMAGECOLOR = (SC.SELECTED) and {0,1,0,1} or {1,1,1,1}
	SC.TEXT		  = (SC.SELECTED) and "Cliquez la couleur." or "Selecteur de couleurs."
	
	-- Affectation de la fonction de callback de la grille
	GR.onClick 	  = (SC.SELECTED) and onSelectColor or onSetColor
	--
--
end