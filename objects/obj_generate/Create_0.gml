//setup
Ref = instance_nearest(x,y,obj_generate_ref)

if !instance_exists(Ref){
	return;
}

hsize = x
wsize = y

startx = x
starty = y

tile_size_x = Ref.tile_size_x
tile_size_y = Ref.tile_size_y

map_sizex = ceil(hsize/tile_size_x)
map_sizey = ceil(wsize/tile_size_y)

//map = mp_grid_create(0,0,map_sizex,map_sizey,tile_size,tile_size)

rooms = ds_list_create()

rooms_avaliable = ds_list_create()

//generation
rooms_amount = Ref.rooms_amount//16
forks = Ref.forks			  //max = 4 or if reset on fail = 0, there is no limit
angle = Ref.angle
try_fix_amount = 32
reset_if_fail = Ref.reset_if_fail
distx = Ref.distx
disty = Ref.disty

radius_set = tile_size_y

//start room
first_room = instance_create_depth(startx,starty,depth,obj_room)
first_room.scalex = tile_size_x
first_room.scaley = tile_size_y
first_room.distx = distx
first_room.disty = disty
first_room.tag = "normal"
ds_list_add(rooms,first_room)

//dist

div_check = 2

//error --
got_error = 0
pause = 0

restart = function(){
	if reset_if_fail = 1{
		room_restart()
	}else{
		got_error = 1
	}
}

//Type of rooms
default_tag = "normal"
default_numb_connections = 4

tags_avaliable_index = 
[
"boss",
"chest",
"secret"
]

rules_per_tag = 
[
"last",
"perpendicular",
"perpendicular"
]

chance_spawn =
[
100,
25,
25
]

numb_connections = 
[
1,
1,
1,
]

required_spawn =
[
1,
1,
1
]

for(var i = 0; i < array_length(tags_avaliable_index);i++){
	ds_list_add(rooms_avaliable,tags_avaliable_index[i])
}

//rooms_amount * forks
start_angle = round(random_range(0,360)/angle)*angle

if angle != 0{
	direc = round(random_range(0,360)/angle)*angle
	start_angle = direc
}else{
	direc = 0
}

actual_room_amount = ceil(rooms_amount/forks)

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
		
		if pause = 0{
			//Actual room
			var room_ = instance_create_depth(setx,sety,0,obj_room)
			ds_list_add(rooms,room_)
			
			room_.scalex = tile_size_x
			room_.scaley = tile_size_y
			room_.distx = distx
			room_.disty = disty
			room_.number = i+1
			room_.tag = default_tag
			room_.max_number_of_connections = default_numb_connections
		}else{
			break;
		}
		
		//Type of Room:
		
		for(var z = 0; z < ds_list_size(rooms_avaliable); z++){
			//Last rooms
			var last_case = rules_per_tag[z] = "last" and i = actual_room_amount -1 and irandom_range(0,100) > 100-chance_spawn[z]
			
			var required_last = rules_per_tag[z] = "last" and i = actual_room_amount-1 and required_spawn[z] = 1
			
			if last_case or required_last{
				room_.tag = tags_avaliable_index[z]
				rules_per_tag[z] = "done"
			}	
			
			
			//perpendicular rooms
			var perpendicular_case = rules_per_tag[z] = "perpendicular" and irandom_range(0,100) > 100-chance_spawn[z] and i != actual_room_amount-1
			
			var perpendicular_case_fix = i = actual_room_amount-2 and k = forks-1
			
			var required_perpendicular = rules_per_tag[z] = "perpendicular" and required_spawn[z] = 1 and perpendicular_case_fix
			
			if perpendicular_case or required_perpendicular{
				rules_per_tag[z] = "done"
				
				var ang = choose(90,-90)
				
				if(collision_circle(setx+lengthdir_x(distx,direc+ang),sety+lengthdir_y(disty,direc+ang),radius_set/div_check,obj_room,1,0)){
					ang += 180
					
					if(collision_circle(setx+lengthdir_x(distx,direc+ang),sety+lengthdir_y(disty,direc+ang),radius_set/div_check,obj_room,1,0)){
						restart()
					}
				}
				
				if pause = 0{
					//generate other rooms
					var room_p = instance_create_depth(setx+lengthdir_x(distx,direc+ang),sety+lengthdir_y(disty,direc+ang),0,obj_room)
					room_p.scalex = tile_size_x
					room_p.scaley = tile_size_y
					room_p.distx = distx
					room_p.disty = disty
					room_p.tag = tags_avaliable_index[z]
					room_p.number = -i-1
					room_p.max_number_of_connections = numb_connections[z]
					ds_list_add(rooms,room_p)
				}else{
					break;
				}
			}
		}

		
		//////end
	}
}

