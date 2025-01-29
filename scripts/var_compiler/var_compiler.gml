/// @param {string} str 要进行处理的字符串
/// @param {string} delimiter 分隔符
function string_before(str, delimiter) {
    var pos = string_pos(delimiter, str)
    if (pos != 0) {
        return string_copy(str, 1, pos - 1)
    } else {
        return str // 如果找不到分隔符，则返回原字符串
    }
}
