import java.util.Collections;
import java.util.Arrays;

PFont font;

String [] lines;

// All 3 colors
color a = color(100,0,0);
color b = color(0,100,0);
color c = color(0,0,100);
// Last row
// 590
// Last Column
// 640

// Parse txt file
// textWidth() each word


void setup() {
  size(700, 600);
  lines = loadStrings("uniquewords.txt");
}

void draw() {

  // Set initial color
  color actual_color = a;
  // Row Distance start at 0
  float row_dist = 0;
  // Mark the first row
  int y_dist = 0;
  // Length of prior text
  float x_text = 0;
  // Column distance
  int column_dist = 0;
  // How many color changes
  int color_change = 0;
  // Load Font
  font = loadFont("Chalkboard-Bold-24.vlw");
  textFont(font, 32);
  int i = 0;

  while(column_dist < 590){
    if ((row_dist + float(10) + textWidth(lines[i])) > float(670)){
      column_dist += 30;
      row_dist = float(30);
      x_text = textWidth(lines[i]);

    }
    else if (y_dist == 0){
      row_dist += float(30);
      column_dist += 30;
      x_text = textWidth(lines[i]);
      y_dist += 1;
    }
    else{
      row_dist += (float(10) + x_text);
      x_text = textWidth(lines[i]);
    }

    if(color_change % 3 == 0){
      actual_color = a;
    }
    else if(color_change % 2 == 0){
      actual_color = b;
    }
    else if(color_change % 1 == 0){
      actual_color = c;
    }

    if(column_dist >= 590){
        break;
    }

    fill(actual_color);
    text(lines[i], int(row_dist), column_dist );

    i += 1;
    color_change += 1;
  }
  if (mousePressed == true){
  Collections.shuffle(Arrays.asList(lines));
  }
}
