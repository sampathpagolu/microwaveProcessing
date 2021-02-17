// Daniel Shiffman
// http://youtube.com/thecodingtrain
// http://codingtra.in

// Coding Challenge #117: Seven-Segment Display
// https://youtu.be/MlRlgbrAVOs
// 
import java.util.*;

public void settings() {
//    int a = 24;
//    int tenths = floor(24/10);
//    int b = a%10;
    size(1000, 500);
//    System.out.println(b);
//    System.out.println(nums[tenths]);
  }
  
  int[] nums = {0x7E, 0x30, 0x6D, 0x79, 0x33, 0x5B, 0x5F, 0x70, 0x7F, 0x7B};
  int index = 0;

  public void setup() {
    
    frameRate(1);
  }

  public void draw() {
    background(0);
    int a = 0;
    int minute = minute();
    int hour = hour();
    System.out.println(hour);
    int hours_10 = hour%10;
    int hours_1 = floor(hour/10);
    int minutes_10 = minute%10;
    int minutes_1 = floor(minute/10);

    fill(255);
    rect(100, 60, 720, 360);
    //line(600, 60, 600, 420);
    //line(620, 100, 800, 100);
    //line(620, 200, 800, 200);
    //line(620, 380, 800, 380);
    //line(620, 380, 800, 380);
    sevenSegment(nums[hours_1], a );
    sevenSegment(nums[hours_10], a + 40);
    
    sevenSegment(nums[minutes_1], a + 90);
    sevenSegment(nums[minutes_10], a + 130);
    fill(255,0,0);
    circle(713, 120, 8);
    circle(713, 155, 8);
    
  }
  
  color getColor(int val, int shift) {
    int r = 255;
    int g = 0;
    int b = 0;
    int a = 40+255 * ((val >> shift) & 1);
    return color(r, g, b, a);
  }


  public void sevenSegment(int val, int x) {
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
