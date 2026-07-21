require("full-border"):setup({
	type = ui.Border.ROUNDED,
})
require("font-sample"):setup({
	text = '\nABCDEF abcdef\n0123456789 \noO08 iIlL1 g9qCGQ\n8%& <([{}])>\n.,;: @#$-_="\n== <= >= != ffi\náéúíóäöüőű\nâéùïøçÃĒÆœ\n및개요これ直楽糸\n😀😂😎\n     ~ ',
	canvas_size = "750x950",
	font_size = 80,
	-- https://imagemagick.org/script/color.php
	fg = "white",
	bg = "black",
})
