/// @function decider(dtime, decideval1,decideval2, decideval3, decideval4)
/// @desc 进行判定选择，将判定结果传给指示器
/// @param {real} dtime 与基准的相对差值
/// @param {real} decideval1 perf
/// @param {real} decideval2 great
/// @param {real} decideval3 good
/// @param {real} decideval4 miss
/// @return {real} 得分
function decider(dtime,decideval1,decideval2,decideval3,decideval4){
	show_debug_message("dtime:" + string(dtime));
	if (abs(dtime) <= decideval1){
		instance_activate_object(inst_decide_shower);
		inst_decide_shower.decide_value = 1;
		return 1000;
	}else if(abs(dtime) > decideval1 && abs(dtime) <= decideval2){
		instance_activate_object(inst_decide_shower);
		inst_decide_shower.decide_value = 2;
		return 500;
	}else if(abs(dtime) > decideval2 && abs(dtime) <= decideval3){
		instance_activate_object(inst_decide_shower);
		inst_decide_shower.decide_value = 3;
		return 250;
	}else if(abs(dtime) > decideval3 && abs(dtime) <= decideval4){
		instance_activate_object(inst_decide_shower);
		inst_decide_shower.decide_value = 4;
		return 0;
	}else{
		return 0;
	}
}

function hold_decider(){}