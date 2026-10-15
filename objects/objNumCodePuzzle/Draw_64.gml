if(keypad_open){
	//keypad panel
	gui_w = display_get_gui_width()
	gui_h = display_get_gui_height()
	panel_w = 420
	panel_h = 500
	panel_x = (gui_w - panel_w)/2
	panel_y = (gui_h - panel_h)/2
	//background
	draw_set_color(make_colour_rgb(40,70,75))
	draw_rectangle(panel_x,panel_y,panel_x + panel_w,panel_y + panel_h, false)
	
	//border
	draw_set_color(c_white)
	draw_rectangle(panel_x,panel_y,panel_x + panel_w,panel_y + panel_h, true)
	
	//display screen at top of keypad
	draw_set_colour(c_black)
	draw_rectangle(panel_x+40,panel_y+30,panel_x + panel_w-40,panel_y + 100, false)
	
	//Buttons
	button_size = 75
	gap = 15
	start_x = panel_x + 80
	start_y = panel_y + 130
	for(i = 0;i<9;i++){
		col = i mod 3
		row = i div 3
		bx = start_x + col * (button_size + gap)
		by = start_y + row * (button_size + gap)
		draw_set_color(make_color_rgb(80,130,130))
		draw_rectangle(bx,by,bx+button_size,by+button_size,false)
		draw_set_color(c_white)
		draw_rectangle(bx,by,bx+button_size,by+button_size,true)
		
		//text on buttons
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_text(bx+button_size/2,by+button_size/2,string(i+1))
	}
		
	//Delete Button
	bottom_y = start_y + 3 * (button_size + gap)
	draw_set_color(c_red)
	draw_rectangle(start_x,bottom_y,start_x + button_size,bottom_y + button_size,false)
	draw_set_color(c_white)
	draw_text(start_x + button_size/2, bottom_y + button_size/2, "X")
		
	//Submit Button
	submit_x = start_x + 2 * (button_size + gap)
	draw_set_color(c_green)
	draw_rectangle(submit_x,bottom_y,submit_x + button_size,bottom_y + button_size,false)
	draw_set_color(c_white)
	draw_text(submit_x + button_size/2, bottom_y + button_size/2, "OK")
		
	//To restore the alignment
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	var code_text = "";

	for (var i = 0; i < array_length(entered_code); i++)
	{
		code_text += string(entered_code[i]);
	}

	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	draw_text(
		gui_w / 2,
		panel_y + 65,
		code_text
	);
		
}
