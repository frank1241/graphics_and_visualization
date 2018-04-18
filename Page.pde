class Page{
  int page,currentFeed;
  ArrayList<Feed> feeds;
  RadioButton feedChoose;
  Page(ArrayList<Feed> _feeds){
    this.feeds = _feeds;
    this.page = 1;
    feedChoose = new RadioButton(5,750,300);
  }
  void pageTurnForward(){
    this.page+=1;
    if(this.page > 5){
      this.page = 0;
    }
  }
  void pageTurnBack(){
    this.page-=1;
    if(this.page < 0){
      this.page = 5;
    }
  }
  void mouseOver(){
    if(mouseX <= 150 && mouseX >= 10 && mouseY <= 850 && mouseY >= 800){
      if(mousePressed == true){
        this.pageTurnBack();
        delay(10);
      }
    }
    if(mouseX <= 250 && mouseX >= 200 && mouseY <= 850 && mouseY >= 800){
      if(mousePressed == true){
        this.pageTurnForward();
        delay(10);
      }
    }
  }
  void display(){
    this.currentFeed = this.feedChoose.currentlyOn;
    this.mouseOver();
    fill(120);
    rect(0,0,width,100);
    
    fill(255);
    rect(10,800,50,50);
    fill(255);
    rect(200,800,50,50);
    for(int i=0;i<6;i++){
      this.feeds.get(this.currentFeed).display(this.page);
    }
    this.feedChoose.display();
  }

}