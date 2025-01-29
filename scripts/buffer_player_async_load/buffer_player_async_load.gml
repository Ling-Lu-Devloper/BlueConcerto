function buffer_player_async_load() {
	if (async_load[? "queue_id"] == audio) {
		// which buffer was just played?
		var buff = async_load[? "buffer_id"];
	
		// check which sample that was
		if (ds_map_exists(buffer_map, buff)) {
			last_sample = buffer_map[? buff]; // this is used by audio seek control
		}
	}

	//if the tick is behind, restart the current audio
	if not audio_is_playing(audio) current_audio = audio_play_sound(audio, 0, 0)


}
