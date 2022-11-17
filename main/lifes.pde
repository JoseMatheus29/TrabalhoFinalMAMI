class life extends blocos {
  life(int _x, int _y, int _w, int _h) {
    super( _x, _y, _w, _h);
  }
  void mostraVida() {
    if (valorVida > 0) {
      if (!hit) {
        y += 1;
      }
      fill(#CC0000);
      rect(x, y, 50, 50);
      fill(0);
      textSize(25);
      text(valorVida, x+25, y+25);
    }
  }
}
