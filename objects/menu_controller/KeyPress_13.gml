/// @description 进入相应谱面
	global.selected_bitmap = (selected_column - 1) * index_per_column + selected_line
	room_goto(track_load)
