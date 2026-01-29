
if global.debug_generation = 1{
	draw_set_halign(fa_center)
	draw_set_valign(fa_center)
	//draw_text_transformed((x/1.2)-44,(y/1.2)-32,number,0.7,0.7,0)
	//draw_text_transformed((x),(y),number,0.7,0.7,0)

	draw_text_transformed((x),(y),scalex/global.generation_cell_x,0.7,0.7,0)

	//draw_text_transformed((x)-4,(y),def_max_number_of_connections,0.5,0.5,0)
	//draw_text_transformed((x)+4,(y),ds_list_size(connected_to_me),0.5,0.5,0)

	//draw_text_transformed((x),(y)-16,max_number_of_connections,0.7,0.7,0)
}
