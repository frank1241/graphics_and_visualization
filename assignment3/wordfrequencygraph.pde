//Global Variables

//Used in draw() and drawBar() 
int amount;
int boxmiddle;
int tall;
String index;

//used in bar
int wordindex;
int wordcount;
int frequency;


//Used in drawBar and stringParser
String[] lines;
String[][] wordarray;

void setup(){
  size(1920,1080);
  background(255);
  stringParser();  
  
}


void draw(){
  
  //create Axes
  line(75,100,75,900);
  line(75,900,1800,900);
  
  //Titles
  
  //Bottom Title
  textSize(20);
  fill(0);
  text("Word Frequency",862,950);
  
  
  //Left Hand Title
  textSize(20);
  fill(0);
  pushMatrix();
  translate(25,600);
  rotate(-(HALF_PI));
  text("Total Unique Words",0,0);
  popMatrix(); 
  
  
  //Creates Y Axis Tick Marks
  for(int y =0;y<880;y+=80){
    
    index = str(1000 - (y/8)*10);
    line(72,100+y,78,100+y);
    
    textSize(15);
    text(index,30,99+y);
  
  }  
  
  
  //Creates X axis tick marks
  for(int x = 0; x<1730;x+=14){
      //tickmark
      boxmiddle = 75+x;
      line(boxmiddle,897,boxmiddle,903);
      
      //create bar
      drawBar();
      wordindex += 1;
      
      
  }
  noLoop();
}



//These are the new Changes
//added axis labels, and now creates a bar
void drawBar(){
  
  frequency = Integer.parseInt(wordarray[wordindex][0]);
  wordcount = Integer.parseInt(wordarray[wordindex][1]);
  
  //how high is the rectangle
  tall = 900 - wordcount;
  
  //creates an axes label for the bar
  if(str(frequency).length()==1){
    textSize(8);
    fill(0);
    pushMatrix();
    translate(boxmiddle,910);
    rotate(-(HALF_PI));
    text(frequency,0,0);
    popMatrix(); 
  }
  else if(str(frequency).length()<3){
    textSize(8);
    fill(0);
    pushMatrix();
    translate(boxmiddle,915);
    rotate(-(HALF_PI));
    text(frequency,0,0);
    popMatrix();
  }
  else{
    textSize(8);
    fill(0);
    pushMatrix();
    translate(boxmiddle,925);
    rotate(-(HALF_PI));
    text(frequency,0,0);
    popMatrix();
  }
  
  //creates the bar
  fill(255);
  rect(boxmiddle-7,900-wordcount,14,wordcount);

  
  
  
  
}





//Credit to team member Frank Wang
//Takes a Text File with word frequencies and returns an array of arrays
//Each array contains two elements: Word Frequency and Word Count
void stringParser() {  
  //create new array
  lines = loadStrings("wordfrequency.txt");
  wordarray = new String[lines.length][2];

  for (int i = 0 ; i < lines.length; i++) {
        wordarray[i] = lines[i].split(": ");
  }

}
