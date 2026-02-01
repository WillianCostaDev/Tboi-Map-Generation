if execute = 1{
	
	//First Room
	first_room = instance_create_depth(startx,starty,depth,obj_room)
	first_room.room_ref = global._Init_room
	first_room.scalex = tile_size_x
	first_room.scaley = tile_size_y
	first_room.distx = distx
	first_room.disty = disty
	first_room.tag = "normal"
	first_room.angle = angle
	first_room.master = self
	ds_list_add(rooms,first_room)
	
	//Forks in the Generation
	for(var k = 0; k < forks; k ++){
		var setx = startx
		var sety = starty
	
		for(var i = 0;i < actual_room_amount;i++){
			if forks > 2 and i = 0{
				direc = start_angle + (90*k)
			}else{
				direc += irandom_range(-1,1)*angle
			}
		
			if(collision_circle(setx+lengthdir_x(distx,direc),sety+lengthdir_y(disty,direc),radius_set/div_check,obj_room,1,0)){
				for(var l = 0; l < try_fix_amount; l++){
					direc += irandom_range(-1,1)*angle
					
					if !(collision_circle(setx+lengthdir_x(distx,direc),sety+lengthdir_y(disty,direc),2,obj_room,1,0)){
						break;
					}else{
						restart()
						break;
					}
				}
			}
			
			setx += lengthdir_x(distx,direc)
			sety += lengthdir_y(disty,direc)
		
			//Actual room
			var room_ = instance_create_depth(setx,sety,0,obj_room)
			ds_list_add(rooms,room_)
			
			if array_length(global._default_rooms_array) = 0{
				room_.room_ref = global._default_room
			}else{
				room_.room_ref = global._default_rooms_array[irandom_range(0,array_length(global._default_rooms_array)-1)]
			}
			room_.scalex = tile_size_x
			room_.scaley = tile_size_y
			room_.distx = distx
			room_.disty = disty
			room_.number = i+1
			room_.tag = default_tag
			room_.max_number_of_connections = default_numb_connections
			room_.angle = angle
			room_.master = self
		
			//Type of Room:
		
			for(var z = 0; z < array_length(rooms_avaliable); z++){
				var tile_size_x_gen = global._Room_Width_list[clamp(z,0,array_length(global._Room_Width_list)-1)] *global._generation_cell_x
				var tile_size_y_gen = global._Room_Height_list[clamp(z,0,array_length(global._Room_Height_list)-1)] *global._generation_cell_y
				
				var distx_gen = global._Room_Width_list[clamp(z,0,array_length(global._Room_Width_list)-1)] *global._generation_cell_x
				var disty_gen = global._Room_Height_list[clamp(z,0,array_length(global._Room_Height_list)-1)] *global._generation_cell_y
				
				var ref_room =  global._generation_rooms[clamp(z,0,array_length(global._generation_rooms)-1)]
				
				var offx = 0
				var offy = 0
				
				var room_Set = global._generation_rooms[clamp(z,0,array_length(global._generation_rooms)-1)]
				
				//perpendicular rooms
				var perpendicular_case = rules_per_tag[z] = "perpendicular" and irandom_range(0,100) > 100-chance_spawn[z] and i != actual_room_amount-1
			
				var perpendicular_case_fix = i = actual_room_amount-2 and k = forks-1
			
				var required_perpendicular = rules_per_tag[z] = "perpendicular" and required_spawn[z] = 1 and perpendicular_case_fix
			
				if perpendicular_case or required_perpendicular{
					rules_per_tag[z] = "done"
				
					var ang = choose(90,-90)
				
					if(collision_circle(setx+lengthdir_x(distx_gen,direc+ang),sety+lengthdir_y(disty_gen,direc+ang),radius_set/div_check,obj_room,1,0)){
						ang += 180
					
						if(collision_circle(setx+lengthdir_x(distx_gen,direc+ang),sety+lengthdir_y(disty_gen,direc+ang),radius_set/div_check,obj_room,1,0)) and required_perpendicular{
							restart()
						}
					}
				
					//generate other rooms
					var room_p = instance_create_depth(setx+offx+lengthdir_x(distx_gen,direc+ang),sety+offy+lengthdir_y(disty_gen,direc+ang),0,obj_room)
					room_p.room_ref = global._generation_rooms[clamp(z,0,array_length(global._generation_rooms)-1)]
					room_p.scalex = tile_size_x_gen
					room_p.scaley = tile_size_y_gen
					room_p.distx = distx_gen
					room_p.disty = disty_gen
					room_p.tag = tags_avaliable_index[z]
					room_p.number = -i-1
					room_p.max_number_of_connections = numb_connections[z]
					room_p.angle = angle
					room_p.debug_color = debug_color[z]
					room_p.master = self
					ds_list_add(rooms,room_p)
	
				}
			
				//Last rooms
				var last_case = rules_per_tag[z] = "last" and i = actual_room_amount -1 and irandom_range(0,100) > 100-chance_spawn[z] and room_.tag = default_tag
			
				var required_last = rules_per_tag[z] = "last" and i = actual_room_amount-1 and required_spawn[z] = 1
			
				var last_group = last_case or required_last
			
				if last_group and room_.tag = default_tag{
					room_.x += offx
					room_.y += offy
					room_.room_ref = global._generation_rooms[clamp(z,0,array_length(global._generation_rooms)-1)]
					room_.tag = tags_avaliable_index[z]
					room_.scalex = tile_size_x_gen
					room_.scaley = tile_size_y_gen
					room_.distx = distx_gen
					room_.disty = disty_gen
					room_.number = -i-1
					room_.max_number_of_connections = numb_connections[z]
					room_.angle = angle
					room_.debug_color = debug_color[z]
					room_.master = self
					rules_per_tag[z] = "done"
				}else if last_group{
					if k = forks-1 {
						if required_spawn[z] = 1{
							restart()
						}
					}
				}
			
				//Inpath rooms
				var in_path_case = rules_per_tag[z] = "in_path" and irandom_range(0,100) > 100-chance_spawn[z] and room_.tag = default_tag
			
				var required_in_path = rules_per_tag[z] = "in_path" and i = actual_room_amount-1 and required_spawn[z] = 1
			
				if in_path_case or required_in_path{
					room_.x += offx
					room_.y += offy
					room_.room_ref = global._generation_rooms[clamp(z,0,array_length(global._generation_rooms)-1)]
					room_.tag = tags_avaliable_index[z]
					room_.scalex = tile_size_x_gen
					room_.scaley = tile_size_y_gen
					room_.distx = distx_gen
					room_.disty = disty_gen
					room_.number = i+1
					room_.max_number_of_connections = numb_connections[z]
					room_.angle = angle
					room_.debug_color = debug_color[z]
					room_.master = self
					rules_per_tag[z] = "done"
				}	
			}

		
			//////end
		}
	}
	execute = 0
}

if execute = -1{
	execute = 1
}