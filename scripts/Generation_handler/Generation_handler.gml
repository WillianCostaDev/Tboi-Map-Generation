#macro perpendicular ("perpendicular")
#macro in_path ("in_path")
#macro last ("last")

function Init_WolrdGen(Cell_x_size = 16,Room_Init_Reference,Room_Reference,Door_Object,Door_OffSet,Default_Number_of_Connections = 4,Can_Repeat_Rooms = false,Block_path_offsetx = 16,Block_path_offsety = 16){	
	global._generation_cell_x = Cell_x_size
	global._generation_cell_y = Cell_x_size
	
	global._Repeat_Rooms = Can_Repeat_Rooms
	
	global._generation_rooms = []
	global._default_room = Room_Reference
	global._Init_room = Room_Init_Reference
	
	global._door_offset = Door_OffSet

	global._default_rooms_array = []
	
	
	if is_array(Room_Reference){
		global._default_rooms_array = Room_Reference
	}
	
	
	if array_length(global._default_rooms_array) = 0{
		global._Room_Width = (RoomLoader.DataGetWidth(Room_Reference))/Cell_x_size //Room_size_x
		global._Room_Height =(RoomLoader.DataGetHeight(Room_Reference))/Cell_x_size //Room_size_y
	}else{
		global._Room_Width = (RoomLoader.DataGetWidth(global._default_rooms_array[0]))/Cell_x_size //Room_size_x
		global._Room_Height =(RoomLoader.DataGetHeight(global._default_rooms_array[0]))/Cell_x_size //Room_size_y
	}
	
	
	
	//Support for different rooms
	global._Room_Width_list = []
	global._Room_Height_list = []
	
	global._Generation_angle = 0
	
	global._block_path_offsetx = Block_path_offsetx
	global._block_path_offsety = Block_path_offsety
	
	//Door stuff
	global._door_object = Door_Object
	
	//Objects
	global._gen_objects = []
	global._gen_colors = []
	global._xoffset = []
	global._yoffset = []
	
	global._stop_path = []
	global._stop_gen = []
	global._doors_in = []

	//Type of rooms
	global._default_tag_  = "normal"
	global._default_numb_connections_  = Default_Number_of_Connections

	global._tags_avaliable_index_  = []

	global._rules_per_tag_  = []

	global._chance_spawn_ =[]

	global._numb_connections_  = []

	global._required_spawn_  =[]
		
	global._debug_generation_color = []
}


function Add_Object_To_Gen(Object,Block_doors = 0,Stop_Gen = 0,Can_doors_be_in_this_obj = 0){
	//array_push(global.gen_colors,Color)
	array_push(global._gen_objects,Object)
	//array_push(global.xoffset,Offx)
	//array_push(global.yoffset,Offy)
	array_push(global._stop_path,Block_doors)
	array_push(global._stop_gen,Stop_Gen)
	
	if Can_doors_be_in_this_obj != 0{
		array_push(global._doors_in,Object)
	}
}

function Add_Room_To_Gen(Room_name = "new",Room_Ref,Spawn_Rule = "perpendicular",Spawn_chance = 100,max_number_of_connections = 4,Is_required_to_Spawn = 1,Debug_color = make_colour_rgb(random(255),random(255),random(255))){
	array_push(global._tags_avaliable_index_ ,Room_name)
	array_push(global._generation_rooms,Room_Ref)
	array_push(global._rules_per_tag_ ,Spawn_Rule)
	array_push(global._chance_spawn_ ,Spawn_chance)
	array_push(global._numb_connections_ ,max_number_of_connections)
	array_push(global._required_spawn_ ,Is_required_to_Spawn)
	array_push(global._debug_generation_color ,Debug_color)
	
	//size list
	array_push(global._Room_Width_list,(RoomLoader.DataGetWidth(Room_Ref))/global._generation_cell_x)
	array_push(global._Room_Height_list,(RoomLoader.DataGetHeight(Room_Ref))/global._generation_cell_y)
}


function Start_WolrdGen(Xstart = 0,Ystart = 0,Rooms_Amount = 8,Curve_amount = 90,Forks = 2,Reset_if_Fail = 1){
	Forks = clamp(Forks,0,4)
	
	var Wolrd_Gen_ref = instance_create_depth(Xstart,Ystart,0,obj_generate_ref)
	
	var Dist_mul = 1
	
	if Curve_amount != 90{
		Dist_mul = 1.4
	}
	
	Wolrd_Gen_ref.rooms_amount = Rooms_Amount
	Wolrd_Gen_ref.tile_size_x = global._Room_Width*global._generation_cell_x
	Wolrd_Gen_ref.tile_size_y = global._Room_Height*global._generation_cell_y
	Wolrd_Gen_ref.distx = (global._Room_Width*global._generation_cell_x)*Dist_mul
	Wolrd_Gen_ref.disty = (global._Room_Height*global._generation_cell_y)*Dist_mul
	Wolrd_Gen_ref.angle = Curve_amount
	Wolrd_Gen_ref.forks = Forks
	Wolrd_Gen_ref.reset_if_fail = Reset_if_Fail
	
	var Wolrd_Gen = instance_create_depth(Xstart,Ystart,0,obj_generate)
	
	Wolrd_Gen.Ref = Wolrd_Gen_ref
	
	global._Generation_angle = Curve_amount
}

function Place_object(sprite_ref,index,color,object){
	var placer = instance_create_depth(0,0,depth,placer)
	placer.sprite_index = sprite_ref
	placer.image_index = index
	placer.color = color
	placer.object = object
}