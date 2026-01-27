if variable_instance_exists(self,"connections"){
	ds_list_destroy(connections)
}

if variable_instance_exists(self,"connected_to_me"){
	ds_list_destroy(connected_to_me)
}