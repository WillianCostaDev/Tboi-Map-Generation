//local stuff
window_set_fullscreen(1)

//random_set_seed(489798375)

randomise()

global.debug_generation = -1

//execute = 1

var size = 16

Init_WolrdGen(size,size,spr_room,"normal",4,0)

Add_Object_To_Gen(#FF0000,obj_wall)

Start_WolrdGen(room_width/2,room_height/2,6,size,size,size,size,90,2,1)