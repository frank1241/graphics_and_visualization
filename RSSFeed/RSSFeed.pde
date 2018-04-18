PFont font1;
int globaltimer;
Page page;
Feed f1,f2,f3,f4,f5;
void setup(){
  size(800,1000);
  f1 = new Feed("http://feeds.bbci.co.uk/news/education/rss.xml?edition=uk",#FAD1D1);
  f2 = new Feed("http://feeds.bbci.co.uk/news/rss.xml?edition=uk",#C7F8FC);
  f3 = new Feed("http://feeds.bbci.co.uk/news/world/rss.xml?edition=uk",#FCE494);
  f4 = new Feed("http://feeds.bbci.co.uk/news/video_and_audio/technology/rss.xml?edition=uk",#B9F7CA);
  f5 = new Feed("http://feeds.bbci.co.uk/news/entertainment_and_arts/rss.xml?edition=uk",#CBB7C1);
  ArrayList<Feed> _flist = new ArrayList<Feed>();
  _flist.add(f1);
  _flist.add(f2);
  _flist.add(f3);
  _flist.add(f4);
  _flist.add(f5);

  page = new Page(_flist);
  font1 = createFont("Times New Roman",24);
}
void draw(){
  background(255);
  page.display();
}