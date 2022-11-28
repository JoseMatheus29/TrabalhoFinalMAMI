class snake {
  //Clase responsavel por criar o primeiro elemento da snake
  int x, y, w, h, vidaSnake, nova;
  boolean hit, hitVida;
  snake() {
    //Construtor que recebe as variaves para fazer cada objeto
    w = 50;
    h = 50;
    vidaSnake = 1;
    x = 500;
    y = 500;
    hit = false;
    hitVida = false;
  }
  void mostrar() {
    //Metodo responsavel por mostrar a primeira parte da snake
    if (vidaSnake > 0) {
      if (!hit) {
        x = constrain(x, 100, 840);
        y = constrain(y, -20, 900);
        //Verificando se alguma tecla foi pressionada para controlar a posição da snake
        if (keyPressed) {
          if (keyCode == RIGHT) {
            x+=25;
          }
          if (keyCode == LEFT) {
            x-=25;
          }
        }
      }

      fill(255);
      image(snakeHead, x, y, w, h);
    }
    fill(corAmarelo);
    textSize(50);
    text("Score:"+snake.getFirst().vidaSnake, 600, 700);
  }
}
class corpSnake extends snake {
  //Clase responsavel por criar cada parte do corpo da snake
  //A clase ultiliza do conceito de herança para ser do mesmo tipo de snake
  void mostrar() {
    //Metodo responsavel por mostrar cada parte do corpo da snake

    x = constrain(x, 100, 840);
    y = constrain(y, -20, 1000);

    if (keyPressed) {
      if (keyCode == RIGHT) {
        x+=25;
      }
      if (keyCode == LEFT) {
        x-=25;
      }
    }

    fill(99, 167, 98);
    rect(x+15, y, w-31, h);
  }
}
