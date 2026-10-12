// Will Davis | September 14 2026 | Calculator
// Color plaette:#00FFC4  #FF4000  #30BF9E  #AB8173  #408071
String displayVal;
float l, r, result;
char op;
boolean left;
boolean newEntry;
Button[] numButtons = new Button[10];
Button [] opButtons = new Button [12];

void setup() {
  size(280, 440);
  displayVal = "0.0";
  l = 0.0;
  newEntry=true;
  r = 0.0;
  result = 0.0;
  op = ' ';
  left = true;
  numButtons[0] = new Button(50, 300, '0', 40);
  numButtons[1] = new Button (50, 250, '1', 40);
  numButtons[2] = new Button (110, 250, '2', 40);
  numButtons[3] = new Button (170, 250, '3', 40);
  numButtons[4] = new Button (50, 200, '4', 40);
  numButtons[5] = new Button (110, 200, '5', 40);
  numButtons[6] = new Button (170, 200, '6', 40);
  numButtons[7] = new Button (50, 150, '7', 40);
  numButtons[8] = new Button (110, 150, '8', 40);
  numButtons[9] = new Button (170, 150, '9', 40);
  opButtons[0] = new Button (230, 300, 'x', 40);
  opButtons[1] = new Button (230, 250, '÷', 40);
  opButtons[2] = new Button (230, 200, '+', 40);
  opButtons[3] = new Button (230, 150, '-', 40);
  opButtons[4] = new Button (170, 300, '±', 40);
  opButtons[5] = new Button (110, 300, '.', 40);
  opButtons[6] = new Button (110, 350, '%', 40);
  opButtons[7] = new Button (170, 350, ' ', 40);
  opButtons[8] = new Button (50, 350, '^', 40);
  opButtons[9] = new Button (230, 350, ' ', 40);
  opButtons[10] = new Button (200, 400, '=', 100);
  opButtons[11] = new Button (80, 400, 'C', 100);
}

void draw() {
  background(#30BF9E);
  updateDisplay();
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].mouseOver(mouseX, mouseY);
  }
}

void updateDisplay () {
  // Background Shape
  rect(width/2, 50, 200, 80, 8);
  //Overlay Text
  fill(0);
  textAlign(RIGHT);
  //textSize(30);
  if (displayVal.length()< 12) {
    textSize(32);
  } else if (displayVal.length()>12) {
    textSize(20);
  }
  text(displayVal, width-45, height-375);
}

void mouseReleased() {
  // Update display with proper button mouse click
  for (int i = 0; i < numButtons.length; i++) {
    numButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i < opButtons.length; i++) {
    opButtons[i].mouseOver(mouseX, mouseY);
  }
  //Number Buttons
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hover == true) {
      handleEvent(numButtons[i].val, true);
    }
  }

  //Operator Buttons
  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].hover) {
      char clicked = opButtons[i].val;

      if (clicked == '=') {
        performCalc();
      } else if (clicked == '+' || clicked == '-' ||
        clicked == 'x' || clicked == '÷') {
        op = clicked;
        left = false;
        newEntry = true;
        displayVal = str(op);
      } else if (clicked == '±') {
      } else if (clicked == 'C') {
        // reset all varaibles
        displayVal = "0.0";
        l = 0.0;
        newEntry=true;
        r = 0.0;
        result = 0.0;
        op = ' ';
        left = true;
      } else if (clicked == '^') {
        if (left == true) {
          l = sq(l);
          displayVal = str(l);
        } else {
          r = sq(r);
          displayVal = str(r);
        }
      } else if (clicked == '.') {
        if (displayVal.contains(".") == false) {
          if (left == true) {
            displayVal += ".";
            l = float(displayVal);
          } else {
            displayVal += ".";
            r = float(displayVal);
          }

          //toggleSign();
        }
      }
    }
  }
}



void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '÷') {
    if (r == 0) {
      displayVal = "ERROR";
      newEntry = true;
      return;
    }
    result = l / r;
  } else if (op == 'x') {
    result = l * r;
  } else {
    return;
  }

  displayVal = str(result);
  l = result;
  r = 0.0;
  left = true;
  newEntry = true;
}

void keyPressed() {
  if (key == '1') {
    println("you hit 1 " + keyCode);
    handleEvent('1', true);
  }
  else if (key == '2') {
    println("you hit 2 " + keyCode);
    handleEvent('2', true);
  }
  else if (key == '3') {
    println("you hit 3 " + keyCode);
    handleEvent('3', true);
  }
  else if (key == '4') {
    println("you hit 4 " + keyCode);
    handleEvent('4', true);
  }
  else if (key == '5') {
    println("you hit 5 " + keyCode);
    handleEvent('5', true);
  }
  else if (key == '6') {
    println("you hit 6 " + keyCode);
    handleEvent('6', true);
  }
   else if (key == '7') {
    println("you hit 7 " + keyCode);
    handleEvent('7', true);
  }
   else if (key == '8') {
    println("you hit 8 " + keyCode);
    handleEvent('8', true);
  }
   else if (key == '9') {
    println("you hit 9 " + keyCode);
    handleEvent('9', true);
  }
   else if (key == '0') {
    println("you hit 0 " + keyCode);
    handleEvent('0', true);
  }
}

void handleEvent(char val, boolean isNum) {
  if (isNum == true) {
    String digit = str(val);



    if (newEntry || displayVal.equals("0.0")) {
      displayVal = digit;
      newEntry = false;
    } else {
      displayVal += digit;
    }

    if (left == true) {
      l = float(displayVal);
    } else {
      r = float(displayVal);
    }
  } else {
    //other stuff
  }
}
