//screen 3 displays remaining time, add 30 sec option, add minute option. 
 //List <Integer> remaining_time = time;
 //int time_0 = time.get(0);
 //int time_1 = time.get(1);
 //int time_2 = time.get(2);
 // int  time_3 = time.get(3);

 //int time_0 = 0;
 //int time_1 = 3;
 //int time_2 = 0;
 //int  time_3 = 0;
  
 void screen_3() {
 int time_0 = time.get(0);
 int time_1 = time.get(1);
 int time_2 = time.get(2);
 int time_3 = time.get(3);
    cp5.hide();
    background(0);
    fill(255);
    reset_stroke();
    rect(100, 60, 720, 360);
    screenSeparator();
    //println(remaining_time);
    remaining_time();
    display_seven_segment(time_0, time_1, time_2, time_3, 0, 0, 0, 0);

 }
 /* screen 3 functions */
 
void remaining_time(){
  if (frameCount %10 == 0){
   if (time_3 == 0 && time_2 == 0 || time_3== 6 && time_2 == 0){
     
     time_3 = 9;
     time_2 = 5;
     if (time_1 != 0) {
        //int value = reduce_1(time.get(1));
       time_1 -=1;
     }
      if (time_0 != 0) {
        //int value = reduce_1(time.get(0));
        time_1 -= 1;
     }
     time_3 -=1;
     time_2 -= 1;
   }
   println(time);}
   
  // Timer timer = new Timer(5000);
  //timer.start();
  //if (timer.isFinished()){
  //  println("timer finished");
  //}

 }

 //int reduce_1(int value){
    
 //  return value-1;
 //}
 void add_30sec(){
 }
 void add_1min(){
 }
 void open_dial(){
 }
 void stop_button(){
 }
 
 class Timer {
 
  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis(); 
  }
  
  // The function isFinished() returns true if 5,000 ms have passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished() { 
    // Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }

   }
  
 }
 
 /* end screen 3 functions
 -----------------------------------------------------------*/
