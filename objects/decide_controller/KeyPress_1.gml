/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 
var key_time = ceil((get_timer() - global.inst_timer.start_time) / 1000)
show_debug_message(key_time)
if (keyboard_check(key1)){
	var struc ={"track": 1, "time": key_time}
	ds_queue_enqueue(key_store,struc)
	
}
if (keyboard_check(key2)){
	var struc ={"track": 2, "time": key_time}
	ds_queue_enqueue(key_store, struc)
	
}
if (keyboard_check(key3)){
	var struc ={"track": 3, "time": key_time}
	ds_queue_enqueue(key_store, struc)
	
}
if (keyboard_check(key4)){
	var struc ={"track": 4, "time": key_time}
	ds_queue_enqueue(key_store, struc)
	
}