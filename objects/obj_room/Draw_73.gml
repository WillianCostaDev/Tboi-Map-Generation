var placen = collision_rectangle(x-(scalex/2),y-(scaley/2),x+(scalex/2),y+(scaley/2),obj_room,1,1)

if 	placen and global._Reset = 1 and doors = 1{
	master.reset_if_fail = 1
	master.restart()
}

if doors = 1{
	image_xscale = (scalex/2)*0.9
	image_yscale = (scaley/2)*0.9
}


if round(execute) = 0 and doors = 0{

	var inst = global._door_object
	
		if !ds_exists(connections,ds_type_list){
			return
		}
		
		var place_mul = 1
		
		var offset_place = 4
		
		if global._Generation_angle != 90{
			offset_place = -2
			
			place_mul = 1.4
		}
	
		for(var o = 0; o <ds_list_size(connections);o++){
		
				var ang = point_direction(x,y,connections[|o].x,connections[|o].y)
				
				var size = ((scalex/2)-(global._generation_cell_x/2))*place_mul
				
				var stepsize = global._generation_cell_x
				
				if scaley > scalex{
					size = scaley
				}
				
				var place_ = global._doors_in
				
				for(var i = 0; i < size;i++){							
					if collision_point(x+lengthdir_x((stepsize*i)-offset_place,ang)-lengthdir_x(global._door_offset,ang),y+lengthdir_y((stepsize*i)-offset_place,ang)-lengthdir_y(global._door_offset,ang),place_,1,0){	
						//draw_circle(x+lengthdir_x(stepsize*i,ang),y+lengthdir_y(stepsize*i,ang),1,0)
						
						//if i = size-1{
							instance_create_depth(x+lengthdir_x((stepsize*i)-offset_place,ang)-lengthdir_x(global._door_offset,ang),y+lengthdir_y((stepsize*i)-offset_place,ang)-lengthdir_y(global._door_offset,ang),depth-10,global._door_object)
						
							break
						//}
					}
				}
		}
		for(var o = 0; o <ds_list_size(connected_to_me);o++){
		
				var ang = point_direction(x,y,connected_to_me[|o].x,connected_to_me[|o].y)
				
				var size = ((scalex/2)-(global._generation_cell_x/2))*place_mul
				
				var stepsize = 1
				
				if scaley > scalex{
					size = scaley
				}
				
				var place_ = global._doors_in
				
				for(var i = 0; i < size;i++){							
					if collision_point(x+lengthdir_x((stepsize*i)-offset_place,ang),y+lengthdir_y((stepsize*i)-offset_place,ang),place_,1,0){	
						//draw_circle(x+lengthdir_x(stepsize*i,ang),y+lengthdir_y(stepsize*i,ang),1,0)
						
						//if i = size-1{
							instance_create_depth(x+lengthdir_x(stepsize*i,ang)-lengthdir_x(global._door_offset,ang),y+lengthdir_y(stepsize*i,ang)-lengthdir_y(global._door_offset,ang),depth-10,global._door_object)
						
							break
						//}
					}
				}
		}

	doors = 1
}

if round(execute) != 0{
	execute = lerp(execute,0,0.2)
	
	
	//stop path
	var ang = 0
	
	var place_ = global._gen_objects
	
	
		
		for(var i = 0; i < (360/global._Generation_angle);i++){	
			var offsetx = global._block_path_offsetx
			var offsety = global._block_path_offsety
		
			var list = ds_list_create()
		
			var line_in = collision_line_list(
						  x+lengthdir_x(scalex/2,ang)-lengthdir_x(offsetx,ang),
						  y+lengthdir_y(scaley/2,ang)-lengthdir_y(offsety,ang),
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
				
				for(var j = 0;j < array_length(global._gen_objects);j++){
					
					if (!instance_exists(list[|k])){
						return;
					}
					
					//list[|k].object_index
					//não existe de alguma forma
					
					if  has_connect and global._gen_objects[j] = list[|k].object_index{
						//está no caminho
						if global._stop_path[j] = 1{
							if global._stop_gen[j] = 1{
								master.restart()
							}
							instance_destroy(list[|k])
						}
					}
				}
			}
		
			ds_list_destroy(list)
			
			ang += global._Generation_angle
		}
		
	
		
		
		
		/////////////////////Inverse Case
		
}




//////////////////////////////////
if global.debug_generation = 1{
	//if sprite_ref != noone{
	////	draw_sprite_ext(sprite_ref,0,x-(scalex/2),y-(scaley/2),(scalex)/global.generation_cell_x,(scaley)/global.generation_cell_y,0,c_white,1)
	//}
	
	draw_set_alpha(0.8)
	draw_set_colour(c_aqua)
	
	if tag != "normal"{
	//	draw_set_colour(c_red)
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