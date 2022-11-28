class life extends blocos {
  //Clase responsavel por criar cada vida
  //A clase ultiliza do conceito de herança para ser do mesmo tipo de blocos

  life(int _x, int _y, int _w, int _h) {
    //Construtor que recebe as variaves para fazer cada objeto
    super( _x, _y, _w, _h);
  }
  void mostraVida() {
    //Metodo responsavel por mostrar cada vida
    if (valorVida > 0) {
      if (!hit) {
        y += 5;
      }
      fill(#CC0000);
      image(coracao, x, y, 50, 50);
      fill(0);
    }
  }
}
