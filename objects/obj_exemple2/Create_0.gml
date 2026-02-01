//local stuff
window_set_fullscreen(1)

//random_set_seed(489798375)

randomise()

global.debug_generation = -1

//execute = 1

var tile_size = 16
var sizex = 19
var sizey = 13

var rooms = [Room_base_1]

Init_WolrdGen(tile_size,tile_size,Room_base_1,Room_base_1,obj_door,4,tile_size*4,tile_size*2)

Add_Room_To_Gen("test",Room_base_1,in_path,40,4,1,c_green)
Add_Room_To_Gen("boss",Room_base_1,last,100,1,1,c_red)

Start_WolrdGen(room_width/2,room_height/2,6,2,2)