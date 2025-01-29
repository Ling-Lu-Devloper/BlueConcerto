//Show me some variables
var _list = ds_list_create()
	
ds_list_add(_list,
"Samplerate: ",
samplerate,
"Samples: ",
samples,
"Channels: ",
channels,
EMPTY,
"Last Sample: ",
last_sample,
"Samples per beat: ",
samples_per_beat,
EMPTY,
"Beat Offset in Samples: ",
global.beat_offset_in_samples,
EMPTY,
"Beat: ",
beat,
"Beatflip: ",
beat_flip,
"Beat Counter: ",
beat_count,
EMPTY,
"Offbeat: ",
offbeat,
"Offbeat Counter: ",
offbeat_count)
	
for(var _i = 0; _i < ds_list_size(_list); _i ++)
{
	var _entry = _list[| _i]
	draw_text(x, y + (20 * _i), string(_entry))
}
	
ds_list_destroy(_list)
