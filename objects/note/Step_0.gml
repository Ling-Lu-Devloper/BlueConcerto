event_perform(ev_create,0);
var dtime = global.inst_timer.delta_timer - (starttime * 1000);
y = dtime  * notespeed_per_msec / 1000;
if (y > 3500){
	inst_game_controller.tap_pool.poolPush(self);
	switch(track){
		case 1:
			array_delete(inst_decide_controller.track1_note,0,1);
			break;
		case 2:
			array_delete(inst_decide_controller.track2_note,0,1);
			break;
		case 3:
			array_delete(inst_decide_controller.track3_note,0,1);
			break;
		case 4:
			array_delete(inst_decide_controller.track4_note,0,1);
			break;
		
	}
}
