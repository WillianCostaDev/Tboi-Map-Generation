draw_sprite_ext(sprite_index,image_index,x+offx,y+offy,scalex/2,scaley/2,image_angle,image_blend,image_alpha)


if tag = "normal"{
	image_blend = c_white
}
if tag = "boss"{
	image_blend = c_red
}
if tag = "chest"{
	image_blend = c_yellow
}
if tag = "secret"{
	image_blend = c_purple
}

var scale_renderx = scalex/2
var scale_rendery = scaley/2

draw_rectangle(x-scale_renderx+offx,y-scale_rendery+offy,x+scale_renderx+offx,y+scale_rendery+offy,1)
