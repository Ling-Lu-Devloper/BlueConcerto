if (y = 0){
	isCalibrated = false
}
if (!isCalibrated){
	var dtime = global.inst_timer.delta_timer - (starttime * 1000)
	y = dtime  * notespeed_per_msec / 1000
}
speed = delta_time  / 1000 * notespeed_per_msec
y += speed