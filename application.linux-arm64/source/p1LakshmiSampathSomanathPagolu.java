import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

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

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class p1LakshmiSampathSomanathPagolu extends PApplet {

//Import Guava
























ControlP5 cp5;
TTS tts;

int clicked_start = 0;
int clicked_go = 0;
int door_status = 0;
Knob myKnobB;
int knobValue = 0;
ListMultimap<Integer, Integer> time_ref = ArrayListMultimap.create();
List<Integer> time;
public void settings() {
    size(1000, 500);
 }
 
 int[] nums = {0x7E, 0x30, 0x6D, 0x79, 0x33, 0x5B, 0x5F, 0x70, 0x7F, 0x7B};
 int index = 0;

public void setup() {
   tts = new TTS();
   include_knob();
       
   power_slider();
    
 }

public void draw() {
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
   

 public void reset_stroke(){
   noStroke();
   strokeWeight(1);
 }

  public void screenSeparator(){
   stroke(133, 130, 130);
   strokeWeight(12);
   line(600, 70, 600, 410);
 }
 public int getColor(int val, int shift, int red, int green, int blue) {
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
public void reset(){
  clicked_go = 0;
  clicked_start = 0;
}
public int door_func(){
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
 
 

  public void screen_1() {
    background(0);
    fill(255);
    reset_stroke();
    rect(100, 60, 720, 360);
    screenSeparator();
    today_time();
    today_date();
    fill(255);
    startButton();
    clicked_start = clicked_start_func(640, 280, 150, 70);
 }
 
 public void startButton(){
   stroke(84, 220, 47);
   strokeWeight(6);
   rect(640, 280, 150, 70, 10, 10, 10, 10);
   textSize(32);
   fill(84, 220, 47);
   text("START", 668, 328);
 }
 
public int clicked_start_func(int x, int y, int width_, int height_){
  if (mouseX >= x && mouseX <= x+width_ && 
     mouseY >= y && mouseY <= y+height_ && mousePressed) {
   tts.speak("clicked start");
   //clicked_go = 0;
   return 1;
 } else {
   return 0;
 }
}

public void display_seven_segment(int zero, int one, int two, int three, int red, int green, int blue, int start){
   sevenSegment(nums[zero], start, red, green, blue );
   sevenSegment(nums[one], start + 40, red, green, blue);
   sevenSegment(nums[two], start + 90, red, green, blue);
   sevenSegment(nums[three], start + 130, red, green, blue);
   
   fill(255,176,0);
   circle(713, 120, 8);
   circle(713, 155, 8);
}


 public void today_time(){
   int a = 0;
   int minute = minute();
   int hour = hour();
   int hours_10 = hour%10;
   int hours_1 = floor(hour/10);
   int minutes_10 = minute%10;
   int minutes_1 = floor(minute/10);
   int red = 255;
   int green = 0;
   int blue = 0;
   display_seven_segment(hours_1, hours_10, minutes_1, minutes_10, red, green, blue, a);

 }
  public void today_date(){
   int day = day();
   int month = month();
   int year = year();
   String date = month + "/" + day + "/" + year;
   stroke(0);
   textSize(16);
   fill(0);
   text(date, 668, 220);
}
 // screen 2 displays time set, option to set time, power level

 public void screen_2() {
   int[] reference = {0, 30, 1, 3, 5, 10, 301, 45, 60, 90 };
     String minutes_or_seconds = "Seconds";
     pause = false;
    //println("clicked");
    background(0);
    fill(255);
    reset_stroke();
    rect(100, 60, 720, 360);
    screenSeparator();
    fill(0);
    textSize(12);
    text("Click on the knob to set time ", 620, 190);
    text("powerlevel ", 620, 315);

    reset_stroke();
    stroke(1);
    fill(255);
    cp5.show();
    init_time_ref();
    int cook_time = reference[knobValue];
    time =  time_ref.get(cook_time);
    //println(time);
    timer_display(time);
    //start
    go();
    clicked_go = clicked_go_func(655, 370, 110, 30, cook_time);
    
 }
 /* screen 2 functions */

public void timer_display(List<Integer> time_now){
   int a = 0;
   int red = 38;
   int green = 148;
   int blue = 15;
  display_seven_segment(time_now.get(0),time_now.get(1),time_now.get(2),time_now.get(3), red, green, blue, a);
   
 }

public void init_time_ref(){
time_ref.put(0,0);
    time_ref.put(0,0);
    time_ref.put(0,0);
    time_ref.put(0,0);
    //30 seconds
    time_ref.put(30,0);
    time_ref.put(30,0);
    time_ref.put(30,3);
    time_ref.put(30,0);
    // 1 minute
    time_ref.put(1, 0);
    time_ref.put(1,1);
    time_ref.put(1,0);
    time_ref.put(1,0);
    //3 minutes
    time_ref.put(3, 0);
    time_ref.put(3,3);
    time_ref.put(3,0);
    time_ref.put(3,0);
    // 5 minutes
    time_ref.put(5,0);
    time_ref.put(5,5);
    time_ref.put(5,0);
    time_ref.put(5,0);
    // 10 minutes
    time_ref.put(10, 1);
    time_ref.put(10,0);
    time_ref.put(10,0);
    time_ref.put(10,0);
    //30 minutes
    time_ref.put(301,3);
    time_ref.put(301,0);
    time_ref.put(301,0);
    time_ref.put(301,0);
    // 45 minutes
    time_ref.put(45, 4);
    time_ref.put(45,5);
    time_ref.put(45,0);
    time_ref.put(45,0);
    //60 minutes
    time_ref.put(60, 6);
    time_ref.put(60,0);
    time_ref.put(60,0);
    time_ref.put(60,0);
    //90 minutes
    time_ref.put(90, 9);
    time_ref.put(90,0);
    time_ref.put(90,0);
    time_ref.put(90,0);
 
}
 public void include_knob(){ 
  cp5 = new ControlP5(this);
 
  
    
    myKnobB = cp5.addKnob("knobValue")
              .setRange(1,9)
              .setValue(0)
              .setPosition(660,200)
              .setRadius(50)
              .setNumberOfTickMarks(10)
              .setTickMarkLength(4)
              .snapToTickMarks(true)
              .setColorForeground(color(0))
              .setColorBackground(color(81, 81, 81))
              .setColorActive(color(255,255,0))
              .setDragDirection(2)
              ;
     cp5.hide();
 }
 public void power_slider(){
   
 //cp5 = new ControlP5(this);
 cp5.addSlider("Power")
     .setPosition(640,330)
     .setSize(150, 25)
     //.setWidth(200)
     .setRange(800, 1200) // values can range from big to small as well
     .setValue(800)
     .setNumberOfTickMarks(3)
     .setSliderMode(Slider.FLEXIBLE)
     ;
     cp5.hide();

    

}
public void go(){
   stroke(84, 220, 47);
   strokeWeight(2);
   fill(255);
   rect(655, 370, 110, 30, 3, 3, 3, 3);
   textSize(22);
   fill(84, 220, 47);
   text("Go", 690, 393);


   
 }
public int clicked_go_func(int x, int y, int width_, int height_, int cook_time){
  
  if (mouseX >= x && mouseX <= x+width_ && 
     mouseY >= y && mouseY <= y+height_ && mousePressed && cook_time != 0) {
     tts.speak("your food is now cooking");
   return 1;
 } else {
   return 0;
 }
}
 /* end screen 2 functions
 -----------------------------------------------------------*/
//screen 3 displays remaining time, add 30 sec option, add minute option. 
 //List <Integer> remaining_time = time;
 Timer timer;
 int minutes, seconds, time_0, time_1, time_2, time_3, in_millis;
 boolean pause = false;
 public void screen_3() {

     time_0 = time.get(0);
     time_1 = time.get(1);
     time_2 = time.get(2);
     time_3 = time.get(3);
     minutes = time_0*10 + time_1;
     seconds = time_2*10 + time_3;
     in_millis = minutes*60*1000 + seconds*1000;
    timer = new Timer(in_millis);
    cp5.hide();
    background(0);
    fill(255);
    reset_stroke();
    rect(100, 60, 720, 360);
    screenSeparator();

    if (timer.isFinished(pause)) {
    timer.start();
  }
    remaining_time(minutes, seconds);
    display_seven_segment(time_0, time_1, time_2, time_3, 0, 0, 0, 0);

    fill(247, 220, 111);
    textSize(34);
    text("COOKING", 640, 250);
    reset_stroke();
    stroke(192, 57, 47);
   strokeWeight(2);
     fill(255);
     rect(640, 300, 150,  55, 3, 3, 3, 3);
    fill(192, 57, 47);
    textSize(28);
    text("reset", 690, 335);
    clicked_pause_func(640, 300, 70,  55);
 }
 /* screen 3 functions */
 
public void remaining_time(int minutes, int seconds){
    time_0 = minutes/10;
    time_1 = minutes%10;
    time_2 = seconds/10;
    time_3 = seconds%10;
   
}

 public void stop_button(){
 }
 
class Timer {
 
  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  int passedTime;
  int temp_time;
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  // Starting the timer
  public void start() {
    // When the timer starts it stores the current time in milliseconds.
   
   savedTime = millis(); 
  }
  
  // The function isFinished() returns true if  ms have passed. 
  // The work of the timer is farmed out to this method.
  public boolean isFinished(boolean pause) { 
    
    // Check how much time has passed
    if(!pause){
    passedTime = millis()- savedTime;
    temp_time = passedTime;
 
    if (passedTime > totalTime) {
       reset();
       //screen_1();
      return true;
    } 
    else {
      time_(totalTime-passedTime);
    }

   
  }
return false;
}
}
   public void time_(int timer){
   timer = timer/1000;
   minutes = timer/60;
   seconds = timer%60;
   //println(minutes, seconds);
}
public int clicked_pause_func(int x, int y, int width_, int height_){
  
  if (mouseX >= x && mouseX <= x+width_ && 
     mouseY >= y && mouseY <= y+height_ && mousePressed) {
     println("pasued");
     timer.totalTime = 0;
     pause = true;
     //noLoop();
     
     redraw();
     //clicked_go = 0;
     reset();
     //screen_1(); 
  
   return 1;
 }
  else {
   return 0;
 }
}
public int clicked_continue_func(int x, int y, int width_, int height_){
  
  if (mouseX >= x && mouseX <= x+width_ && 
     mouseY >= y && mouseY <= y+height_ && mousePressed) {
     println("continue");
     //timer.totalTime = 0;
     //pause = true;
     //loop();
     //reset();
  
     //clicked_go =0;
   
     reset();
     //redraw();
   return 1;
 }
  else {
   return 0;
 }
}


 /* end screen 3 functions
 -----------------------------------------------------------*/
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#0AF03D", "--stop-color=#FF0000", "p1LakshmiSampathSomanathPagolu" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
