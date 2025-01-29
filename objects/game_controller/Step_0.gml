if(!track_1_empty){
	track1time = track1[0].time
	if (struct_exists(track1[0],"endtime")) track1duration = track1[0].endtime - track1time
}
if(!track_2_empty){
	track2time = track2[0].time
	if (struct_exists(track2[0],"endtime"))	track2duration = track2[0].endtime - track2time
}
if (global.inst_timer.delta_timer >= track1time * 1000 && !track_1_empty){
	var _note
	switch(track1[0].type){
		
		case "Tap":
			_note = tap_pool.poolPop()
			_note.x = track1_x
			_note.starttime = track1time
			array_delete(track1,0,1)
			break
		case "Drag":
			_note = drag_pool.poolPop()
			_note.x = track1_x
			_note.starttime = track1time
			array_delete(track1,0,1)
			break
		case "Long":
			_note = long_pool.poolPop()
			_note.x = track1_x
			_note.starttime = track1time
			_note.duration = track1duration
			array_delete(track1,0,1)
			break
		case "Any":
			_note = any_pool.poolPop()
			_note.x = track1_x
			_note.starttime = track1time
			_note.duration = track1duration
			array_delete(track1,0,1)
			break
	}
	if (array_length(track1) == 0 && !track_1_empty){
	track_1_empty = true
	}
}

if (global.inst_timer.delta_timer >= track2time * 1000 && !track_2_empty){
	var _note
	switch(track2[0].type){
		
		case "Tap":
			_note = tap_pool.poolPop()
			_note.x = track2_x
			_note.starttime = track2time
			array_delete(track2,0,1)
			break
		case "Drag":
			_note = drag_pool.poolPop()
			_note.x = track2_x
			_note.starttime = track2time
			array_delete(track2,0,1)
			break
		case "Long":
			_note = long_pool.poolPop()
			_note.x = track2_x
			_note.starttime = track2time
			_note.duration = track2duration
			array_delete(track2,0,1)
			break
		case "Any":
			_note = any_pool.poolPop()
			_note.x = track2_x
			_note.starttime = track2time
			_note.duration = track2duration
			array_delete(track2,0,1)
			break
	}
	if (array_length(track2) == 0 && !track_2_empty){
	track_2_empty = true
	}
}
if(!track_3_empty){
	track3time = track3[0].time
	if (struct_exists(track3[0],"endtime")) track3duration = track3[0].endtime - track3time
}
if(!track_4_empty){
	track4time = track4[0].time
	if (struct_exists(track4[0],"endtime"))	track4duration = track4[0].endtime - track4time
}

if (global.inst_timer.delta_timer >= track3time * 1000 && !track_3_empty){
	var _note
	switch(track3[0].type){
		
		case "Tap":
			_note = tap_pool.poolPop()
			_note.x = track3_x
			_note.starttime = track3time
			array_delete(track3,0,1)
			break
		case "Drag":
			_note = drag_pool.poolPop()
			_note.x = track3_x
			_note.starttime = track3time
			array_delete(track3,0,1)
			break
		case "Long":
			_note = long_pool.poolPop()
			_note.x = track3_x
			_note.starttime = track3time
			_note.duration = track3duration
			array_delete(track3,0,1)
			break
		case "Any":
			_note = any_pool.poolPop()
			_note.x = track3_x
			_note.starttime = track3time
			_note.duration = track3duration
			array_delete(track3,0,1)
			break
	}
	if (array_length(track3) == 0 && !track_3_empty){
	track_3_empty = true
	}
}

if (global.inst_timer.delta_timer >= track4time * 1000 && !track_4_empty){
	var _note
	switch(track4[0].type){
		
		case "Tap":
			_note = tap_pool.poolPop()
			
			_note.starttime = track4time
			array_delete(track4,0,1)
			break
		case "Drag":
			_note = drag_pool.poolPop()
			_note.x = track4_x
			_note.starttime = track4time
			array_delete(track4,0,1)
			break
		case "Long":
			_note = long_pool.poolPop()
			_note.x = track4_x
			_note.starttime = track4time
			_note.duration = track4duration
			array_delete(track4,0,1)
			break
		case "Any":
			_note = any_pool.poolPop()
			_note.x = track4_x
			_note.starttime = track4time
			_note.duration = track4duration
			array_delete(track4,0,1)
			break
	}
	if (array_length(track4) == 0 && !track_4_empty){
	track_4_empty = true
	}
}
	







































/*之前的破代码

#region 各种赋值

if (!track_1_empty && array_length(track1) > 0 && !struct_exists(track1[0],"endtime")){
	track1time = track1[0].time
}else if (!track_1_empty && array_length(track1) > 0 && !struct_exists(track1[0],"endtime")){
	track1time =track1[0].time
	track1endtime = track1[0].endtime
}else track_1_empty = true

if (!track_2_empty && array_length(track2) > 0 && !struct_exists(track2[0],"endtime")){
	track2time = track2[0].time
}else if (!track_2_empty && array_length(track2) > 0 && !struct_exists(track2[0],"endtime")){
	track2time =track2[0].time
	track2endtime = track2[0].endtime
}else track_2_empty = true

if (!track_3_empty && array_length(track3) > 0 && !struct_exists(track3[0],"endtime")){
	track3time = track3[0].time
}else if (!track_3_empty && array_length(track3) > 0 && !struct_exists(track3[0],"endtime")){
	track3time =track3[0].time
	track3endtime = track3[0].endtime
}else track_3_empty = true

if (!track_4_empty && array_length(track4) > 0 && !struct_exists(track4[0],"endtime")){
	track4time = track4[0].time
}else if (!track_4_empty && array_length(track4) > 0 && !struct_exists(track4[0],"endtime")){
	track4time =track4[0].time
	track4endtime = track4[0].endtime
}else track_4_empty = true
#endregion

#region 轨道处理

#region 轨道1处理
if (track1time - 500 - note_move_time <= global.inst_timer.current_timer && global.inst_timer.current_timer <= track1time + 500 - note_move_time && !track_1_empty){
	var _note = note_creator(track1)
	_note.x = track1_x
	if (track1[0].type == "Long" || track1[0].type == "Any"){
		_note.duration = track1endtime - track1time
	}
}
#endregion

#region 轨道2处理
if (track2time - 500 - note_move_time <= global.inst_timer.current_timer && global.inst_timer.current_timer <= track2time + 500 - note_move_time && !track_2_empty){
	var _note = note_creator(track2)
	_note.x = track2_x
	if (track2[0].type == "Long" || track2[0].type == "Any"){
		_note.duration = track2endtime - track2time
	}
}
#endregion

#region 轨道3处理
if (track3time - 500 - note_move_time <= global.inst_timer.current_timer && global.inst_timer.current_timer <= track3time + 500 - note_move_time && !track_3_empty){
	var _note = note_creator(track3)
	_note.x = track3_x
	if (track3[0].type == "Long" || track3[0].type == "Any"){
		_note.duration = track3endtime - track3time
	}
}
#endregion

#region 轨道4处理
if (track4time - 500 - note_move_time <= global.inst_timer.current_timer && global.inst_timer.current_timer <= track4time + 500 - note_move_time && !track_4_empty){
	var _note = note_creator(track4)
	_note.x = track4_x
	if (track4[0].type == "Long" || track4[0].type == "Any"){
		_note.duration = track4endtime - track4time
	}
}
#endregion

#endregion
*/