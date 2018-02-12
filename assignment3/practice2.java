import java.util.Collections;
import java.util.Arrays;

PFont font;

String [] lines;

// All 3 colors
color a = color(100,0,100);
color b = color(240,130,0);
color c = color(0,100,100);

// Parse txt file
// textWidth() each word


void setup() {
  size(700, 600);
  lines = loadStrings("uniquewords.txt");
}

void draw() {
  background(256,256,256);
  // 590: EDGE Y-AXIS
  int edge_y = 590;
  // 670: EDGE X-AXIS
  float edge_x = 670;
  // Set initial color
  color actual_color = a;
  // How far down the rows are(Horizontal)
  int row_dist = 0;
  // Mark the first row
  int y_dist = 0;
  // Length of prior text
  float x_text = 0;
  // How far to the right the columns are(Vertical)
  float column_dist = 0;
  // How many color changes
  int color_change = 0;
  // Load Font
  font = loadFont("Chalkboard-Bold-24.vlw");
  textFont(font, 24);
  int i = 0;

  // Good
  while(row_dist < edge_y){
    // After very first word
    if (y_dist != 0){
      x_text = textWidth(lines[i - 1]);
    }
    // Only used for the very first word
    if (y_dist == 0){
      column_dist += float(30);
      row_dist += 35;
      y_dist += 1;
    }
    // Nope
    else if ((column_dist + float(10) + textWidth(lines[i])) > edge_x){
      row_dist += 35;
      column_dist = float(30);
      y_dist += 1;
    }
    else{
      column_dist += (float(10) + x_text);
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

    if(row_dist >= edge_y){
        break;
    }

    fill(actual_color);

    if ((column_dist + float(10) + textWidth(lines[i])) > edge_x){
      row_dist += 35;
      column_dist = float(30);
      y_dist += 1;
    }

    if(row_dist >= edge_y){
        break;
    }

    text(lines[i], int(column_dist), row_dist );

    i += 1;
    color_change += 1;
  }

  if (mousePressed == true){
  Collections.shuffle(Arrays.asList(lines));
  }

}

void mouseClicked() {
  Collections.shuffle(Arrays.asList(lines));
}
