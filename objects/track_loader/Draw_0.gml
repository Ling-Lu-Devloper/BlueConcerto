/// @desc 等待界面绘制
draw_clear(c_white)
draw_set_font(Shangshou_Pobing_Title)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(#66ccff)
if (loaded){
	draw_text(room_width / 2, room_height / 2, "Done")
	draw_text(room_width / 2, room_height / 2 + 50, "Press Enter to Start")
}else draw_text(room_width / 2, room_height / 2, "LOADING")