//local stuff
window_set_fullscreen(1)

//random_set_seed(489798375)

randomise()

global.debug_generation = -1

//execute = 1

var tile_size = 16

var rooms = [Room_base_1,Room_base_2,Room_base_3,Room_base_4,Room_base_5,Room_base_6,Room_base_7,Room_base_8]

Init_WolrdGen(tile_size,tile_size,Room_base_Init,rooms,obj_door,4,tile_size*2,tile_size*2)

Add_Object_To_Gen(obj_pit,1,1)

Add_Room_To_Gen("shop",Room_base_Init,perpendicular,40,4,1,c_yellow)
Add_Room_To_Gen("boss",Room_base_Init,last,100,1,1,c_red)

Start_WolrdGen(room_width/2,room_height/2,6,90,3)