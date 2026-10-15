if(show_note){
	gui_w = display_get_gui_width()
	gui_h = display_get_gui_height()
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_colour(c_white)
	draw_text(gui_w/2,gui_h-60,"You found a note: POSITION " + string(box_id + 1) + " IS " + string(box_number))
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
}
