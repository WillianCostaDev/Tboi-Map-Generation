//local stuff
window_set_fullscreen(1)
randomize()

var size = 16

Init_WolrdGen(1)

//Add_Room_To_Gen("shop","perpendicular",45,4,0,c_lime)
Add_Room_To_Gen("shop","in_path",20,4,0,c_lime)

Start_WolrdGen(room_width/2,room_height/2,8,16,16,16,16,90,2,1)

global.debug = -1