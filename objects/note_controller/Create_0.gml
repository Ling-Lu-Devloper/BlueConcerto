

/*inst_game_controller.clock.VariableInterpolate("x", "iotaX")
inst_game_controller.clock.VariableInterpolate("y", "iotaY")
inst_game_controller.clock.AddTickMethod(function(){
	_current_tap_time = global.tap_arr[0].time
	_current_drag_time = global.drag_arr[0].time
	_current_long_time = global.long_arr[0].time
	_current_any_time = global.any_arr[0].time
	_long_end_time = global.long_arr[0].endtime - _current_any_time
	_any_end_time = global.any_arr[0].endtime - _current_any_time
	timer = inst_game_controller.clock.GetRemainder()
	if (timer == _current_tap_time - global.note_move_time) note_creator("tap")
	if (timer== _current_long_time - global.note_move_time) note_creator("long")
	if (timer == _current_drag_time - global.note_move_time) note_creator("drag")
	if (timer == _current_any_time - global.note_move_time) note_creator("any")
})

