/* Beat Controller
by Valerie Grindinger
created 01/20/20
Version 1.0

This object is a beat controller which will deliver a beat variable that is 1 when a game step is on beat.
This can be used in various cases to control elements of your game to the beat of the music. Caveat here is the
exact BPM of the music track is needed, and the music has to have a constant tempo (no tempo variations).
This doesn't analyze the music but uses fixed BPM to step ratios. It only works with included files instead of
Game Maker internal sounds. Any ogg file can be included. Thanks goes to Meseta who made the wonderful Audio
Visualization asset which i used for the sound buffer player. Using this, instead of the built in audio player
has the advantage of being independent of delta timings and there can be done more stuff with FFT visualization
if needed. See his asset for more info: https://marketplace.yoyogames.com/assets/6950/audio-visualizer*/

//Makros
#macro EVENT_TICK 0
#macro EMPTY ""
#macro SEC_PER_MIN 60

//Initialize some runtime variables
synchronicity	= 0; //used in the step event to calculate closeness of the currently played sample to the current beat
beat			= 0; //the beat variable, is 1 if the current step is on beat, otherwise its 0
beat_flip		= 0; //flips from -1 to 1 between beat and offbeat
beat_count		= 0; //counts the beats
offbeat			= 0; //the offbeat variable, is 1 if the current step is exactly between beats, otherwise its 0
offbeat_count	= 0; //counts the offbeats
last_sample		= 0; //the last sample thats being played, more or less the current song position

beat_offset_in_samples = global.beat_offset_in_samples; /*Since music files normally dont start exactly on beat,
there is a beat offset in samples so we can adjust for any offsets. This value can be
adjusted during runtime if needed. Please note, that it will never be absolutely perfect
since this depends on the games fps and the beat to step ratio (which might be a very
crooked number). Higher FPS will naturally lead to better results. Usually 60 FPS will
return decent enough closeness for the untrained ear though esp. if its a normal song
and not just clean beats. Due to the implementation we always have a bit of a standard
offset*/

buffer_player_initialize(); /* This stuff is from Meseta's free audio visualization asset.
For more info on how it works, check out this marketplace asset:
https://marketplace.yoyogames.com/assets/6950/audio-visualizer */

samples_per_beat = (SEC_PER_MIN / global.bpm) * samplerate; //calculates the amount samples per beat, based on the samplerate provided by the buffer player

//start playing the sound provided by the buffer player
audio_play_sound(audio, 0, 0);