public class Barra{
  
  color cor = color(255);
  PVector tamanho;
  PVector posicao;
  
  public Barra(){
    
    tamanho = new PVector();
    posicao = new PVector();
    
    tamanho.x = 90;
    tamanho.y = 12;
    
    posicao.x = width/2;
    posicao.y = height - 100;
  }
  
  void movimentar(int velocidade){
    posicao.x += velocidade;
  }
  
  void desenhar(){
    fill(cor);
    rect(posicao.x, posicao.y, tamanho.x, tamanho.y);
  }
  
}
