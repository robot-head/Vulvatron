
color weighted_get(int xpos, int ypos, int radius) {
  int red, green, blue;
  int xoffset, yoffset;
  int pixels_counted;

  color thispixel;


  red = green = blue = pixels_counted = 0;

  for (xoffset=-radius; xoffset<radius; xoffset++) {
    for (yoffset=-radius; yoffset<radius; yoffset++) {

      pixels_counted ++;
      thispixel = get(xpos + xoffset, ypos + yoffset);
      red += red(thispixel);
      green += green(thispixel);
      blue += blue(thispixel);
    }
  }
  return color(red/pixels_counted, blue/pixels_counted, green/pixels_counted);
}


boolean first_scrape = true;
PVector[] locations;
PixelPusher pusher;
Strip strip;
void scrape() {
  // scrape for the strips
  loadPixels();
  try {
    if (testObserver.hasStrips) {
      registry.startPushing();
      List<PixelPusher> pushers = registry.getPushers(VULVATRON_GROUP);
      Map<Integer, PixelPusher> pusherNoMap = new HashMap<Integer, PixelPusher>();
      for (PixelPusher pusher : pushers) {
        pusherNoMap.put(pusher.getControllerOrdinal(), pusher);
      }
      for (Mapping.Arm arm : map.arms) {
        locations = arm.getPixelLocations(true);
        pusher = pusherNoMap.get(arm.top.pusherNumber);
        strip = pusher.getStrip(arm.top.stripNumber);
        for (int pixelNo = 0; pixelNo < locations.length; pixelNo++) {
          color c = weighted_get(int(locations[pixelNo].x), int(locations[pixelNo].y), 2);
          strip.setPixel(c, arm.top.startPixel + pixelNo);
        }
        locations = arm.getPixelLocations(false);
        pusher = pusherNoMap.get(arm.bottom.pusherNumber);
        strip = pusher.getStrip(arm.bottom.stripNumber);
        for (int pixelNo = 0; pixelNo < locations.length; pixelNo++) {
          color c = weighted_get(int(locations[pixelNo].x), int(locations[pixelNo].y), 2);
          strip.setPixel(c, arm.bottom.startPixel + pixelNo);
        }
      }
    }
  } 
  catch (Exception e) {
    print("Something bad happened!");
  }
  updatePixels();
}
