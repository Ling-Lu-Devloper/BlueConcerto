/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 

if(term = 0){
	
	alpha = lerp(alpha,1,fade_speed);
	if (alpha == 1){
		term = 1;
	}else if(alpha == 0.6){
		fade_speed = 0.1;
	}
}else if (term = 1){
	if (alpha == 0.6) fade_speed = 0.05;;
	alpha = lerp(alpha,0,fade_speed);
	
	if (alpha == 0){
		text = "Press Enter";
		term = 2;
		alpha = 0.3;
	}
}else if(term == 2){
	alpha = lerp(alpha,1,0.05);
}
