public class Barra{
  
  color cor;
  PVector tamanho;
  PVector posicao;
  int velocidade;
  int direcao;
  
  Barra(){
    
    tamanho = new PVector();
    posicao = new PVector();
    
    tamanho.x = 90;
    tamanho.y = 12;
    
    posicao.x = width/2;
    posicao.y = height - 100;
  }
  
  void atualizar(float aux) {
    velocidade += aux;
    
    //Movimenta a barra
    if(direcao == 1){
      posicao.x += velocidade;
    }else{
      posicao.x -= velocidade;
    }
    
    //Verifica se a barra vai sair da tela
    if(posicao.x > width - tamanho.x){
      posicao.x = width - tamanho.x;
    }
    if(posicao.x < 0){
      posicao.x = 0;
    }
  }
  
  void movimentar(int veloz, int lado) {
    velocidade = veloz;
    direcao = lado;
  }
  
  void desenhar(color cor){
    //Cores de fundo
    noStroke();
    fill(cor);
    rect(posicao.x, posicao.y, tamanho.x, tamanho.y);
  }
  
}
