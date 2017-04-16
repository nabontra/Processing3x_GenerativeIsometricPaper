import processing.pdf.*;

int rowleft = 0;  //start first line
int rowright = 15;  //start end of first line
int oldleft = 0;
int oldright = 0;
int vertspace = 30;
int randrange = 6;

int rows = 80;
int columns = 22;
int columnspace = 30;
int columnleft = 0;
int columnright = 30;

void setup() {
  
  size(1260, 1782);
  background(255);
  //strokeWeight(20);
}

void draw() {
  
  beginRecord( PDF, "pdf/isographglitch-####.pdf" );  //where to save your file
  
  for (int i = 0; i < rows; i++) {
    stroke(0);
    line(columnleft, rowleft, columnright, rowright);
    line(columnleft,0,columnleft,height);
      line(columnright,0,columnright,height);
    
    for (int x = 0; x < columns; x++){
      columnleft = columnleft+columnspace;
      columnright = columnright+columnspace;
      line(columnleft, rowright, columnright, rowleft);
      columnleft = columnleft+columnspace;
      columnright = columnright+columnspace;
      line(columnleft, rowleft, columnright, rowright);
      line(columnleft,0,columnleft,height);
      line(columnright,0,columnright,height);
    }
    
    columnleft = 0;
    columnright = 30;
    oldright = rowright;
    rowleft = rowleft + vertspace + int(random(-randrange,randrange));
    rowright = rowright + vertspace + int(random(-randrange,randrange));
    line(columnright, oldright, columnleft, rowleft);
    
    for (int x = 0; x < columns; x++){
      columnleft = columnleft+columnspace;
      columnright = columnright+columnspace;
      line(columnleft, oldright, columnright, rowleft);
      columnleft = columnleft+columnspace;
      columnright = columnright+columnspace;
      line(columnleft,rowleft,columnright,oldright);
      
    }
    columnleft = 0;
    columnright = 30;
  }
  endRecord();
  
  exit();
  
}