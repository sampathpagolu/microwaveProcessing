 // screen 2 displays time set, option to set time, power level

 void screen_2() {
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

void timer_display(List<Integer> time_now){
   int a = 0;
   int red = 38;
   int green = 148;
   int blue = 15;
  display_seven_segment(time_now.get(0),time_now.get(1),time_now.get(2),time_now.get(3), red, green, blue, a);
   
 }

void init_time_ref(){
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
 void include_knob(){ 
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
 void power_slider(){
   
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
void go(){
   stroke(84, 220, 47);
   strokeWeight(2);
   fill(255);
   rect(655, 370, 110, 30, 3, 3, 3, 3);
   textSize(22);
   fill(84, 220, 47);
   text("Go", 690, 393);


   
 }
int clicked_go_func(int x, int y, int width_, int height_, int cook_time){
  
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
