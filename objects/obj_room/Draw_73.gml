

if execute = -1{
	//execute = 0
	//stop path
	var ang = 0
	
	var place_ = global.gen_objects
	
	
		
		for(var i = 0; i < 360/global.Generation_angle;i++){	
			var offsetx = global.block_path_offset
			var offsety = global.block_path_offset
		
			var list = ds_list_create()
		
			var line_in = collision_line_list(
						  x+lengthdir_x(scalex/2,ang)-lengthdir_x(offsetx,ang),
						  y+lengthdir_y(scaley/2,ang)-lengthdir_y(offsetx,ang),
						  x+lengthdir_x(scalex/2,ang),
						  y+lengthdir_y(scaley/2,ang),
						  place_,1,0,list,1)
			
			//draw_line_width(
			//			  x+lengthdir_x(scalex/2,ang)-lengthdir_x(offsetx,ang),
			//			  y+lengthdir_y(scaley/2,ang)-lengthdir_y(offsetx,ang),
			//			  x+lengthdir_x(scalex/2,ang),
			//			  y+lengthdir_y(scaley/2,ang)
			//			  ,3)
			
			//determine if is in path
		
			var has_connect = 0
		
			for(var o = 0; o <ds_list_size(connections);o++){
		
				if instance_exists(connections[|o]){
					if point_direction(x,y,connections[|o].x,connections[|o].y) = ang{
						has_connect = 1
					}
				}
			}
			for(var o = 0; o <ds_list_size(connected_to_me);o++){
		
				if instance_exists(connected_to_me[|o]){
					if point_direction(x,y,connected_to_me[|o].x,connected_to_me[|o].y) = ang{
						has_connect = 1
					
						draw_set_colour(c_red)
					//	draw_line_width(x,y,connected_to_me[|o].x,connected_to_me[|o].y,4)
						draw_set_colour(c_white)
					}
				}
			}
			
			for(var k = 0; k < ds_list_size(list);k++){
				
				for(var j = 0;j < array_length(global.gen_objects);j++){
					
					if (!instance_exists(list[|k])){
						return;
					}
					
					//list[|k].object_index
					//não existe de alguma forma
					
					if  has_connect and global.gen_objects[j] = list[|k].object_index{
						//está no caminho
						if global.stop_path[j] = 1{
							if global.stop_gen[j] = 1{
								master.restart()
							}
							instance_destroy(list[|k])
						}
					}
				}
			}
		
			ds_list_destroy(list)
			
			ang += global.Generation_angle
		}
		
		
		
		
		
		/////////////////////Inverse Case
		
}




////
if global.debug_generation = 1{
	if sprite_ref != noone{
	//	draw_sprite_ext(sprite_ref,0,x-(scalex/2),y-(scaley/2),(scalex)/global.generation_cell_x,(scaley)/global.generation_cell_y,0,c_white,1)
	}
	
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
			draw_line_width(x,y,x+lengx,y+lengy,4)
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