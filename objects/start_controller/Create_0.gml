switch(os_type){
	
	case os_android:
		break;
	case os_windows: 
		game_window_initialize();
		instance_create_depth(0,0,100,window_controller);
		break;
	case os_gdk:
		break;
	case os_gxgames:
		break;
	case os_ios:
		break;
	case os_linux: game_window_initialize();
		break;
	case os_macosx: game_window_initialize();
		break;
	default:
   
}
alpha = 0;
fade_speed = 0.05;
term = 0;
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_font(Shangshou_Pobing_Title);
text = "";
