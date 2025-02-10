/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 
var d1time //用于计算差值
var d2time
var d3time
var d4time
if (!ds_queue_empty(key_store)){
	var keypress = ds_queue_dequeue(key_store) //按键信息出队列进行比对
	switch (keypress.track){ //分轨比对
	case 1:
		if (array_length(track1_note) != 0){
			d1time = keypress.time - track1_note[0].time
			show_debug_message("time:" + string(track1_note[0].time))
			show_debug_message("dtime:" + string(d1time))
			if (!abs(d1time) > 200){
				goal += decider(d1time,65,85,105,200)
				array_delete(track1_note,0,1)
			}
		}
		break
	case 2:
		if (array_length(track2_note) != 0){
			d2time = keypress.time - track2_note[0].time
			show_debug_message("dtime:" + string(d2time))
			if (!abs(d2time) > 200){
				goal += decider(d2time,65,85,105,200)
				array_delete(track2_note,0,1)
			}
		}
		break
	case 3:
		if (array_length(track3_note) != 0){
			d3time = keypress.time - track3_note[0].time
			show_debug_message("dtime:" + string(d3time))
			if (!abs(d3time) > 200){
				goal += decider(d3time,65,85,105,200)
				array_delete(track3_note,0,1)
			}
		}
		break
	case 4:
		if (array_length(track4_note) != 0){
			d4time = keypress.time - track4_note[0].time
			show_debug_message("time:" + string(track4_note[0].time))
			show_debug_message("dtime:" + string(d4time))
			if (!abs(d4time) > 200){
				goal += decider(d4time,65,85,105,200)
				array_delete(track4_note,0,1)
			}
		}
		break
	}
}