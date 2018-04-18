class RadioButton{
  float x,y;
  int currentlyOn;
  ArrayList<Button> buttonarray = new ArrayList<Button>();
  RadioButton(int amount,float x,float y){
    this.x = x;
    this.y = y;
    for(int i = 0;i<amount;i++){
      Button newButton = new Button(this.x,this.y+i*50,25,i);
      this.buttonarray.add(newButton);
    }
  }
  void checkOn(){
    for(Button current:this.buttonarray){
      if(current.isOn){
        current.isOn = false;
        this.currentlyOn = current.index;
      }
    }
  }
  void display(){
    for(Button current:this.buttonarray){
      this.checkOn();
      current.display();
    }
  }
}