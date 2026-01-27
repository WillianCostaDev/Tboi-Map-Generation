for(var i = 0; i < array_length(global.numb_connections_);i++){
	draw_set_halign(fa_left)
	draw_set_valign(fa_left)
	draw_text(2,2+(i*20),global.numb_connections_[i])
}