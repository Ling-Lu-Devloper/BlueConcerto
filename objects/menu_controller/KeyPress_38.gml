/// @description 向上滚动减少选择
selected_line--
if(selected_line < 1){
	selected_column--
	if(selected_column < 1){
		selected_column = (bitmap_count div index_per_column) + 1
		selected_line = (bitmap_count % index_per_column)
	}else selected_line = index_per_column
}