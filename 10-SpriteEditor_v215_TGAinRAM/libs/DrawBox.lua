
--.
-- DrawBoxColor
--

DrawBoxLine =  function(x, y, w, h, lineColor)
--
	LG.setColor(unpack(lineColor))
	LG.rectangle("line", x, y, w, h)
--
end

DrawBoxFill =  function(x, y, w, h, fillColor)
--
	LG.setColor(unpack(fillColor))
	LG.rectangle("fill", x, y, w, h)
--
end

--
DrawBox = function(x, y, w, h, fillColor, lineColor)
--
	DrawBoxFill(x, y, w, h, fillColor)
	DrawBoxLine(x, y, w, h, lineColor)
--
end