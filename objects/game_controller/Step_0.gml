if (global.inst_timer.delta_timer >= (track1time - note_move_time) * 1000 && !track_1_empty){
	track1time = track1[0].time
	if (struct_exists(track1[0],"endtime")) track1duration = track1[0].endtime - track1time
	var _note
	switch(track1[0].type){
		
		case "Tap":
			_note = tap_pool.poolPop()
			_note.x = track1_x
			_note._track = 1
			_note.starttime = track1time
			array_delete(track1,0,1)
			break
		case "Drag":
			_note = drag_pool.poolPop()
			_note.x = track1_x
			_note._track = 1
			_note.starttime = track1time
			array_delete(track1,0,1)
			break
		case "Long":
			_note = long_pool.poolPop()
			_note.x = track1_x
			_note._track = 1
			_note.starttime = track1time
			_note.duration = track1duration
			array_delete(track1,0,1)
			break
		case "Any":
			_note = any_pool.poolPop()
			_note.x = track1_x
			_note._track = 1
			_note.starttime = track1time
			_note.duration = track1duration
			array_delete(track1,0,1)
			break
	}

}

if (global.inst_timer.delta_timer >= (track2time - note_move_time) * 1000 && !track_2_empty){
	track2time = track2[0].time
	if (struct_exists(track2[0],"endtime"))	track2duration = track2[0].endtime - track2time
	var _note
	switch(track2[0].type){
		
		case "Tap":
			_note = tap_pool.poolPop()
			_note.x = track2_x
			_note._track = 2
			_note.starttime = track2time
			array_delete(track2,0,1)
			break
		case "Drag":
			_note = drag_pool.poolPop()
			_note.x = track2_x
			_note._track = 2
			_note.starttime = track2time
			array_delete(track2,0,1)
			break
		case "Long":
			_note = long_pool.poolPop()
			_note.x = track2_x
			_note._track = 2
			_note.starttime = track2time
			_note.duration = track2duration
			array_delete(track2,0,1)
			break
		case "Any":
			_note = any_pool.poolPop()
			_note.x = track2_x
			_note._track = 2
			_note.starttime = track2time
			_note.duration = track2duration
			array_delete(track2,0,1)
			break
	}
	
}
if (array_length(track2) == 0 && !track_2_empty){
	track_2_empty = true
}
if (array_length(track1) == 0 && !track_1_empty){
	track_1_empty = true
}

if (global.inst_timer.delta_timer >= (track3time - note_move_time) * 1000 && !track_3_empty){
	track3time = track3[0].time
	if (struct_exists(track3[0],"endtime")) track3duration = track3[0].endtime - track3time
	var _note
	switch(track3[0].type){
		
		case "Tap":
			_note = tap_pool.poolPop()
			_note.x = track3_x
			_note._track = 3
			_note.starttime = track3time
			array_delete(track3,0,1)
			break
		case "Drag":
			_note = drag_pool.poolPop()
			_note.x = track3_x
			_note._track = 3
			_note.starttime = track3time
			array_delete(track3,0,1)
			break
		case "Long":
			_note = long_pool.poolPop()
			_note.x = track3_x
			_note._track = 3
			_note.starttime = track3time
			_note.duration = track3duration
			array_delete(track3,0,1)
			break
		case "Any":
			_note = any_pool.poolPop()
			_note.x = track3_x
			_note._track = 3
			_note.starttime = track3time
			_note.duration = track3duration
			array_delete(track3,0,1)
			break
	}

}

if (global.inst_timer.delta_timer >= (track4time - note_move_time) * 1000 && !track_4_empty){
	track4time = track4[0].time
	if (struct_exists(track4[0],"endtime"))	track4duration = track4[0].endtime - track4time
	var _note
	switch(track4[0].type){
		
		case "Tap":
			_note = tap_pool.poolPop()
			_note.x = track4_x
			_note._track = 4
			_note.starttime = track4time
			array_delete(track4,0,1)
			break
		case "Drag":
			_note = drag_pool.poolPop()
			_note.x = track4_x
			_note._track = 4
			_note.starttime = track4time
			array_delete(track4,0,1)
			break
		case "Long":
			_note = long_pool.poolPop()
			_note.x = track4_x
			_note._track = 4
			_note.starttime = track4time
			_note.duration = track4duration
			array_delete(track4,0,1)
			break
		case "Any":
			_note = any_pool.poolPop()
			_note.x = track4_x
			_note._track = 4
			_note.starttime = track4time
			_note.duration = track4duration
			array_delete(track4,0,1)
			break
	}

}
if (array_length(track3) == 0 && !track_3_empty){
	track_3_empty = true
}
if (array_length(track4) == 0 && !track_4_empty){
	track_4_empty = true
}
	