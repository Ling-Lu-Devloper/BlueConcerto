/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 
track1_x = 0
track2_x = 484
track3_x = 968
track4_x = 1452
deltatime = 0
timer = undefined
layer_id = layer_get_id("notes_layer")
tap_pool = new object_pool()
any_pool = new object_pool()
long_pool = new object_pool()
drag_pool = new object_pool()
tap_pool.poolInit(Tap,layer_id,10)
any_pool.poolInit(Any,layer_id,10)
long_pool.poolInit(Long,layer_id,10)
drag_pool.poolInit(Drag,layer_id,10)
start_time = 0
current_timer = 0
global._start_time = get_timer()
isFinish = false
deltatimer = 0
timer = time_source_create(time_source_game,0.0002,time_source_units_seconds,note_create_call_back,[],-1,time_source_expire_after)
time_source_start(timer)