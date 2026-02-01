//local stuff
window_set_fullscreen(1)

//random_set_seed(489798375)

randomise()

global.debug_generation = -1

//execute = 1

var tile_size = 16

var rooms = [Room_base,Room_base,Room_base,Room_base]

Init_WolrdGen(tile_size,tile_size,Room_base,rooms,obj_door,1,4,true,tile_size*2,tile_size*2)

Add_Object_To_Gen(obj_wall_in,1,0)

Add_Room_To_Gen("shop",Room_base,perpendicular,40,1,1,c_yellow)
Add_Room_To_Gen("boss",Room_base_Init,last,100,1,1,c_red)

Start_WolrdGen(room_width/2,room_height/2,6,90,3)