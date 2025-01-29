//Switch between the two files included and restart the room
if (global.bpm == 120)
{
	global.song		= "test_beat_100.ogg"
	global.bpm		= 100
	room_restart()
}
else
{
	global.song		= "test_beat_120.ogg"
	global.bpm		= 120
	room_restart()
}
