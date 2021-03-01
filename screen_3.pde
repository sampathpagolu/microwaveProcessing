//screen 3 displays remaining time, add 30 sec option, add minute option. 
 //List <Integer> remaining_time = time;
 Timer timer;
 int minutes, seconds, time_0, time_1, time_2, time_3, in_millis;
 boolean pause = false;
 void screen_3() {

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
 
void remaining_time(int minutes, int seconds){
    time_0 = minutes/10;
    time_1 = minutes%10;
    time_2 = seconds/10;
    time_3 = seconds%10;
   
}

 void stop_button(){
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
  void start() {
    // When the timer starts it stores the current time in milliseconds.
   
   savedTime = millis(); 
  }
  
  // The function isFinished() returns true if  ms have passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished(boolean pause) { 
    
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
   void time_(int timer){
   timer = timer/1000;
   minutes = timer/60;
   seconds = timer%60;
   //println(minutes, seconds);
}
int clicked_pause_func(int x, int y, int width_, int height_){
  
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
int clicked_continue_func(int x, int y, int width_, int height_){
  
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
