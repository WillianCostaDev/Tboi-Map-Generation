//Determine values


if execute = 1{
	//=== Determine Width and Height ==//
	var _spr = sprite_index,
		_ww = sprite_get_width(_spr),
		_hh = sprite_get_height(_spr);

	//=== Create Surface ===//
	var _surf=surface_create(_ww, _hh);
	surface_set_target(_surf);
	draw_clear_alpha(0, 0);		
	draw_sprite(_spr, -1, 0, 0);
	surface_reset_target();

	//=== Surface to Buffer ===//
	_buff=buffer_create(4 * _ww * _hh, buffer_fixed, 1);
	buffer_get_surface(_buff, _surf, 0);
	surface_free(_surf);// we don't need the surface anymore

	//=== Extracting Color Info ===//
	// this is an example for a single pixel, you can of course loop all pixels, or access only specific ones!
	// Pixel coordinates [x,y] start at [0,0] and should not exceed [_ww-1,_hh-1]
	for( var ii=0;ii<sprite_height;ii++)
			for (var i = 0;i<sprite_width;i++){
			var _x = i,
				_y = ii,				
				pixel = buffer_peek(_buff, 4 * (_x + _y * _ww), buffer_u32)	// extracts info in ABGR Format
				
			if pixel = undefined {
				return;
			}
				
			var	a = (pixel >> 24) & $ff,	// Alpha [0-255]	
				r = pixel & $ff,			// Red [0-255]	
				g = (pixel >> 8) & $ff,		// Green [0-255]	
				b = (pixel >> 16) & $ff;	// Blue [0-255]	
				
				for(var o = 0; o < array_length(global.gen_colors);o++){
					if make_colour_rgb(r,g,b) = global.gen_colors[o]{
						object = global.gen_objects[o]
						color = make_colour_rgb(r,g,b)
					}
				}
	
				//colision
				if make_colour_rgb(r,g,b) = color{
					var Inst = instance_create_depth(x+_x*global.generation_cell_x,y+_y*global.generation_cell_y,depth,object)
					Inst.image_xscale = 1
					Inst.image_yscale = 1
				}	

			}
		// === Cleanup ===//
		buffer_delete(_buff);  
		
		execute = 0
}

