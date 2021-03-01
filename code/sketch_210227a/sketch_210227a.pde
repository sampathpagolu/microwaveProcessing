//import com.google.common.annotations.*;
//import com.google.common.base.*;
//import com.google.common.base.internal.*;
//import com.google.common.cache.*;
//import com.google.common.collect.*;
//import com.google.common.escape.*;
//import com.google.common.eventbus.*;
//import com.google.common.graph.*;
//import com.google.common.hash.*;
//import com.google.common.html.*;
//import com.google.common.io.*;
//import com.google.common.math.*;
//import com.google.common.net.*;
//import com.google.common.primitives.*;
//import com.google.common.reflect.*;
//import com.google.common.util.concurrent.*;
//import com.google.common.xml.*;
//import com.google.thirdparty.publicsuffix.*;

//import java.util.List;


//ListMultimap <Integer, Integer> time_ref = ArrayListMultimap.create();
//    //30 seconds
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
    time_(totalTime-passedTime);
    
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }

   }
  
 }
Timer timer;

void setup() {
  size(200,200);
  background(0);
  
//timer.start();
}

void draw() {
timer = new Timer(300000);
  if (timer.isFinished()) {
    background(random(255));
    timer.start();
  }

}
void time_(int timer){
   timer = timer/1000;
   int minutes = timer/60;
   int seconds = timer%60;
    println(minutes, seconds);
}
