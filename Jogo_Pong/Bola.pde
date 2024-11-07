public class Bola {

  int tamanho = 20;
  color cor;
  PVector posicao;
  PVector velocidade;
  
  Bola(){
    posicao = new PVector();
    velocidade = new PVector();
    
    posicao.x = width/2;
    posicao.y = height/2;
    
    defineVelocidade();
  }
  
  void movimentar(){
    posicao.x += velocidade.x;
    posicao.y += velocidade.y;
    
    //Verifica se a bola bateu nas parede
    if (posicao.x >= width || posicao.x <= 0){
      velocidade.x *= -1;
    }
    
    if (posicao.y >= height || posicao.y <= 0){
      velocidade.y *= -1;
    }
    
  }
  
  void desenhar(color cor){
    noStroke();
    fill(cor);
    circle(posicao.x, posicao.y, tamanho);
  }
  
  void defineVelocidade(){
    velocidade.y = random(5, 11);
    velocidade.x = random(1, 7);
    
    int direcao = random(1) > 0.5 ? 1 : -1;
    
    velocidade.x = velocidade.x * direcao;
    velocidade.y = velocidade.y * direcao;
  }
}
