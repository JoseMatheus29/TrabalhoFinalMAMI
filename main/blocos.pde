class blocos {
  //Clase responsavel por criar cada bloco
  int x, y, w, h, vidaBloco, xVida, yVida, valorVida;
  boolean hit;
  blocos(int _x, int _y, int _w, int _h) {
    //Construtor que recebe as variaves para fazer cada objeto
    x = _x;
    y = _y;
    ;
    w = _w;
    h = _h;
    vidaBloco = int(random(1, 20));
    hit = false;
    valorVida = 1;
  }
  void mostrar(float vy) {
    //Metodo responsavel por mostrar cada bloco
    if (vidaBloco > 0) {
      if (!hit) {
        y += vy;
      }
      noStroke();
      image(quadrado, x, y, w, h);
      fill(255);
      textFont(font);
      text(vidaBloco, x+25, y+25);
    }
  }
}
