event_user(EVENT_TICK) //call the tick event (used in the buffer player)

/*This is the calculation of the closeness of the currently played sample,
to the current beat. It goes from 0 to 0.9... where 0 is being on beat. This adjusted
by the offset*/
synchronicity = frac((last_sample - global.beat_offset_in_samples) / samples_per_beat);

/*Reset beat if it was set in the step before (and therefore the step was on beat)
and count up the beat_count*/
if (beat) {beat = -1; beat_count ++};

/*Reset offbeat if it was set in the step before (and therefore the step was offbeat)
and count up the offbeat_count*/
if (offbeat) {offbeat = -1; offbeat_count ++};

/*If the synchonicity is below 0.5 (if it flipped from 0.9... to 0) and beat_flip ISNT 1
set the beat_flip and beat to 1. The beat_flip STAYS 1 until the offbeat is reached*/
if not (beat_flip) && (synchronicity < 0.5) {beat_flip = 1; beat = 1};

/*If the synchonicity is above or equal to 0.5 (if it flipped from 0.49... to 0.5) and beat_flip IS 1
set the beat_flip to - 1 and offbeat to 1. The beat_flip STAYS -1 until the beat is reached again*/
if (beat_flip) && (synchronicity >= 0.5) {beat_flip = -1; offbeat = 1};

/*Restart the room if the end of the audio file is reached. Since the current_sample is 0 at the start
of the audio playing and will be 0 when the audio has ended, i check for a beat_count of 1 to prevent the
restarting to happen in the beginning */
if (beat_count > 1) and (last_sample == 0) room_restart();