PImage pong_nome, play;
Boolean menu_ativo = true;

void setup(){
  size(1500, 800);
  frameRate(30);
}

void draw(){
  if(menu_ativo) menu_ativo = menu(); //Menu do jogo
  if (!menu_ativo) mapa(); //Função que desenha o mapa
}

boolean menu(){
  frameRate(1);
  
  //Cores de fundo
  color[] cores = {#dc0030, #008ac9, #c2b600, #57378a};
  background(cores[int(random(cores.length))]);
  
  //Imagem do nome do jogo
  pong_nome = loadImage("pong_nome.png"); 
  image(pong_nome, width/2 - 290, 50, 600, 600);
  
  //Botão de play
  play = loadImage("play.png");
  image(play, width/2 - 60, 550, 170, 170);
  
  //Apertar o botão play
  if(pmouseX > width/2 - 60 && pmouseX < width/2 + 110 && pmouseY > 550 && pmouseY < 720){
    return false;
  }else{
    return true;
  }
}

void mapa(){
  clear();
  background(0);
  stroke(255);
  
  //Topo e Base
  line(width - 1400, 50, width - 100,  50);
  line(width - 1400, 750, width - 100, 750);
  
  //Laterais
  line(width - 1400, 50, width - 1400, 750);
  line(width - 100,  50, width - 100, 750);
  
  //Divisória
  line(width/2, 50, width/2, 750);
}
