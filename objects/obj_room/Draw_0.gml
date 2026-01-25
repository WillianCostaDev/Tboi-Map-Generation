draw_sprite_ext(sprite_index,image_index,x+offx,y+offy,image_xscale,image_yscale,image_angle,image_blend,image_alpha)


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

draw_rectangle(x-4+offx,y-4+offy,x+4+offx,y+4+offy,1)
