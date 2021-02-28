
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
    clicked_start = clicked_start_func(640, 280, 150, 70);
 }
 
 void startButton(){
   stroke(84, 220, 47);
   strokeWeight(6);
   rect(640, 280, 150, 70, 10, 10, 10, 10);
   textSize(32);
   fill(84, 220, 47);
   text("START", 668, 328);
 }
 
int clicked_start_func(int x, int y, int width_, int height_){
  if (mouseX >= x && mouseX <= x+width_ && 
     mouseY >= y && mouseY <= y+height_ && mousePressed) {
   tts.speak("Please insert your food into the door and select a time to cook");
   return 1;
 } else {
   return 0;
 }
}

void display_seven_segment(int zero, int one, int two, int three, int red, int green, int blue, int start){
   sevenSegment(nums[zero], start, red, green, blue );
   sevenSegment(nums[one], start + 40, red, green, blue);
   sevenSegment(nums[two], start + 90, red, green, blue);
   sevenSegment(nums[three], start + 130, red, green, blue);
   
   fill(255,176,0);
   circle(713, 120, 8);
   circle(713, 155, 8);
}


 void today_time(){
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
  void today_date(){
   int day = day();
   int month = month();
   int year = year();
   String date = month + "/" + day + "/" + year;
   stroke(0);
   textSize(16);
   fill(0);
   text(date, 668, 220);
}
