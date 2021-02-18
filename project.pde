


public void settings() {


      size(1000, 500);
  }
  
  int[] nums = {0x7E, 0x30, 0x6D, 0x79, 0x33, 0x5B, 0x5F, 0x70, 0x7F, 0x7B};
  int index = 0;

  public void setup() {
    
    frameRate(1);
    
  }

  public void draw() {
    boolean clicked_go = false;
    boolean clicked_stop = false;
    screen_1();
    boolean clicked_start = clicked_start(640, 280, 150, 70);
    if (clicked_start){
      println("clicked");
    }
    else if(clicked_go){
      
    }
    else if(clicked_stop){
    }
    
    
  //screen 3 displays remaining time, add 30 sec option, add minute option. 
  }
  void screen_3(){
    
  }
  /* screen 3 functions */
  
  /* end screen 3 functions
  -----------------------------------------------------------*/
  // screen 2 displays time set, option to set time, power level
  void screen_2(){
    
  }
  /* screen 2 functions */
  
  /* end screen 2 functions
  -----------------------------------------------------------*/
  
  // screen 1 displays time, date and start button
  void screen_1(){
    
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
  /* start screen 1 functions */
  void today_time(){
    int a = 0;
    int minute = minute();
    int hour = hour();
    int hours_10 = hour%10;
    int hours_1 = floor(hour/10);
    int minutes_10 = minute%10;
    int minutes_1 = floor(minute/10);
    sevenSegment_screen1(nums[hours_1], a );
    sevenSegment_screen1(nums[hours_10], a + 40);
    sevenSegment_screen1(nums[minutes_1], a + 90);
    sevenSegment_screen1(nums[minutes_10], a + 130);
    fill(255,0,0);
    circle(713, 120, 8);
    circle(713, 155, 8);
  }
  
  void reset_stroke(){
    noStroke();
    strokeWeight(1);
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
  
  void startButton(){
    stroke(84, 220, 47);
    strokeWeight(6);
    rect(640, 280, 150, 70, 10, 10, 10, 10);
    textSize(32);
    fill(84, 220, 47);
    text("START", 668, 328);


    
  }
  
 boolean clicked_start(int x, int y, int width_, int height_){
   if (mouseX >= x && mouseX <= x+width_ && 
      mouseY >= y && mouseY <= y+height_) {
    return true;
  } else {
    return false;
  }
 }
  void screenSeparator(){
    stroke(133, 130, 130);
    strokeWeight(12);
    line(600, 70, 600, 410);
  }
  
  
  color getColor(int val, int shift) {
    int r = 255;
    int g = 0;
    int b = 0;
    int a = 40+255 * ((val >> shift) & 1);
    return color(r, g, b, a);
  }


  public void sevenSegment_screen1(int val, int x) {
    reset_stroke();
    pushMatrix();
    noStroke();
    noFill();
    
    // A
    fill(getColor(val, 6));
    rect(640+x, 100, 22, 5, 10, 10, 0, 0);
    // B
    fill(getColor(val, 5));
    rect(660+x, 110, 5, 22, 10, 10, 0, 0);
    // C
    fill(getColor(val, 4));
    rect(662+x, 140, 5, 22, 10, 10, 0, 0);
    // D
    fill(getColor(val, 3));
    rect(640+x, 165, 22, 5, 10, 10, 0, 0);
    // E
    fill(getColor(val, 2));
    rect(632+x, 140, 5, 22, 10, 10, 0, 0);
    // F
    fill(getColor(val, 1));
    rect(630+x, 110, 5, 22, 10, 10, 0, 0);
    // 
    fill(getColor(val, 0));
    rect(640+x, 135, 22, 5, 10, 10, 0, 0);

    popMatrix();
  }
  
  
  
