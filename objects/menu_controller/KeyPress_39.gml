selected_column++
if ((selected_column > (bitmap_count div index_per_column) + 1 && selected_line <= bitmap_count % index_per_column) || (selected_column > bitmap_count div index_per_column && selected_line > bitmap_count % index_per_column)) {
    selected_column = 1
    selected_line++
}
 if (selected_line > index_per_column) {
        selected_line = 1
    }