if execute = 1{
	execute = 0
	
	if collision_point(x,y,obj_room,1,1){
		instance_destroy()
	}
	
	var numb_connect = max_number_of_connections > 0
	
	if number < 0{
		var inst = obj_room
	
		var place1 = collision_circle(x-distx,y,scalex/4,inst,1,0)
	
		if place1 and place1.number > 0 and numb_connect{
			ds_list_add(place1.connections,self)
			max_number_of_connections -= 1
		}
		var place2 = collision_circle(x+distx,y,scalex/4,inst,1,0)
	
		if place2 and place2.number > 0 and numb_connect{
			ds_list_add(place2.connections,self)
			max_number_of_connections -= 1
		}
		var place3 = collision_circle(x,y-disty,scaley/4,inst,1,0)
	
		if place3 and place3.number > 0 and numb_connect{
			ds_list_add(place3.connections,self)
			max_number_of_connections -= 1
		}
		var place4 = collision_circle(x,y+disty,scaley/4,inst,1,0)
	
		if place4 and place4.number > 0 and numb_connect{
			ds_list_add(place4.connections,self)
			max_number_of_connections -= 1
		}
		return;
	}
	
	var inst = obj_room
	
	var place1 = collision_circle(x-distx,y,scalex/4,inst,1,0)
	
	if place1 and place1.number = number+1 and numb_connect{
		ds_list_add(connections,place1)
		max_number_of_connections -= 1
	}
	var place2 = collision_circle(x+distx,y,scalex/4,inst,1,0)
	
	if place2 and place2.number = number+1 and numb_connect{
		ds_list_add(connections,place2)
		max_number_of_connections -= 1
	}
	var place3 = collision_circle(x,y-disty,scaley/4,inst,1,0)
	
	if place3 and place3.number = number+1 and numb_connect{
		ds_list_add(connections,place3)
		max_number_of_connections -= 1
	}
	var place4 = collision_circle(x,y+disty,scaley/4,inst,1,0)
	
	if place4 and place4.number = number+1 and numb_connect{
		ds_list_add(connections,place4)
		max_number_of_connections -= 1
	}
}