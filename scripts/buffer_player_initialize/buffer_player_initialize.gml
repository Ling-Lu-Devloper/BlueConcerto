function buffer_player_initialize() {
	// create audio. At this point, ogg will be loaded into memory
	ogg = aviz_create(global.song);

	samplerate = aviz_get_samplerate(ogg);
	samples = aviz_get_samples(ogg);
	channels = aviz_get_channels(ogg);

	// calculate channelspec, we need this later
	switch (channels)
	{
		case 1: channelspec = audio_mono; break;
		case 2: channelspec = audio_stereo; break;
		case 6: channelspec = audio_3d; break;
		default:
			show_error("OGG with " + string(channels) + " not supported", false);
			instance_destroy();
	}

	// create the GM audio queue
	audio = audio_create_play_queue(buffer_s16, samplerate, channelspec);

	// calculate size of a "chunk" of audio per step
	tick_size = samplerate/room_speed;

	// calculate size of buffer needed to hold this "chunk"
	buff_size = tick_size * channels * 2;

	// we keep track of all buffers added to the audio queue.
	buffer_map = ds_map_create();

	// pre-fill audio queue with a few chunks, to prevent audio jittering
	repeat(50)
	{
		event_user(EVENT_TICK);
	}


}
