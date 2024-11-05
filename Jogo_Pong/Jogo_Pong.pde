PImage pong_nome, play;
Boolean menu_ativo = true;
Mapa mapa;
int corDoMenu = 0;

void setup(){
  size(1500, 800);
  frameRate(60);
  
  mapa = new Mapa();
}

void draw(){
  if(menu_ativo){
    menu(); //Menu do jogo
  }
  
  if(!menu_ativo){
    mapa.desenha();
  }
}

void mousePressed(){
    //Apertar o botão play
  if(mouseX > width/2 - 60 && mouseX < width/2 + 110 && mouseY > 550 && mouseY < 720){
    menu_ativo = false;
    frameRate(60);
  }
}

void keyPressed(){
    if (keyCode == RIGHT) {
      mapa.barra.movimentar(40);
    }
    if (keyCode == LEFT) {
      mapa.barra.movimentar(-40);
    }
}
  
void menu(){
  frameRate(3);
  
  //Cores de fundo
  color[] cores = {#dc0030, #008ac9, #c2b600, #57378a};
  background(cores[corDoMenu]);
  corDoMenu++;
  if(corDoMenu == 4){
    corDoMenu = 0;
  }
  
  //Imagem do nome do jogo
  pong_nome = loadImage("pong_nome.png"); 
  image(pong_nome, width/2 - 290, 50, 600, 600);
  
  //Botão de play
  play = loadImage("play.png");
  image(play, width/2 - 60, 550, 170, 170);
}
