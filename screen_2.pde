 // screen 2 displays time set, option to set time, power level
int knobValue = 0;
 void screen_2() {
    int[] time = {0,0,0,0};
     
    //println("clicked");
    background(0);
    fill(255);
    reset_stroke();
    rect(100, 60, 720, 360);
    screenSeparator();
    reset_stroke();
    stroke(1);
    fill(255);
    cp5.show();
    time = timer_update(time);
    timer_display(time);
    
    
    
 }
 /* screen 2 functions */

void timer_display(int[] time_now){
   int a = 0;
   int red = 255;
   int green = 218;
   int blue = 0;
  display_seven_segment(time_now[0], time_now[1], time_now[2], time_now[3], red, green, blue, a);
   
 }
 int[] timer_update(int[] time){
    float counter = 0;
    rect(700, 250, 75, 75);
    counter = get_clicked(720, 300, 75, counter);
    get_time(time, counter);
    
    
  //include_knob();
  
  return time;
 }
  float get_clicked(int x, int y, int diameter, float counter){
    
  if (mouseX >= x && mouseX <= x+diameter && 
     mouseY >= y && mouseY <= y+diameter) {
     while(mousePressed){
   //tts.speak("Going to the cook screen");
    counter +=0.25; 
    if (counter == 60){
    break;
  }
 }
 println(counter);
 
  }return counter;
  }
void get_time(int[] time, float counter){
    int minutes = floor(counter);
   int seconds = (int) counter - minutes;
   time[0] = minutes%10;
   time[1] = floor(minutes/10);
   time[2] = (int) seconds%10;
   time[3] = floor(seconds/10);

  }
 void include_knob(){ 
  cp5 = new ControlP5(this);
 
  
    
    myKnobB = cp5.addKnob("knobValue")
              .setRange(0,60)
              .setValue(0)
              .setPosition(660,210)
              .setRadius(50)
              .setNumberOfTickMarks(12)
              .setTickMarkLength(4)
              .snapToTickMarks(true)
              .setColorForeground(color(255))
              .setColorBackground(color(0, 160, 100))
              .setColorActive(color(255,255,0))
              .setDragDirection(2)
              ;
     cp5.hide();
 }
 void power_slider(){
   
 cp5 = new ControlP5(this);
 cp5.addSlider("Power")
     .setPosition(640,380)
     .setSize(150, 25)
     //.setWidth(200)
     .setRange(800, 1200) // values can range from big to small as well
     .setValue(800)
     .setNumberOfTickMarks(3)
     .setSliderMode(Slider.FLEXIBLE)
     ;
     cp5.hide();
  // use Slider.FIX or Slider.FLEXIBLE to change the slider handle
  // by default it is Slider.FIX
    

}
 //}

 
 
 /* end screen 2 functions
 -----------------------------------------------------------*/
