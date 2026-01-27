if execute = 1{
	def_max_number_of_connections = max_number_of_connections
	
	execute = -1
	
	if collision_point(x,y,obj_room,1,1){
		instance_destroy()
	}
	
	var numb_connect = max_number_of_connections > 0

	var inst = obj_room
	
	//connect
	
	for(var i = 0; i < (360/angle);i++){
		var place2 = collision_circle(x+lengthdir_x(distx,i*angle),y+lengthdir_y(disty,i*angle),scalex/4,inst,1,0)
	
		if place2 and numb_connect{
				
			var number_valid = abs(place2.number) = number+1 or abs(place2.number) = number
				
			var compatible = number_valid and place2.max_number_of_connections > 0
				
			if compatible{
			
				ds_list_add(place2.connected_to_me,self)
				ds_list_add(connections,place2)
				max_number_of_connections -= 1
				place2.max_number_of_connections -= 1
			
			}
		}
	}
	
//	}
}

//if execute = -1{
//	execute = 0
	
//	var num = 0
	
//	for(var i = 0 ;i < ds_list_size(connected_to_me);i++){
//		num += 1
//	}
	
//	if num > def_max_number_of_connections{
//		ds_list_delete(connected_to_me,num)
//	}
//}