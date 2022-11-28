void mostraBlocos() {
  //Função que percorre o array que armazena os blocos e mostra cada um
  for (int i = 0; i < 8; i++) {
    blocos[i].mostrar(controlaVelo);
  }
}
void mostraSnake() {
  //Função que percorre o array que armazena cada parte da snake e mostra cada um
  for (snake Atualsnake : snake) {
    if (snake.getFirst().vidaSnake > 0) {
      Atualsnake.mostrar();
    }
  }
}
void geraBlocos() {
  //Função que percorre o array dos blocos e preenche ele
  for (int i=0; i <8; i++) {
    blocos[i] = new blocos(posX, -150, 100, 100);
    posX+=100;
    posY+=100;
  }
}
void geraVidas() {
  //Função que cria cada vida
  vidas = new life(posXvida, posYvida, 30, 30);
}
void controlaVidas() {
  //Função que mostra cada vida e controla ela por todo o codigo
  vidas.mostraVida();
  if (snake.size() > 0) {
    if (colidir(vidas, snake.getFirst())) {
      vidas.hit = true;
      snake.getFirst().hitVida = true;
      vidas.valorVida-=1;
      auxVidaSnake = snake.getFirst().vidaSnake;
      snake.getFirst().vidaSnake+=1;
      if (vidas.valorVida < 0) {
        snake.getFirst().hitVida = false;
        snake.getFirst().vidaSnake = auxVidaSnake;
      }
    }
  }
}


boolean colidir(blocos A, snake B) {
  //Função que verifica a colição de cada objeto dentro do codigo
  return (A.x + A.w >= B.x && A.x <= B.x + B.w && A.y + A.h >= B.y && A.y <= B.y + B.h) ;
}
void gameOver() {
  //Função que finaliza o game
  if (snake.size()  <= 0) {
    paraBlocos(blocos);
    vidas.hit = true;
    fill(corAmarelo);
    textSize(100);
    text("Game Over", 250, 250);
  }
}
void verificaColicao(blocos objBlocos[], Deque<snake> objsnake) {
  //Função que percorre o array de blocos e de snake para verificar a colição de cada elemento
  for (int i=0; i< objBlocos.length; i++) {
    if (snake.size() > 0) {
      if (colidir(objBlocos[i], objsnake.getFirst())) {
        paraBlocos(objBlocos);
        objsnake.getFirst().hit = true;
        auxVidaSnake = objsnake.getFirst().vidaSnake;
        objsnake.getFirst().vidaSnake -=1;
        objBlocos[i].vidaBloco-=1;
        if (objBlocos[i].vidaBloco < 0) {
          continuaBlocos(objBlocos);
          objsnake.getFirst().hit = false;
          objsnake.getFirst().vidaSnake = auxVidaSnake;
        }
      }
    }
  }
}
void adicionaSnake() {
  //Função que adicionar um corpo a snake caso ela colida com a vida
  if (snake.size() > 0) {
    if (snake.getFirst().hitVida) {
      if (snake.getFirst().vidaSnake == 2) {
        corpSnake newSnake = new corpSnake();
        newSnake.x  =  snake.getFirst().x;
        newSnake.y =  snake.getFirst().y+40;
        dataPos = newSnake.y;
        snake.add(newSnake);
      } else {
        corpSnake newSnake = new corpSnake();
        for (int c=0; c < snake.getFirst().vidaSnake; c++) {
          newSnake.y  = dataPos + 40;
          newSnake.x  =  snake.getFirst().x;
        }
        snake.add(newSnake);
        dataPos+=40;
      }
    }
  }
}
void removeSnake() {
  //Função que remove um corpo da snake caso ela colida com o bloco
  if (snake.size() > 0) {
    if (snake.getFirst().hit) {
      snake.removeLast();
      dataPos-=40;
    }
  }
}
void paraBlocos(blocos objBlocos[]) {
  //Função que para todos os elementos do array de blocos
  objBlocos[0].hit = true;
  objBlocos[1].hit = true;
  objBlocos[2].hit = true;
  objBlocos[3].hit = true;
  objBlocos[4].hit = true;
  objBlocos[5].hit = true;
  objBlocos[6].hit = true;
  objBlocos[7].hit = true;
}
void continuaBlocos(blocos objBlocos[]) {
  //Função que dar movimento novamente para todos os elementos do array de blocos
  objBlocos[0].hit = false;
  objBlocos[1].hit = false;
  objBlocos[2].hit = false;
  objBlocos[3].hit = false;
  objBlocos[4].hit = false;
  objBlocos[5].hit = false;
  objBlocos[6].hit = false;
  objBlocos[7].hit = false;
}
