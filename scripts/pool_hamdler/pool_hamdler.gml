//对象池
function object_pool() constructor{
	pool = [] //创建池
	_mode = 0
enum mode
{
	mode_NOTE	
}
	static poolInit = function(_object,_layer,_count,__mode){ //初始化池子，并投入一定数量的相应对象
		for (var i = 0;i < _count; i++){
			var inst = instance_create_layer(0,0,_layer,_object)
			instance_deactivate_object(inst)
			inst.active = true
			inst.pooled = true
			array_push(pool,inst)
		}
		_mode = __mode
		return pool  //丢出池子
	}
	
	static poolPush = function(inst){ //往池中放入对象并设置所有属性为初始
		if (inst.pooled) { //检测池中对象
            return;
        }
		inst.active = false
		if (_mode == mode.mode_NOTE){
			inst.x = 0
			inst.y = 0
			inst.speed = 0
			inst.direction = 0
			inst.duration = 0
			inst.starttime = -1
			inst.notespeed_per_msec = 0
			inst._track = 0
		}
		inst.pooled = true
		instance_deactivate_object(inst)
		show_debug_message(string(inst) + " has pushed")
		array_push(pool,inst)
	}
	
	static poolPop = function(){ //弹出对象并激活
		if (array_length(pool) == 0){
			show_debug_message("对象池已空")
			return noone
		}
		var inst = array_pop(pool)
		instance_activate_object(inst)
		inst.active = true
		inst.pooled = false
		show_debug_message(string(inst) + " has popped")
		return inst
	}
	
	static poolPopExt = function(inst_x,inst_y){ //弹出对象并激活
		if (array_length(pool) == 0){
			show_debug_message("对象池已空")
			return noone
		}
		var inst = array_pop(pool)
		instance_activate_object(inst)
		inst.active = true
		inst.pooled = false
		inst.x = inst_x
		inst.y = inst_y
		show_debug_message(string(inst) + " has popped")
		return inst
	}
	
	/// @desc 该方法需要手动设置激活，一定要设置激活！不然回不了池！
	static deactivatePop = function(){
		if (array_length(pool) == 0){
			show_debug_message("对象池已空")
			return noone
		}
		var inst = array_pop(pool)
		inst.pooled = false
		return inst		
	}
	
	static getPool = function(){ //get池子
		return pool
	}
	
	/// @param {array} new_pool
	static setPool = function(new_pool){ //set池子，一般不用
		pool = new_pool
		
	}
}