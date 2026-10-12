with(objEmptyCubicle){
	highlighted = false
}
target = sequence[display_index]
with(objEmptyCubicle){
	if(cubicle_id == other.target){
		highlighted = true
	}
}
show_debug_message("Highlighting Cubicle: " + string(target))
alarm[1] = highlight_time