//local stuff
window_set_fullscreen(1)
//random_set_seed(389798375)

randomise()

global.debug_generation = -1

var size = 16

Init_WolrdGen("normal",4,1)

Add_Room_To_Gen("Boss",last,100,1,1,c_blue)
Add_Room_To_Gen("Boss",last,100,1,1,c_green)
Add_Room_To_Gen("Boss",last,100,1,1,c_red)
Add_Room_To_Gen("Boss",last,100,1,1,c_orange)

Start_WolrdGen(room_width/2,room_height/2,6,16,16,16,16,90,3,1)

execute = 1