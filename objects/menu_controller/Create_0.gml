///@desc 各项初始化
global.selected_bitmap = 0;
selected_column = 1;
selected_line = 1;
index_per_column = 15;
// 查找指定文件夹路径下的所有子文件夹
bitmap_folder_path = folder_search("resources/bitmaps");

// 创建一个数组用于存储结果，第一个元素用于统计文件数量
global.bitmap_arr = array_create(0);
array_push(global.bitmap_arr, 0); // 初始化文件数量为 0

// 遍历 bitmap_folder_path 数组中的每一个文件夹路径
for (var i = 0; i < array_length(bitmap_folder_path); i++) {
	
	// 在当前文件夹中查找符合 "bctbm" 后缀的文件，返回结果数组
	bm_arr = file_search_in_folder(bitmap_folder_path[i], "bctbm", 1);

	// 获取当前文件夹中查找到的文件数量
	var bit_map_count = array_get(bm_arr, 0);

	// 将当前文件夹中的文件数量累加到总文件数量中
	global.bitmap_arr[0] += bit_map_count;

	// 将当前文件夹中查找到的文件名添加到结果数组中
	array_push(global.bitmap_arr, bm_arr[1]);

	// 显示当前的结果数组（用于调试）
}

// 获取最终的文件总数
bitmap_count = array_get(global.bitmap_arr, 0);
global.bitmap_metadata = array_create(0);
for (var i = 1; i < array_length(global.bitmap_arr); i++){
	array_push(global.bitmap_metadata,read_bctbm(global.bitmap_arr[i],0));
}
	

