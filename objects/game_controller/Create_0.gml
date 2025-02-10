/// @description 在此处插入描述 

note_move_time = variable_global_get("note_move_time")
layer_id = layer_get_id("notes_and_decider")
tap_pool = new object_pool()
drag_pool = new object_pool()
long_pool = new object_pool()
any_pool = new object_pool()
tap_pool.poolInit(Tap,layer_id,30)
drag_pool.poolInit(Drag,layer_id,30)
long_pool.poolInit(Long,layer_id,30)
any_pool.poolInit(Any,layer_id,30)
show_debug_message("pool Inited")
isFinish = false
global.inst_timer = instance_create_layer(0,0,"layer_timer",timer)
audio_play_sound(global.track_music,0,false)
track1_x = 0
track2_x = 484
track_1_empty = false
track_2_empty = false
track1duration = 0
track2duration = 0
track1 = variable_global_get("note_arr1")
track2 = variable_global_get("note_arr2")
track1time = track1[0].time
track2time = track2[0].time
track3_x = 968
track4_x = 1452
track_3_empty = false
track_4_empty = false
track3duration = 0
track4duration = 0
track3 = variable_global_get("note_arr3")
track4 = variable_global_get("note_arr4")
track3time = track3[0].time
track4time = track4[0].time
