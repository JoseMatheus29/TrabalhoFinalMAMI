class snake {
  int x, y, w, h, vidaSnake;
  boolean hit;
  color cor[]= {#CC0000, #FFFFCC, #FFFFCC, #FF33FF, #99FF00};
  snake() {
    w = 60;
    h = 60;
    vidaSnake = 2;
    x = 500;
    y = 500;
    hit = false;
  }
  void mostrar() {
    if (vidaSnake > 0) {
      if (!hit) {
        if (mouseX > 5 && mouseY > 5) {
          x = mouseX;
          y = mouseY;
        }
      }
      fill(255);
      rect(x, y, w, h);
      fill(0);
      textSize(15);
      text(vidaSnake, x+20, y+20);
    }
  }
}
