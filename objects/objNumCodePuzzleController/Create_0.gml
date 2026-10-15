randomize()
puzzle_complete = false
solution_length = 4
solution = array_create(solution_length)
for (i = 0; i < solution_length; i++){
	solution[i] = irandom_range(1,9)
}
input_index = 0
show_debug_message("Symbol Puzzle Creation: ")
for (i = 0; i < solution_length; i++){
	show_debug_message("Entry " + string(i+1) + ": " + string(solution[i]))
}
