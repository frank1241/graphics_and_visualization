class Feed{
  String url;
  Article currentArticle,newArticle;
  XML feed,root;
  XML[] children;
  ArrayList<Article> articles;
  color col;
  Feed(String url, color c1){
    this.col = c1;
    this.url = url;
    this.feed = loadXML(this.url);
    this.root = this.feed.getChild("channel");
    this.children = this.root.getChildren("item");
    this.articles = new ArrayList<Article>();
    for(XML i:this.children){
      newArticle = new Article(i);
      this.articles.add(newArticle);
    }
  }
  //returns next article
  void refresh(){
    this.feed = loadXML(this.url);
    this.root = feed.getChild("channel");
    this.children = this.root.getChildren("item");
    this.articles = new ArrayList<Article>();
    for(XML i:this.children){
      Article newArticle = new Article(i);
      this.articles.add(newArticle);
    }
  }
  void display(int index){
    for(int j=0;j<6; j++){
      if(index*5+j > 25){
        break;
      }
      this.articles.get(index*5+j).display(0,100+j*100,this.col);
    }
  }
}