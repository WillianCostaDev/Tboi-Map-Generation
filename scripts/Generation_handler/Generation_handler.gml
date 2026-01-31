#macro perpendicular ("perpendicular")
#macro in_path ("in_path")
#macro last ("last")

function Init_WolrdGen(Cell_x_size = 16,Cell_y_size = 16,Room_size_x,Room_size_y,Room_Init_Reference,Room_Reference,Door_Object,Default_Number_of_Connections = 4,Block_path_offsetx = 16,Block_path_offsety = 16){	
	global.generation_cell_x = Cell_x_size
	global.generation_cell_y = Cell_y_size
	
	global.generation_rooms = []
	global.default_room = Room_Reference
	global.Init_room = Room_Init_Reference
	
	global.Room_Width = Room_size_x
	global.Room_Height = Room_size_y
	
	global.Generation_angle = 0
	
	global.block_path_offsetx = Block_path_offsetx
	global.block_path_offsety = Block_path_offsety
	
	//Door stuff
	global.door_object = Door_Object
	
	//Objects
	global.gen_objects = []
	global.gen_colors = []
	global.xoffset = []
	global.yoffset = []
	
	global.stop_path = []
	global.stop_gen = []

	//Type of rooms
	global.default_tag_  = "normal"
	global.default_numb_connections_  = Default_Number_of_Connections

	global.tags_avaliable_index_  = []

	global.rules_per_tag_  = []

	global.chance_spawn_ =[]

	global.numb_connections_  = []

	global.required_spawn_  =[]
		
	global.debug_generation_color = []
}


//function Add_Object_To_Gen(Color,Object,Offx=0,Offy=0,Block_doors = 0,Stop_Gen = 0){
//	array_push(global.gen_colors,Color)
//	array_push(global.gen_objects,Object)
//	array_push(global.xoffset,Offx)
//	array_push(global.yoffset,Offy)
//	array_push(global.stop_path,Block_doors)
//	array_push(global.stop_gen,Stop_Gen)
//}

function Add_Room_To_Gen(Room_name = "new",Sprite_Ref,Spawn_Rule = "perpendicular",Spawn_chance = 100,max_number_of_connections = 4,Is_required_to_Spawn = 1,Debug_color = make_colour_rgb(random(255),random(255),random(255))){
	array_push(global.tags_avaliable_index_ ,Room_name)
	array_push(global.generation_rooms,Sprite_Ref)
	array_push(global.rules_per_tag_ ,Spawn_Rule)
	array_push(global.chance_spawn_ ,Spawn_chance)
	array_push(global.numb_connections_ ,max_number_of_connections)
	array_push(global.required_spawn_ ,Is_required_to_Spawn)
	array_push(global.debug_generation_color ,Debug_color)
}


function Start_WolrdGen(Xstart = 0,Ystart = 0,Rooms_Amount = 8,Horizontal_Distance_between_rooms = 8,Vertical_Distance_between_rooms = 8,Curve_amount = 90,Forks = 2,Reset_if_Fail = 1){
	Forks = clamp(Forks,0,4)
	
	var Wolrd_Gen_ref = instance_create_depth(Xstart,Ystart,0,obj_generate_ref)
	
	Wolrd_Gen_ref.rooms_amount = Rooms_Amount
	Wolrd_Gen_ref.tile_size_x = global.Room_Width*global.generation_cell_x
	Wolrd_Gen_ref.tile_size_y = global.Room_Height*global.generation_cell_y
	Wolrd_Gen_ref.distx = Horizontal_Distance_between_rooms*global.generation_cell_x
	Wolrd_Gen_ref.disty = Vertical_Distance_between_rooms*global.generation_cell_y
	Wolrd_Gen_ref.angle = 90
	Wolrd_Gen_ref.forks = Forks
	Wolrd_Gen_ref.reset_if_fail = Reset_if_Fail
	
	var Wolrd_Gen = instance_create_depth(Xstart,Ystart,0,obj_generate)
	
	Wolrd_Gen.Ref = Wolrd_Gen_ref
	
	global.Generation_angle = Curve_amount
}

function Place_object(sprite_ref,index,color,object){
	var placer = instance_create_depth(0,0,depth,placer)
	placer.sprite_index = sprite_ref
	placer.image_index = index
	placer.color = color
	placer.object = object
}