with(objEmptyCubicle){
	highlighted = false
}
display_index ++
if(display_index < sequence_length){
	alarm[0] = time_gap
}
else{
	showing_sequence = false
	camera_set_view_pos(cam,normalcamX,normalcamY)
	camera_set_view_size(cam,normalcamW,normalcamH)
	accepting_input = true
	input_index = 0
	show_debug_message("Finished sequence - player can now make the pattern")
}