randomize()
in_range = false;
interaction_distance = 100;
sequence_length = 6
sequence = array_create(sequence_length)
for(i=0;i < sequence_length;i++){
	sequence[i] = irandom_range(1,24)
}
display_index = 0
showing_sequence = false
highlight_time = 45
time_gap = 15
show_debug_message("Sequence Created")
for(i=0;i < sequence_length;i++){
	show_debug_message("Sequence " + string(i+1) + ": Cubicle " + string(sequence[i]))
}
input_index = 0
accepting_input = false
puzzle_complete = false
cam = view_camera[0]
normalcamX = 0
normalcamY = 0
normalcamW = 0
normalcamH = 0
