class blocos {
  int x, y, w, h, vidaBloco, xVida, yVida,valorVida;
  boolean hit;
  //          vd         az     marrom     roxo      vdcl    uva      bege      verFer   lima    rosa
  color[] c = {#0000FF, #00ff00, #663300, #666666, #66FF66, #6633FF, #FFFFCC, #CC0000, #99FF00, #FF33FF, #000055,
    #330033, #33FFFF, #666633, #9933FF, #996600, #FFFF00, #99FF33, #FFFFFF, #3399FF, #333300, #CC6600,
    #FF9900, #339933, #333333, #6600FF, #33FFFF, #330033, #0033FF, #003300, #FFCC99, #FFFFCC, #FF6633,
    #99FF66, #FF66CC, #33FF66, #CC6600, #CCCCCC, #669933, #FF66FF, #669900, #66CC00, #FF0099, 0xFF00CC
  };
  int cor = int(random(0,c.length));
  blocos(int _x, int _y, int _w, int _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    vidaBloco = int(random(1, 20));
    hit = false;
    valorVida = int(random(1, 10));
  }
  void mostrar(float vy) {
    if (vidaBloco > 0) {
      if (!hit) {
        y += vy;
      }
      fill(c[cor]);
      rect(x, y, w, h);
      fill(0);
      textSize(25);
      text(vidaBloco, x+25, y+25);
    }
  }
}
