/// @description 初始化&加载到数组
loaded = false
note_speed = 8
bitmap_path = global.bitmap_arr[global.selected_bitmap]
selected_bitmap_metadata = global.bitmap_metadata[global.selected_bitmap - 1]
bitmap_folder = filename_path(bitmap_path)
// 在 Create 事件中初始化
var _music_path = bitmap_folder + selected_bitmap_metadata.musicFile

if(file_exists(_music_path)){
	global.track_music = audio_create_stream(_music_path)
}else global.track_music = -1

global.note_move_time = ceil((-0.28 * note_speed + 3.28) * 1000) //移动时间(ms)
show_debug_message(bitmap_path)
var note_data = read_bctbm(bitmap_path,1)
global.note_arr1 = []
global.note_arr2 = []
global.note_arr3 = []
global.note_arr4 = []

for(var i = 0; i < array_length(note_data); i++){
	show_debug_message(note_data[i])
	note_data[i].time = note_data[i].time * time_bpm_to_seconds(selected_bitmap_metadata.BPM) * 1000 + selected_bitmap_metadata.offset //到达时间（ms）
	if (struct_exists(note_data[i], "endtime")) note_data[i].endtime = note_data[i].endtime * time_bpm_to_seconds(selected_bitmap_metadata.BPM) * 1000 + selected_bitmap_metadata.offset //长音符结束时间（ms）
	if(note_data[i].type != "Tap" && note_data[i].type != "Long" && note_data[i].type != "Drag" && note_data[i].type != "Any"){
		show_debug_message("unknown note type at " + note_data[i])
	}else{
		show_debug_message(note_data[i])
		switch (note_data[i].track) { //音符数据分组
			case 1:
				array_push(global.note_arr1,note_data[i])
				break
			case 2:
				array_push(global.note_arr2,note_data[i])
				break
			case 3:
				array_push(global.note_arr3,note_data[i])
				break
			case 4:
				array_push(global.note_arr4,note_data[i])
				break
			default:
				show_message("Unknown note track at" + i + 1)
		}
		show_debug_message(global.note_arr1)
		show_debug_message(global.note_arr2)
		show_debug_message(global.note_arr3)
		show_debug_message(global.note_arr4)
		
	}
	
}
	

