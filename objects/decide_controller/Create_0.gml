/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 
global.key1_4k = "D"
global.key2_4k = "F"
global.key3_4k = "J"
global.key4_4k = "K"
key1=ord(global.key1_4k)
key2=ord(global.key2_4k)
key3=ord(global.key3_4k)
key4=ord(global.key4_4k)
track1_note = variable_clone(global.note_arr1)
track2_note = variable_clone(global.note_arr2)
track3_note = variable_clone(global.note_arr3)
track4_note = variable_clone(global.note_arr4)
key_store = ds_queue_create()
goal = 0