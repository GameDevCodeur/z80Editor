function love.conf(t)

	t.version = "11.5"                 		-- The LÖVE version this game was made for (string)
    t.window.title = "SpriteEditor 20.1.r2"  -- The window title (string)
    
	t.window.width  = 1060                	-- The window width (number)
    t.window.height = 768               	-- The window height (number)
	    
    t.window.fullscreen = false          	-- Enable fullscreen (boolean)
    t.window.fullscreentype = "desktop" 	-- Choose between "desktop" fullscreen or "exclusive" fullscreen mode (string)
	
    t.window.display = 1                	-- Index of the monitor to show the window in (number)    
	t.window.vsync = false             		-- Vertical sync mode (number)
    t.window.resizable = false         		-- Let the window be user-resizable (boolean)
	
	t.console = false                  		-- Attach a console (boolean, Windows only)	
    t.gammacorrect = true               	-- Enable gamma-correct rendering, when supported by the system (boolean)	

	t.window.icon = "gfx/ico.png"      	    -- Filepath to an image to use as the window's icon (string)       

    t.window.highdpi = true            		-- Enable high-dpi mode for the window on a Retina display (boolean)
    t.window.usedpiscale = true         	-- Enable automatic DPI scaling when highdpi is set to true as well (boolean)
	
	t.identity = "z80SpriteEditor"	       	-- The name of the save directory (string)
	t.appendidentity = true         		-- Search files in source directory before save directory (boolean)
	
	t.release = true
	
end