Table table;
int color_change = 1;
int trials = 1;
int i = 0;
int[] poison_array;
int[] trial_array;
float[] time_array;
float width = 0;
int x_pos = 0;
// Set Height of bar graphs
float height1;
float y_pos = 0;
float time1 = 0;

void setup() {

  size(1800, 1000);

  table = loadTable("poisons.csv", "header");

  poison_array = new int[table.getRowCount() + 1];
  trial_array = new int[table.getRowCount() + 1];
  time_array = new float[table.getRowCount() + 1];

  println(table.getRowCount() + " total rows in table");

  for (TableRow row : table.rows()) {

    int trials = row.getInt("trials");
    float time = row.getFloat("time");
    int poison = row.getInt("poison");
    String treat = row.getString("treat");

    poison_array[i] = poison;
    trial_array[i] = trials;
    time_array[i] = time;

    println(poison_array[i]);
    println(trial_array[i]);
    println(time_array[i]);
    println("For trial " + trials + " the poison administered was poison " + poison + " lastin a time of  " + time + " with a the treatment being level " + treat);

    i+= 1;
  }

  println(poison_array);

}

void draw(){

  background(0,150,100);
  // Bar Graph
  fill(0,0,0);
  rect(80, 0, 20, 1000);
  rect(0, 900, 1800, 20);
  // Top line to not cross
  // text
  fill(150,0,150);
  textSize(40);
  text("Animal Poison Trials", 650, 60);
  text("Trials", 770, 990);
  //text("Time Alive Hours", 0, 60);
  // Controls
  fill(150,150,150);
  rect(1600, 0, 200, 1000);
  fill(0, 102, 153);
  textSize(30);
  text("To see all ", 1620, 200);
  text("the poisons", 1620, 230);
  text("on graph:", 1620, 260);
  textSize(40);
  text("Press C", 1620, 300);

  textSize(30);
  text("To Add a ", 1620, 650);
  text("Trial to", 1620, 680);
  text("the graph", 1620, 710);
  textSize(40);
  text("Press T", 1620, 750);

  // Time
  fill(211,211,211);
  line(0, 900 - ((800/13)*1), 1800, 900 - ((800/13)*1));
  line(0, 900 - ((800/13)*2), 1800, 900 - ((800/13)*2));
  line(0, 900 - ((800/13)*3), 1800, 900 - ((800/13)*3));
  line(0, 900 - ((800/13)*4), 1800, 900 - ((800/13)*4));
  line(0, 900 - ((800/13)*5), 1800, 900 - ((800/13)*5));
  line(0, 900 - ((800/13)*6), 1800, 900 - ((800/13)*6));
  line(0, 900 - ((800/13)*7), 1800, 900 - ((800/13)*7));
  line(0, 900 - ((800/13)*8), 1800, 900 - ((800/13)*8));
  line(0, 900 - ((800/13)*9), 1800, 900 - ((800/13)*9));
  line(0, 900 - ((800/13)*10), 1800, 900 - ((800/13)*10));
  line(0, 900 - ((800/13)*11), 1800, 900 - ((800/13)*11));
  line(0, 900 - ((800/13)*12), 1800, 900 - ((800/13)*12));
  line(0, 100, 1800,100);

  fill(150,150,150);
  textSize(30);

  //Alive Hours
  text("0", 60, 900);
  text("1", 60, 900 - ((800/13)*1));
  text("2", 60, 900 - ((800/13)*2));
  text("3", 60, 900 - ((800/13)*3));
  text("4", 60, 900 - ((800/13)*4));
  text("5", 60, 900 - ((800/13)*5));
  text("6", 60, 900 - ((800/13)*6));
  text("7", 60, 900 - ((800/13)*7));
  text("8", 60, 900 - ((800/13)*8));
  text("9", 60, 900 - ((800/13)*9));
  text("10", 40, 900 - ((800/13)*10));
  text("11", 40, 900 - ((800/13)*11));
  text("12", 40, 900 - ((800/13)*12));
  text("13", 40, 100);

  fill(150,0,150);
  textSize(40);
  text("E", 0, 900 - ((800/13)*3));
  text("V", 0, 900 - ((800/13)*4));
  text("I", 0, 900 - ((800/13)*5));
  text("L", 0, 900 - ((800/13)*6));
  text("A", 0, 900 - ((800/13)*7));
  text("S", 0, 900 - ((800/13)*9));
  text("R", 0, 900 - ((800/13)*10));
  text("U", 0, 900 - ((800/13)*11));
  text("O", 0, 900 - ((800/13)*12));
  text("H", 0, 100);




  for (int i = 0; i < trials; i = i+1) {

    if(trials < 8){
      x_pos = x_pos + 200;
      width = 100;
      textSize(28);
    }
    else if(trials < 16){
      x_pos = x_pos + 100;
      width = 50;
      textSize(20);
    }
    else if(trials < 21){
      x_pos = x_pos + 75;
      width = 37.5;
      textSize(15);
    }
    else if(trials < 31){
      x_pos = x_pos + 50;
      width = 25;
      textSize(10);
    }
    else if(trials < 42){
      x_pos = x_pos + 36;
      width = 18;
      textSize(7);
    }
    else if(trials < 48){
      x_pos = x_pos + 31;
      width = 15.5;
      textSize(5);
    }

    if (i == 0) {
      x_pos = 115;
    }

    time1 = time_array[i];
    y_pos = (900-((800/13)*time1*10));
    height1 = ((800/13)*time1*10);

    if (color_change % 2 == 0){
      if (poison_array[i] == 1){
        fill(255,0,0);
      }
      else if (poison_array[i] == 2){
        fill(0,255,0);
      }
      else{
      fill(0,0,255);
      }
    }
    else{
      fill(150,0,150);
    }

    rect(x_pos, y_pos ,width, height1,7);
    text ("Trial" + trial_array[i], x_pos, 950);

  }
}

void keyPressed(){
if (key == 'c' || key == 'C'){
  color_change += 1;
  }
if (key == 't' || key == 'T'){
  if (trials == 47){
    trials = 1;
  }
  else{
    trials += 1;
  }
  }
}

// NOTES:

// Make it an interactive bar Graph
// Y-axis #'s will be constant(Time)
// X-axis will vary based off of button(Trials)
// Another button have a change of color(Poisons)
// Label the axis'
// Label the constant Y-axis
// Label the trials: will have to be based off of trial # to change sizes and etc.
