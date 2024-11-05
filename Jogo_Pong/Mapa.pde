public class Mapa{
  Bola bola;
  Barra barra;
  boolean estaViva;
  int pontuacao;
  
  public Mapa(){
    this.bola = new Bola();
    this.barra = new Barra();
    this.estaViva = true;
  }
  
  void desenha(){
    background(0);
    stroke(255);
    
    bola.desenhar();
    bola.movimentar();
    barra.desenhar();
    vidaDaBola();
    mostraPontuacao();
  }
  
  void vidaDaBola(){
      if(bola.posicao.x >= barra.posicao.x && bola.posicao.x <= (barra.posicao.x + barra.tamanho.x)){
        if(bola.posicao.y >= barra.posicao.y && bola.posicao.y <= (barra.posicao.y + barra.tamanho.y)){
          bola.velocidade.y *= -1;
          pontuacao++;
        } 
      }
      
      //Se a bolinha passar do limite da tela ela morre (Isso caso a bola esteja rapida demais e passar despercebida) 
      if (bola.posicao.y > height - 50) {
        estaViva = false;
        bola.posicao.x = width/2;
        bola.posicao.y = 50;
        bola.defineVelocidade();
      }
  }
  
  void mostraPontuacao(){
    fill(255);
    textSize(50);
    text(pontuacao, 30, 60);
  }
}
