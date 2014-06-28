package com.vulvatron.mapping;

public class Mapping {

	class StripMap {
		final int pusherNumber;
		final int groupNumber;
		final int stripNumber;
		final int lastPixelNumber;
		final boolean topDown;

		public StripMap(int pusherNumber, int groupNumber, int stripNumber, int lastPixelNumber,
				boolean topDown) {
			this.pusherNumber = pusherNumber;
			this.groupNumber = groupNumber;
			this.stripNumber = stripNumber;
			this.lastPixelNumber = lastPixelNumber;
			this.topDown = topDown;
		}

	}

	StripMap[] map = {
			new StripMap(1, 1, 1, 240, true),
			new StripMap(1, 1, 2, 240, true),
			new StripMap(1, 1, 3, 240, true),
			new StripMap(1, 1, 4, 240, true),
			new StripMap(1, 1, 5, 240, true),
			new StripMap(1, 1, 6, 240, true),
			new StripMap(2, 1, 1, 240, false),
			new StripMap(2, 1, 2, 240, false),
			new StripMap(2, 1, 3, 240, false),
			new StripMap(2, 1, 4, 240, false),
			new StripMap(2, 1, 5, 240, false),
			new StripMap(2, 1, 6, 240, false),
			
	};

}
