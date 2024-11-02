
void setup(){
  size(1500, 800);
  background(0);
}

void draw(){
  mapa(); //Função que desenha o mapa
}

void mapa(){
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
