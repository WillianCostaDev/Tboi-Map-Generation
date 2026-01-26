if execute = 1{
	execute = 0
	
	if collision_point(x,y,obj_room,1,1){
		instance_destroy()
	}
	
	var numb_connect = max_number_of_connections > 0

	var inst = obj_room
	
	if number < 0{
	for(var i = 0; i < (360/angle);i++){
		var place1 = collision_circle(x+lengthdir_x(distx,i*angle),y+lengthdir_y(disty,i*angle),scalex/4,inst,1,0)
	
		if place1 and place1.number > 0 and numb_connect{
			ds_list_add(connections,place1)
			max_number_of_connections -= 1
		}
	}
		return;
	}
	
	
	for(var i = 0; i < (360/angle);i++){
		var place1 = collision_circle(x+lengthdir_x(distx,i*angle),y+lengthdir_y(disty,i*angle),scalex/4,inst,1,0)
	
		if place1 and place1.number = number+1 and numb_connect{
			ds_list_add(connections,place1)
			max_number_of_connections -= 1
		}
	}
}