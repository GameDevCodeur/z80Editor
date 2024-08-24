
--
-- PALETTE
--

La palette CPC selon le Mode selectionnné contient des couleurs.

---------------
Modes Officiel:
---------------
Mode 0 : 160×200 pixels avec 16 couleurs (4 bpp)
Mode 1 : 320×200 pixels avec  4 couleurs (2 bpp)
Mode 2 : 640×200 pixels avec  2 couleurs (1 bpp)

-------------------
Modes non officiel:
-------------------
Mode 3 : 160×200 pixels avec  4 couleurs (2 bpp)

OBJECTIFS	: Afficher une Palette.
			: 16 couleurs de base du CPC indexé de 1 à 16 (Mode 0).

ACTIONS    	: Le Click Gauche de la souris sur une couleur, la selectionne.
			: Afficher une boite sur la couleur selectionnnée.

EVENEMENT	: Le Curseur 'Hand', la main est affiché lors du survole.			 

La  Boite affichée sur la couleur selectionnée et de 10x10 pixels
Les Couleurs sont des Boites de 32x32 pixels
--
La variable 'ColorIndex' contient l'index de la couleur selectionner.
--
La fonction 'Draw" dessine la palette en position x, y.
La fonction 'SetIndexColor' selectionne l'index de la couleur.
La fonction 'Update' change le contour de la boite de couleur.
--
La fonction locale 'DrawBoxSelected" dessine une boite de selection.
La fonction locale 'isCollided" return vrai lors d'une collition avec une boite.
--
La fonction de la librairie 'DrawBox' est utilisée pour désiner les boites.
La fonction de la librairie 'CheckCollision' est utilisée pour detecter les collisions.


