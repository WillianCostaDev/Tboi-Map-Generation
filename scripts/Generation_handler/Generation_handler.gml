

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
	
	Wolrd_Gen.Red = Wolrd_Gen_ref
}