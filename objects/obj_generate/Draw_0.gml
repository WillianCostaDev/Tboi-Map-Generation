
if execute = 1{
	draw_set_halign(fa_center)
	draw_set_valign(fa_center)
	draw_set_font(Generation_Font)
	draw_text_ext_transformed(room_width/2,room_height/2,"Generating...",0,room_width,camera_get_view_width(view_camera[0])/2000,camera_get_view_width(view_camera[0])/2000,0)
	draw_set_font(-1)
	draw_set_halign(-1)
	draw_set_valign(-1)
}

