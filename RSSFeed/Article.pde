class Article{
  float x,y;
  String title,desc,link;
  Article(XML content){
    this.title = content.getChild("title").getContent();
    this.desc = content.getChild("description").getContent();
    this.link = content.getChild("link").getContent();
  }
  String getTitle(){
    return(this.title);
  }
  String getDesc(){
    return(this.desc);
  }
  String getLink(){
    return(this.link);
  }
  String getArticle(){
    return(this.title + "\n" + 
           this.desc + "\n" + 
           this.link + "\n"
    );
  }
  void mouseOver(){
    if(mouseX <= this.x + 500 && mouseY <= this.y+100 && mouseY >= this.y){
      fill(125);
      if(mousePressed == true){
        link(this.link);
        return;
      }
    }
  }
  void display(float x, float y,color c2){
    this.x = x;
    this.y = y;
    fill(c2);
    this.mouseOver();
    rect(x,y,500,100);
    textFont(font1,16);
    fill(0);
    //change this to make it more readable
    text(this.title,x+10,y+16);
  }
}