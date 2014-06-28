int VULVA_SUPPORT_ARMS = 6;
int VULVATRON_GROUP = 1001;

class Mapping {

  class StripLocation {
    final int pusherNumber;
    final int groupNumber;
    final int stripNumber;
    final int startPixel;
    final int endPixel;

    StripLocation(int pusherNumber, int groupNumber, int stripNumber, int startPixel, int endPixel) {
      this.pusherNumber = pusherNumber;
      this.groupNumber = groupNumber;
      this.stripNumber = stripNumber;
      this.startPixel = startPixel;
      this.endPixel = endPixel;
    }
    int totalPixels() {
      return endPixel - startPixel;
    }
  }


  class Arm {

    final int arm;
    final StripLocation top;
    final StripLocation bottom;
    final int totalPixels;

    Arm(int arm, StripLocation top, StripLocation bottom) {
      this.arm = arm;
      this.top = top;
      this.bottom = bottom;
      this.totalPixels = top.totalPixels() + bottom.totalPixels();
    }

    PVector[] getPixelLocations(boolean topStrip) {
      StripLocation loc = bottom;
      if (topStrip) {
        loc = top;
      }
      float y;
      PVector[] locs = new PVector[loc.totalPixels()];
      for (int pixelNo = 0; pixelNo < loc.totalPixels(); pixelNo++) {        
        if (topStrip) {
          y = (height / totalPixels) * pixelNo;
        } else {
          y = height - ((height / totalPixels) * pixelNo);
        }
        locs[pixelNo] = new PVector(getX(), y);
      }

      return locs;
    }

    float getX() {
      return (width / VULVA_SUPPORT_ARMS) * arm;
    }
  }
  // StripLocation(int pusherNumber, int groupNumber, int stripNumber, int startPixel, int endPixel) {
  Arm[] arms = {
    new Arm(1, new StripLocation(1, VULVATRON_GROUP, 6, 1, 240), new StripLocation(2, VULVATRON_GROUP, 5, 1, 40)), 
    new Arm(2, new StripLocation(1, VULVATRON_GROUP, 5, 1, 240), new StripLocation(2, VULVATRON_GROUP, 4, 1, 90)), 
    new Arm(3, new StripLocation(1, VULVATRON_GROUP, 4, 1, 240), new StripLocation(2, VULVATRON_GROUP, 3, 1, 62)), 
    new Arm(4, new StripLocation(1, VULVATRON_GROUP, 3, 1, 240), new StripLocation(2, VULVATRON_GROUP, 2, 1, 70)), 
    new Arm(5, new StripLocation(1, VULVATRON_GROUP, 2, 1, 240), new StripLocation(2, VULVATRON_GROUP, 1, 1, 94)), 
    new Arm(6, new StripLocation(1, VULVATRON_GROUP, 1, 1, 240), new StripLocation(2, VULVATRON_GROUP, 6, 1, 40))
    };
  }
