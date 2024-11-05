public class Bola {

  int tamanho = 20;
  color cor = color(255);
  PVector posicao;
  PVector velocidade;
  
  public Bola(){
    posicao = new PVector();
    velocidade = new PVector();
    
    posicao.x = width/2;
    posicao.y = height/2;
    
    velocidade.x = random(5, 15);
    velocidade.y = random(5, 15);
    
    int direcao = random(1) > 0.5 ? 1 : -1;
    
    velocidade.x = velocidade.x * direcao;
    velocidade.y = velocidade.y * direcao;
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
  
  void desenhar(){
    fill(cor);
    ellipse(posicao.x, posicao.y, tamanho, tamanho);
  }
}
