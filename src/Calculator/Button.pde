class Button {
  // Member Variables
  float x, y, w, h;
  color c1, c2;
  char val;
  boolean hover;

  //Constructor
  Button(float x, float y, char val, float w) {
    this.x = x;
    this.y = y;
    this.w = w;
    h = 40;
    c1 = color(#FF4000);
    c2 = color(#408071);
    this.val = val;
    hover = false;
  }

  // Member Methods
  void display() {
    textSize(32);
    textAlign(CENTER);
    if(hover == true) {
    fill(c1);
  } else {
    fill(c2);
  }
    rect(x, y, w, h,10);
    rectMode (CENTER);
    fill(255);
    if(val == 'c') {}
    text(val, x, y+5);
  }


  void mouseOver(float tempX, float tempY) {
    if (tempX > x-w/2 && tempX < x+w/2 && tempY > y-h/2 && tempY < y+h/2) {
      hover = true;
    } else {
      hover = false;
    }
  }
}
