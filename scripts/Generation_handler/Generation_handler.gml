

function Start_WolrdGen(Rooms_Amount = 8,Room_Size = 8,Distance_between_rooms = 8,Curve_amount = 90,Forks = 2,Reset_if_Fail = 1){
	Forks = clamp(Forks,0,4)
	
	var Wolrd_Gen_ref = instance_create_depth(0,0,0,obj_generate_ref)
	
	Wolrd_Gen_ref.rooms_amount = Rooms_Amount
	Wolrd_Gen_ref.tile_size = Room_Size
	Wolrd_Gen_ref.dist = Distance_between_rooms
	Wolrd_Gen_ref.angle = Curve_amount
	Wolrd_Gen_ref.forks = Forks
	Wolrd_Gen_ref.reset_if_fail = Reset_if_Fail
	
	var Wolrd_Gen = instance_create_depth(0,0,0,obj_generate)
	
	Wolrd_Gen.Red = Wolrd_Gen_ref
}

//rooms_amount = 16
//forks = 2			  //max = 4 or if reset on fail = 0, there is no limit
//angle = 90
//try_fix_amount = 32
//reset_if_fail = 1
//dist = 8