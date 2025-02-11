/// @desc 绘制菜单
/// draw background
draw_clear(c_grey);

/// draw title
draw_set_font(Shangshou_Pobing_Title);
draw_set_color(#FFFFFF);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(room_width / 2, 0, "   选  择  谱  面   ");

/// draw bitmap counts
draw_set_font(WeiRuan_YaHei);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_text(room_width, room_height, " 共有 " + string(bitmap_count) + " 个谱面 ");

/// draw list of bitmaps
var index_choose_height = 150;
var index_choose_width = 25;
var column = 1;
var line = 1;
draw_set_font(WeiRuan_YaHei);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
for (var i = 0; i < bitmap_count; i++) {
    var chart = global.bitmap_metadata[i];
    var text = chart.title + " - " + chart.musician + " ( " + chart.level + " )";

    // 换列逻辑
    if (line > index_per_column) {
        index_choose_width += 300;
        index_choose_height = 150;
        column += 1;
        line = 1;
    }

    // 高亮选中项
    if (line == selected_line && column == selected_column) {
		
        draw_set_color(c_yellow);
		draw_sprite(bm_selected_1,1,index_choose_width,index_choose_height);
    } else {
		
        draw_set_color(c_white);
    }
	

	
    // 绘制文本
	
    draw_text(index_choose_width, index_choose_height, text);
    index_choose_height += 60;
    line++;
}

/// draw prompt
draw_set_font(Shangshou_Pobing_Title);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(room_width / 2, room_height, "按ESC退出，按ENTER开始");