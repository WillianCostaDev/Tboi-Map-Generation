//local stuff
window_set_fullscreen(1)

//random_set_seed(489798375)

randomise()

global.debug_generation = -1

//execute = 1

var tile_size = 16
var sizex = 17
var sizey = 17

Init_WolrdGen(tile_size,tile_size,spr_room_init,spr_room_normal,"normal",4,tile_size*4)

Add_Object_To_Gen(#FF0000,obj_wall,0,0,0,0)
Add_Object_To_Gen(#000000,obj_pit,0,0,1,0)
Add_Object_To_Gen(#0000FF,obj_enemie,0,0,1,0)
Add_Object_To_Gen(#FFFF00,obj_chest,0,0,0,0)

Add_Room_To_Gen("Boss",spr_room_boss,last,100,1,1,c_red)
Add_Room_To_Gen("Shop",spr_room_shop,perpendicular,100,1,1,c_yellow)

//Start_WolrdGen(room_width/2,room_height/2,6,sizex,sizey,sizex,sizey,90,2,1)
Start_WolrdGen(room_width/2,room_height/2,6,sizex,sizey,sizex,sizey,90,2,1)