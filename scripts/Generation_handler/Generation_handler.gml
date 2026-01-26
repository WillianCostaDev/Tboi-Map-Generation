#macro perpendicular ("perpendicular")
#macro in_path ("in_path")
#macro last ("last")

function Init_WolrdGen(Default_Config = 1){
	if Default_Config{
		//Type of rooms
		global.default_tag_  = "normal"
		global.default_numb_connections_  = 4

		global.tags_avaliable_index_  = ["boss","chest","secret"]

		global.rules_per_tag_  = ["last","perpendicular","perpendicular"]

		global.chance_spawn_ =[100,25,25]

		global.numb_connections_  = [1,1,1]

		global.required_spawn_  =[1,1,1]
		
		global.debug_color = [c_red,c_yellow,c_purple]
	}else{
		//Type of rooms
		global.default_tag_  = "normal"
		global.default_numb_connections_  = 4

		global.tags_avaliable_index_  = []

		global.rules_per_tag_  = []

		global.chance_spawn_ =[]

		global.numb_connections_  = []

		global.required_spawn_  =[]
		
		global.debug_color = []
	}
}

function Add_Room_To_Gen(Room_name = "new",Spawn_Rule = "perpendicular",Spawn_chance = 100,max_number_of_connections = 4,Is_required_to_Spawn = 1,Debug_color = make_colour_rgb(random(255),random(255),random(255))){
	array_push(global.tags_avaliable_index_ ,Room_name)
	array_push(global.rules_per_tag_ ,Spawn_Rule)
	array_push(global.chance_spawn_ ,Spawn_chance)
	array_push(global.numb_connections_ ,max_number_of_connections)
	array_push(global.required_spawn_ ,Is_required_to_Spawn)
	array_push(global.debug_color ,Debug_color)
}


function Start_WolrdGen(Xstart = 0,Ystart = 0,Rooms_Amount = 8,Room_Width = 8,Room_Height = 8,Horizontal_Distance_between_rooms = 8,Vertical_Distance_between_rooms = 8,Curve_amount = 90,Forks = 2,Reset_if_Fail = 1){
	Forks = clamp(Forks,0,4)
	
	var Wolrd_Gen_ref = instance_create_depth(Xstart,Ystart,0,obj_generate_ref)
	
	Wolrd_Gen_ref.rooms_amount = Rooms_Amount
	Wolrd_Gen_ref.tile_size_x = Room_Width
	Wolrd_Gen_ref.tile_size_y = Room_Height
	Wolrd_Gen_ref.distx = Horizontal_Distance_between_rooms
	Wolrd_Gen_ref.disty = Vertical_Distance_between_rooms
	Wolrd_Gen_ref.angle = Curve_amount
	Wolrd_Gen_ref.forks = Forks
	Wolrd_Gen_ref.reset_if_fail = Reset_if_Fail
	
	var Wolrd_Gen = instance_create_depth(Xstart,Ystart,0,obj_generate)
	
	Wolrd_Gen.Ref = Wolrd_Gen_ref
}