// v2.3.0的脚本资产已更改，请参见\ n // https://help.yoyogames.com/hc/en-us/articles/360005277377
/// @desc determine whether the type of file exists
/// @param {string} folder
/// @param {string} type
function fileTypeExists(folder, type){
	
	var exi = file_find_first(folder + "/" + type, 0)
	if (exi != "." && exi != ".." && exi != ""){
		
		file_find_close()
		return true
		
	}else return false
	
}


/// @desc  查找特定根目录及其子目录下特定文件
/// @param file_directory 文件根目录
/// @param file_pattern 文件后缀名（例如：".txt"）
/// @param only_filename_result_opt 输出选项 1-全路径 2-文件名（无后缀）3-文件名（带后缀)
function file_search_in_folder(file_directory, file_pattern, only_filename_result_opt){
	
	/// 初始化
	var file_name = file_find_first(file_directory + "/*", 0)
	
	/// 初始化结果数组
	var result = array_create(1) // 数组第一个元素用于存储文件数量
	result[0] = 0
	
	while (file_name != ""){
		/// 检查是否为当前目录或上级目录
		if (file_name != "." && file_name != ".."){
			
			/// 设置完整路径
			var full_path = file_directory + "/" + file_name
			if (string_ends_with(file_name, file_pattern)){
				
				/// 如果是目标文件，则根据选项处理文件名
				result[0]++
				
				switch(only_filename_result_opt){
					case 1:
						array_push(result, full_path)
					case 2:
						array_push(result, string_before(filename_name(file_name), "."))
					case 3:
						array_push(result, file_name)
				}
			}
		}
		
		/// 查找下一个文件
		file_name = file_find_next();
		
	}
	
	/// 关闭文件查找
	file_find_close();	
	
	return result;
}

/**
	* 查找当前根目录中的目录
	* @param {string} root_folder 根目录
	* @returns {array<string>} 包含名称的数组
	*/
function folder_search(root_folder){
	var folder_name = file_find_first(root_folder + "/*",fa_directory)
	var folder= array_create(0)
	while(folder_name != ""){
		if(folder_name!="." && folder_name != ".."){
			array_push(folder, root_folder + "/" + folder_name)
		}
		folder_name = file_find_next()
	}
	file_find_close()
	return folder
}


/// @desc bctbm metadata reader, failed-undefinde, object-struct, array-array
/// @param {string} bitmap_path path to the bitmap folder
/// @param {real} mode 0 for metadata 1 for note
function read_bctbm(bitmap_path,mode){
	var data
	var bitmap = file_text_open_read(bitmap_path)
	if (bitmap == -1) {
	    show_debug_message("Failed to open file: " + bitmap_path)
	    return undefined;
	}

	var json_string = ""
    
	while (!file_text_eof(bitmap)) {
	    json_string += file_text_readln(bitmap)
	}
    
	file_text_close(bitmap)

	// 解析 JSON 字符串
	var parsed_data = json_parse(json_string)
    
	if (parsed_data == undefined || !is_struct(parsed_data)) {
	    show_debug_message("Failed to parse JSON from file: " + bitmap_path)
	    return undefined
	}
	if (mode == 0){
	// 检查是否存在 "metadata" 键
		if (!struct_exists(parsed_data, "metadata")) {
		    show_debug_message("No 'metadata' section found in the JSON.");
		    return undefined;
		}

		// 获取 "metadata" 部分
		data = struct_get(parsed_data, "metadata")
	}else if(mode == 1){
		
		if (!struct_exists(parsed_data, "notes")){
			show_debug_message("No 'note' section found in the JSON")
			return undefined
		}
		
		data = parsed_data.notes
		
	}
	return data
}
