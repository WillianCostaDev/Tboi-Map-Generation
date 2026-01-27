//local stuff
window_set_fullscreen(1)
//random_set_seed(389798375)

randomise()

global.debug_generation = -1

var size = 16

Init_WolrdGen("normal",4,0)

Add_Room_To_Gen("mini_Boss",perpendicular,25,1,0,c_red)

Start_WolrdGen(room_width/2,room_height/2,4,16,16,16,16,90,3,1)

execute = 1