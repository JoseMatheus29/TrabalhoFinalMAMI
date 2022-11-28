//Importação da estrutura Deque 
import java.util.Deque;
import java.util.ArrayDeque;

//Variaveis responsaveis por controlar as posições
int posY = 0;
int posX = 100;
int dataPos = 0;
int posYvida = 0;
int posXvida = int(random(100, 800));

//Variaveis responsaveis por controlar as imagens e a fonte
PImage coracao;
PImage quadrado;
PImage snakeHead;
PImage snakeBody;
PFont font;
int corAmarelo = #d89e0d;

//Variaveis auxiliares 
int auxVidaSnake = 0;
int controlaVelo = 1;

//Criação dos objetos
life vidas;
blocos[] blocos = new blocos [8];
Deque<snake> snake = new ArrayDeque<snake>();


void setup() {
  size(1000, 1000);
  coracao = loadImage("coracao.png");
  quadrado = loadImage("quadrado.png");
  snakeHead = loadImage("snake.png");
  snakeBody = loadImage("snakeBody.png");
  font = createFont("fonte.ttf", 25);
  //gerando os primeiros blocos,vida e criando a snake  
  geraBlocos();
  geraVidas();
  snake.add(new snake());
}

void draw() {
  //Adicionando uma posição aleatoria para o X da vida
  posXvida = int(random(100, 900));
  
  background(#001a01);
  fill(corAmarelo);
  textSize(100);
  text("Snake vs block", 150, 100);
  fill(#3e0600);
  rect(0, 0, 100, 1000);
  fill(#3e0600);
  rect(900, 0, 100, 1000);
  
  //chamando as funções
  removeSnake();
  adicionaSnake();
  controlaVidas();
  mostraSnake();
  mostraBlocos();
  verificaColicao(blocos, snake);
  gameOver();
  
  //Verificando se os blocos chegaram no fim da tela 
  for (int i = 0; i < blocos.length; i++) {
    if (blocos[i].y > 1000) {
      posX = 100;
      controlaVelo+=2;
      geraBlocos();
      mostraBlocos();
    }
  }
  //Verificando se a vida foi recolhida e se ela chegou no fim da tela
  if (vidas.valorVida < 0 || vidas.y > 1000) {
    geraVidas();
  }
}
