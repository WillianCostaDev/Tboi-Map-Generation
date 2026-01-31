execute = -1

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

rooms_avaliable = []

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
first_room = noone

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
default_tag = global._default_tag_
default_numb_connections = global._default_numb_connections_

tags_avaliable_index = array_create(array_length(global._tags_avaliable_index_),noone) 

for(var i = 0; i < array_length(global._tags_avaliable_index_);i++){
	array_push(tags_avaliable_index,global._tags_avaliable_index_[i])
}

rules_per_tag = array_create(array_length(global._rules_per_tag_),noone) 

for(var i = 0; i < array_length(global._rules_per_tag_);i++){
	array_push(rules_per_tag,global._rules_per_tag_[i])
}

chance_spawn = array_create(array_length(global._chance_spawn_),noone) 

for(var i = 0; i < array_length(global._chance_spawn_);i++){
	array_push(chance_spawn,global._chance_spawn_[i])
}

numb_connections = array_create(array_length(global._numb_connections_),noone) 

for(var i = 0; i < array_length(global._numb_connections_);i++){
	array_push(numb_connections,global._numb_connections_[i])
}

required_spawn = array_create(array_length(global._required_spawn_),noone) 

for(var i = 0; i < array_length(global._required_spawn_);i++){
	array_push(required_spawn,global._required_spawn_[i])
}
debug_color = array_create(array_length(global._debug_generation_color),noone) 

for(var i = 0; i < array_length(global._debug_generation_color);i++){
	array_push(debug_color,global._debug_generation_color[i])
}
/////////////
for(var i = 0; i < array_length(tags_avaliable_index);i++){
	array_push(rooms_avaliable,tags_avaliable_index[i])
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



