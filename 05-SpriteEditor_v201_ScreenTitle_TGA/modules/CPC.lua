
--
-- Module Amstrad CPC
--

CPC	   				= {}
CPC.M0 				= {}
CPC.M0.SCREENSIZE	= {x=160, y=200}

CPC.SCREEN			= {}

CPC.PALETTE 		= {}
CPC.PALTGA	 		= {}

--
-- 27 couleurs CPC
--
CPC.BLACK 			= { 0 , 0 , 0 ,1} --  0
CPC.BLUE			= { 0 , 0 ,.5 ,1} --  1
CPC.BRIGHTBLUE 		= { 0 , 0 , 1 ,1} --  2 
CPC.RED				= {.5 , 0 , 0 ,1} --  3
CPC.MAGENTA 		= {.5 , 0 ,.5 ,1} --  4
CPC.MAUVE			= {.5 , 0 , 1 ,1} --  5
CPC.BRIGHTRED 		= { 1 , 0 , 0 ,1} --  6
CPC.PURPLE 			= { 1 , 0 ,.5 ,1} --  7
CPC.BRIGHTMARGENTA  = { 1 , 0 , 1 ,1} --  8
CPC.GREEN 			= { 0 ,.5 , 0 ,1} --  9 
CPC.CYAN 			= { 0 ,.5 ,.5 ,1} -- 10
CPC.SKYBLUE	 		= { 0 ,.5 , 1 ,1} -- 11
CPC.YELLO 			= {.5 ,.5 , 0 ,1} -- 12
CPC.WHITE 			= {.5 ,.5 ,.5 ,1} -- 13
CPC.PASTELBLUE	 	= {.5 ,.5 , 1 ,1} -- 14
CPC.ORANGE	 		= { 1 ,.5 , 0 ,1} -- 15
CPC.PINK 			= { 1 ,.5 ,.5 ,1} -- 16
CPC.PASTELMAGENTA	= { 1 ,.5 , 1 ,1} -- 17 
CPC.BRIGHTGREEN 	= { 0 , 1 , 0 ,1} -- 18
CPC.SEAGREEN  		= { 0 , 1 ,.5 ,1} -- 19 
CPC.BRIGHTCYAN	 	= { 0 , 1 , 1 ,1} -- 20
CPC.LIMEGREEN 		= {.5 , 1 , 0 ,1} -- 21
CPC.PASTELGREEN		= {.5 , 1 ,.5 ,1} -- 22
CPC.PASTELCYAN 		= {.5 , 1 , 1 ,1} -- 23
CPC.BRIGHTYELLO 	= { 1 , 1 , 0 ,1} -- 24
CPC.PASTELYELLO  	= { 1 , 1 ,.5 ,1} -- 25
CPC.BRIGHTWHITE 	= { 1 , 1 , 1 ,1} -- 26

--
-- 16 couleurs standard
--
--
CPC.PALETTE[1]  = CPC.BLUE				--
CPC.PALETTE[2]  = CPC.BRIGHTYELLO
CPC.PALETTE[3]  = CPC.BRIGHTCYAN
CPC.PALETTE[4]  = CPC.BRIGHTRED
CPC.PALETTE[5]  = CPC.BRIGHTWHITE
CPC.PALETTE[6]  = CPC.BLACK
CPC.PALETTE[7]  = CPC.BRIGHTBLUE
CPC.PALETTE[8]  = CPC.BRIGHTMARGENTA
CPC.PALETTE[9]  = CPC.CYAN
CPC.PALETTE[10] = CPC.YELLO
CPC.PALETTE[11] = CPC.PASTELBLUE
CPC.PALETTE[12] = CPC.PINK
CPC.PALETTE[13] = CPC.BRIGHTGREEN
CPC.PALETTE[14] = CPC.PASTELGREEN
CPC.PALETTE[15] = CPC.BLUE				--
CPC.PALETTE[16] = CPC.SKYBLUE

--
-- PALETTE TGA
--
CPC.PALTGA["0051"] = 1
CPC.PALTGA["1101"] = 2 
CPC.PALTGA["0111"] = 3 
CPC.PALTGA["1001"] = 4 
CPC.PALTGA["1111"] = 5 
CPC.PALTGA["0001"] = 6 
CPC.PALTGA["0011"] = 7 
CPC.PALTGA["1011"] = 8 
CPC.PALTGA["0551"] = 9 
CPC.PALTGA["5501"] = 10 
CPC.PALTGA["5511"] = 11 
CPC.PALTGA["1551"] = 12 
CPC.PALTGA["0101"] = 13 
CPC.PALTGA["5151"] = 14 
CPC.PALTGA["0511"] = 16
 
