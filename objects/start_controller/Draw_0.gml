/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 
draw_clear(c_black)
if (term == 0 || term == 1){
	draw_sprite_ext(logo, 1, room_width / 2, room_height / 2, 1, 1, 0, c_white, alpha)
}else if (term == 2){
	draw_set_alpha(alpha)
	draw_text(room_width / 2,room_height / 2,text)
}