import com.heroicrobot.dropbit.devices.pixelpusher.PixelPusher; //<>//
import codeanticode.syphon.*;
import com.heroicrobot.dropbit.registry.*;
import com.heroicrobot.dropbit.devices.pixelpusher.Pixel;
import com.heroicrobot.dropbit.devices.pixelpusher.Strip;

import java.util.*;

DeviceRegistry registry;

SyphonClient client;
PGraphics canvas;

boolean ready_to_go = true;
int lastPosition;
int canvasW = 400;
int canvasH = 600;
TestObserver testObserver;
Mapping map = new Mapping();


void setup() {
  size(canvasW, canvasH, P3D);
  registry = new DeviceRegistry();
  testObserver = new TestObserver();
  registry.addObserver(testObserver);
  background(0);
  client = new SyphonClient(this, "Modul8", "Main View");
}

void draw() {

  if (client.available()) {
    background(0);
    canvas = client.getGraphics(canvas);
    image(canvas, 0, 0, width, height);
  }


  
//background(0);
//showMap();
scrape();
}

void stop()
{
  super.stop();
}

void showMap() {
  textSize(18);
  
  noStroke();
  for (Mapping.Arm arm : map.arms) { //<>//
    locations = arm.getPixelLocations(true);
    fill(#FFFFFF);
    text("" + arm.arm, locations[0].x, 20);
    
    for (int pixelNo = 0; pixelNo < locations.length; pixelNo++) {
      ellipse(locations[pixelNo].x, locations[pixelNo].y, 10, 10);      
    }
    fill(#FF0000);
    locations = arm.getPixelLocations(false);
    for (int pixelNo = 0; pixelNo < locations.length; pixelNo++) {
      ellipse(locations[pixelNo].x, locations[pixelNo].y, 10, 10);
    }
  }
}
