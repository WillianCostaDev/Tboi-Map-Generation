//local stuff
window_set_fullscreen(1)

//setup
hsize = room_width
wsize = room_height

tile_size = 8

map_sizex = ceil(hsize/tile_size)
map_sizey = ceil(wsize/tile_size)

map = mp_grid_create(0,0,map_sizex,map_sizey,tile_size,tile_size)

rooms = ds_list_create()

var startx = (room_width/2)
var starty = (room_height/2)

//generation

rooms_avaliable = ds_list_create()

//start room
first_room = instance_create_depth(startx,starty,depth,obj_room)
ds_list_add(rooms,first_room)

rooms_amount = 5
forks = 1

//rooms_amount * forks

dist = 8
direc = round(random_range(0,360)/90)*90

for(var k = 0; k < forks; k ++){
	//Bifurcações na geração
	var setx = startx
	var sety = starty
	
	for(var i = 0;i < rooms_amount;i++){
		direc += irandom_range(-1,1)*90
		
		if(collision_circle(setx+lengthdir_x(dist,direc),sety+lengthdir_y(dist,direc),2,obj_room,1,0)){
			for(var l = 0; l < 64; l++){
				direc += irandom_range(-1,1)*90
					
				if !(collision_circle(setx+lengthdir_x(dist,direc),sety+lengthdir_y(dist,direc),2,obj_room,1,0)){
					break;
				}
			}
		}
			
		setx += lengthdir_x(dist,direc)
		sety += lengthdir_y(dist,direc)
		
		var room_ = instance_create_depth(setx,sety,0,obj_room)
		room_.number = i+1
		ds_list_add(rooms,room_)

		mp_grid_add_cell(map,setx/8,sety/8)
	}
}