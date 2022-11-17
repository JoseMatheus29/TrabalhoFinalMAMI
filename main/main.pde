int posY = 0;
int posX = 0;
int auxVidaSnake = 0;
int posXvida = int(random(0, 1000));
int posYvida = 0;
life vidas;
blocos[] blocos = new blocos [10];
snake[] snake = new snake[10];
void setup() {
  size(1000, 1000);
  geraBlocos();
  geraVidas();

  for (int j = 0; j <10; j++) {
    snake[j] = new snake();
  }
}

void draw() {
  background(0);
  controlaVidas();
  mostraSnake();
  mostraBlocos();
  verificaColicao(blocos, snake);
  for (int i = 0; i < 10; i++) {
    if (blocos[i].y > 1000) {
      posX = 0;
      geraBlocos();
      mostraBlocos();
      if (vidas.valorVida < 0) {
        geraVidas();
      }
    }
  }
}
void mostraBlocos() {
  for (int i = 0; i < 10; i++) {
    blocos[i].mostrar(5);
  }
}
void geraBlocos() {
  for (int i=0; i <10; i++) {
    blocos[i] = new blocos(posX, -150, 100, 100);
    posX+=100;
    posY+=100;
  }
}
void geraVidas() {
  vidas = new life(posXvida, posYvida, 30, 30);
}
void controlaVidas() {
  vidas.mostraVida();
  if (colidir(vidas, snake[0])) {
    vidas.hit = true;
    snake[0].hit = true;
    vidas.valorVida-=1;
    auxVidaSnake = snake[0].vidaSnake;
    snake[0].vidaSnake+=1;
    if (vidas.valorVida < 0) {

      snake[0].hit = false;
      snake[0].vidaSnake = auxVidaSnake;
    }
  }
}
void mostraSnake() {
  if (snake[0].vidaSnake > 0) {
    snake[0].mostrar();
  }
}

boolean colidir(blocos A, snake B) {
  return (A.x + A.w >= B.x && A.x <= B.x + B.w && A.y + A.h >= B.y && A.y <= B.y + B.h) ;
}
void verificaColicao(blocos objBlocos[], snake objSnake[]) {
  for (int i=0; i< objBlocos.length; i++) {
    if (colidir(objBlocos[i], objSnake[0])) {
      objBlocos[0].hit = true;
      objBlocos[1].hit = true;
      objBlocos[2].hit = true;
      objBlocos[3].hit = true;
      objBlocos[4].hit = true;
      objBlocos[5].hit = true;
      objBlocos[6].hit = true;
      objBlocos[7].hit = true;
      objBlocos[8].hit = true;
      objBlocos[9].hit = true;
      objSnake[0].hit = true;
      auxVidaSnake = objSnake[0].vidaSnake;
      objSnake[0].vidaSnake -=1;
      objBlocos[i].vidaBloco-=1;
      if (objBlocos[i].vidaBloco < 0) {
        objBlocos[0].hit = false;
        objBlocos[1].hit = false;
        objBlocos[2].hit = false;
        objBlocos[3].hit = false;
        objBlocos[4].hit = false;
        objBlocos[5].hit = false;
        objBlocos[6].hit = false;
        objBlocos[7].hit = false;
        objBlocos[8].hit = false;
        objBlocos[9].hit = false;
        objSnake[0].hit = false;
        objSnake[0].vidaSnake = auxVidaSnake;
      }
    }
  }
}
