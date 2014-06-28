import com.heroicrobot.dropbit.devices.pixelpusher.PixelPusher;
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
    canvas = client.getGraphics(canvas);
    image(canvas, 0, 0, width, height);
  }

  scrape();
}

void stop()
{
  super.stop();
}
