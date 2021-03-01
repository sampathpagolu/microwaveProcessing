//Import Guava
import com.google.common.annotations.*;
import com.google.common.base.*;
import com.google.common.base.internal.*;
import com.google.common.cache.*;
import com.google.common.collect.*;
import com.google.common.escape.*;
import com.google.common.eventbus.*;
import com.google.common.graph.*;
import com.google.common.hash.*;
import com.google.common.html.*;
import com.google.common.io.*;
import com.google.common.math.*;
import com.google.common.net.*;
import com.google.common.primitives.*;
import com.google.common.reflect.*;
import com.google.common.util.concurrent.*;
import com.google.common.xml.*;
import com.google.thirdparty.publicsuffix.*;

import guru.ttslib.*;
import controlP5.*;

import java.util.List;

ControlP5 cp5;
TTS tts;

int clicked_start = 0;
int clicked_go = 0;
int door_status = 0;
Knob myKnobB;
int knobValue = 0;
ListMultimap<Integer, Integer> time_ref = ArrayListMultimap.create();
List<Integer> time;
void settings() {
    size(1000, 500);
 }
 
 int[] nums = {0x7E, 0x30, 0x6D, 0x79, 0x33, 0x5B, 0x5F, 0x70, 0x7F, 0x7B};
 int index = 0;

void setup() {
   tts = new TTS();
   include_knob();
       
   power_slider();
    
 }

void draw() {
    println( "x: " + mouseX + " y: " + mouseY );
     //first screen
    door_status = door_func();
    while(clicked_start == 0)  {
        screen_1();
        break;
    }  
    // second screen
    while(clicked_start == 1 && clicked_go == 0 && door_status==0) {
        screen_2();
        break;
    }
    //third screen
    while(clicked_go == 1 && clicked_start == 1){
      screen_3();
      break;
    }
    
 }
   

 void reset_stroke(){
   noStroke();
   strokeWeight(1);
 }

  void screenSeparator(){
   stroke(133, 130, 130);
   strokeWeight(12);
   line(600, 70, 600, 410);
 }
 color getColor(int val, int shift, int red, int green, int blue) {
   int r = red;
   int g = green;
   int b = blue;
   int a = 40+255 * ((val >> shift) & 1);
   return color(r, g, b, a);
 }


 public void sevenSegment(int val, int x, int red, int green, int blue) {
   reset_stroke();
   pushMatrix();
   noStroke();
   noFill();
   
   // A
   fill(getColor(val, 6, red, green, blue));
   rect(640+x, 100, 22, 5, 10, 10, 0, 0);
   // B
   fill(getColor(val, 5, red, green, blue));
   rect(660+x, 110, 5, 22, 10, 10, 0, 0);
   // C
   fill(getColor(val, 4, red, green, blue));
   rect(662+x, 140, 5, 22, 10, 10, 0, 0);
   // D
   fill(getColor(val, 3, red, green, blue));
   rect(640+x, 165, 22, 5, 10, 10, 0, 0);
   // E
   fill(getColor(val, 2, red, green, blue));
   rect(632+x, 140, 5, 22, 10, 10, 0, 0);
   // F
   fill(getColor(val, 1, red, green, blue));
   rect(630+x, 110, 5, 22, 10, 10, 0, 0);
   // 
   fill(getColor(val, 0, red, green, blue));
   rect(640+x, 135, 22, 5, 10, 10, 0, 0);

   popMatrix();
 }
void reset(){
  clicked_go = 0;
  clicked_start = 0;
}
int door_func(){
  fill(255);
  rect(580, 230, 25, 55);
  if (mouseX >= 860 && mouseX <= 860+25 && 
     mouseY >=200  && mouseY <= 200+55 && mousePressed) {
      fill(84, 220, 47);
      rect(860, 200,25, 55);
   return 1;
 } else {
   return 0;
 }
 
}
 
 
