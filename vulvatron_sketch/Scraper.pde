
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
  return color(red/pixels_counted, green/pixels_counted, blue/pixels_counted);
}


boolean first_scrape = true;
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
        
        PixelPusher pusher = pusherNoMap.get(sMap.pusherNumber);
        
      }
    }
  } 
  catch (Exception e) {
    print("Something bad happened!");
  }
  updatePixels();
}
