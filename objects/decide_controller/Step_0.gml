/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 
var dtime; //用于计算差值
if (!ds_queue_empty(key_store)){
	var keypress = ds_queue_dequeue(key_store); //按键信息出队列进行比对
	switch (keypress.track){ //分轨比对
	case 1:
		if (array_length(track1_note) != 0){
			dtime = keypress.time - track1_note[0].time;
			show_debug_message("time:" + string(track1_note[0].time));
			show_debug_message("tracknote:" + string(track1_note));
			if (abs(dtime) <= 200){
				score += decider(dtime,65,85,130,200);
				array_delete(track1_note,0,1);
			}
		}
		break
	case 2:
		if (array_length(track2_note) != 0){
			dtime = keypress.time - track2_note[0].time;
			show_debug_message("tracknote:" + string(track2_note));
			if (abs(dtime) <= 200){
				score += decider(dtime,65,85,130,200);
	
				array_delete(track2_note,0,1);
			}
		}
		break
	case 3:
		if (array_length(track3_note) != 0){
			dtime = keypress.time - track3_note[0].time
			show_debug_message("tracknote:" + string(track3_note))
			if (abs(dtime) <= 200){
				score += decider(dtime,65,85,130,200)

				array_delete(track3_note,0,1)
			}
		}
		break
	case 4:
		if (array_length(track4_note) != 0){
			dtime = keypress.time - track4_note[0].time
			show_debug_message("time:" + string(track4_note[0].time))
			show_debug_message("tracknote:" + string(track4_note))
			if (abs(dtime) <= 200){
				score += decider(dtime,65,85,130,200)

				array_delete(track4_note,0,1)
			}
		}
		break
	}
}