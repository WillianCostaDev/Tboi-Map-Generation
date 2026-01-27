draw_sprite_ext(sprite_index,image_index,x+offx,y+offy,scalex/2,scaley/2,image_angle,image_blend,image_alpha)

image_blend = debug_color

var scale_renderx = scalex/2
var scale_rendery = scaley/2

draw_rectangle(x-scale_renderx+offx,y-scale_rendery+offy,x+scale_renderx+offx,y+scale_rendery+offy,1)

if global.debug = 1{
	draw_set_alpha(0.8)
	draw_set_colour(c_aqua)
	
	if tag != "normal"{
		draw_set_colour(c_red)
	}
	
	for(var i = 0; i <ds_list_size(connections);i++){
		
		if instance_exists(connections[|i]){
			var lengx = lengthdir_x(point_distance(x,y,connections[|i].x,connections[|i].y),point_direction(x,y,connections[|i].x,connections[|i].y))
			var lengy = lengthdir_y(point_distance(x,y,connections[|i].x,connections[|i].y),point_direction(x,y,connections[|i].x,connections[|i].y))
				
			draw_set_alpha(1)
			draw_line(x,y,x+lengx,y+lengy)
		}
	}
	//for(var i = 0; i <ds_list_size(connections);i++){
	//	var lengx = lengthdir_x(point_distance(x,y,connections[|i].x,connections[|i].y)/3,point_direction(x,y,connections[|i].x,connections[|i].y))
	//	var lengy = lengthdir_y(point_distance(x,y,connections[|i].x,connections[|i].y)/3,point_direction(x,y,connections[|i].x,connections[|i].y))
		
	//	draw_line(x,y,x+lengx,y+lengy)
	//}
	draw_set_colour(c_white)
	draw_set_alpha(1)
}
