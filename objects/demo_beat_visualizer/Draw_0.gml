if (beat_controller.beat) merger = 1

if (merger > 0) merger -= 0.05

var _col = merge_color(color1, color2, merger)

draw_circle_color(x, y, 100, _col, _col, false)
