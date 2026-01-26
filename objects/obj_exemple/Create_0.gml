//local stuff
window_set_fullscreen(1)
randomize()

if room = Exemple{
	Start_WolrdGen(room_width/2,room_height/2,8,16,16,16,16,90,2,1)
}else{
	Start_WolrdGen(room_width/2,room_height/2,8,160,90,160,90,90,2,1)
}

global.debug = -1