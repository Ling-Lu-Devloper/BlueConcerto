var dtime = global.inst_timer.delta_timer - (starttime * 1000)
y = dtime  * notespeed_per_msec / 1000
if (y > 3500){
	inst_game_controller.drag_pool.poolPush(self)
}