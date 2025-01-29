/*/ 设置窗口比例为 16:9
var target_ratio = 16 / 9;
var current_width = window_get_width();
var current_height = window_get_height();
var current_ratio = current_width / current_height;

if (current_ratio > target_ratio) {
    // 如果窗口太宽，调整高度
    var new_height = current_width / target_ratio;
    window_set_size(current_width, new_height);
} else {
    // 如果窗口太高，调整宽度
    var new_width = current_height * target_ratio;
    window_set_size(new_width, current_height);
}