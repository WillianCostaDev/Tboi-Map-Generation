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

if global.debug = 1{
draw_set_alpha(0.8)
draw_set_colour(c_aqua)
for(var i = 0; i <ds_list_size(connections);i++){
	draw_line(x,y,connections[|i].x,connections[|i].y)
}
draw_set_colour(c_white)
draw_set_alpha(1)
}