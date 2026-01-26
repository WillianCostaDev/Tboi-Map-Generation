draw_sprite_ext(sprite_index,image_index,x+offx,y+offy,scale/2,scale/2,image_angle,image_blend,image_alpha)


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

var scale_render = scale/2

draw_rectangle(x-scale_render+offx,y-scale_render+offy,x+scale_render+offx,y+scale_render+offy,1)
