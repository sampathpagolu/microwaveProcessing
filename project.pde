import guru.ttslib.*;
import controlP5.*;

ControlP5 cp5;
TTS tts;

int clicked_start = 0;
Knob myKnobB;

void settings() {
    size(1000, 500);
 }
 
 int[] nums = {0x7E, 0x30, 0x6D, 0x79, 0x33, 0x5B, 0x5F, 0x70, 0x7F, 0x7B};
 int index = 0;

void setup() {
    tts = new TTS();
   //include_knob();
   frameRate(1);
   power_slider();
    
 }

void draw() {
    
    // first screen
    while(clicked_start == 0) {
        screen_1();
        clicked_start = clicked_start_func(640, 280, 150, 70);
        break;
    }  
    // second screen
    while(clicked_start == 1) {
        //println("in second while");
        screen_2();
        break;
    }
    
 }
   
 

 
 
 // screen 1 displays time, date and start button
 void screen_1() {
    background(0);
    fill(255);
    reset_stroke();
    rect(100, 60, 720, 360);
    screenSeparator();
    today_time();
    today_date();
    fill(255);
    startButton();
    
    
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
 
 
 
