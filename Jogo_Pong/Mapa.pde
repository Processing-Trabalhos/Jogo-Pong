public class Mapa{
  Bola bola;
  Barra barra;
  boolean estaViva;
  int pontuacao;
  int corAux;
  color[] cores = {#dc0030, #008ac9, #c2b600, #57378a};
  
  public Mapa(){
    this.bola = new Bola();
    this.barra = new Barra();
    this.estaViva = true;
    this.corAux = 0;
  }
  
  void desenha(){
    background(0);
    stroke(255);
    
    bola.desenhar(cores[corAux]);
    bola.movimentar();
    barra.desenhar(cores[corAux]);
    vidaDaBola();
    mostraPontuacao();
    morte();
  }
  
  void vidaDaBola(){
      if(bola.posicao.x > barra.posicao.x && bola.posicao.x < (barra.posicao.x + barra.tamanho.x)){
        if(bola.posicao.y > barra.posicao.y && bola.posicao.y < (barra.posicao.y + barra.tamanho.y)){
          bola.velocidade.y *= -1;
          pontuacao++;
          corBarraBola();
        } 
      }
      
      //Se a bolinha passar do limite da tela ela morre (Isso caso a bola esteja rapida demais e passar despercebida) 
      if (bola.posicao.y > height - 50) {
        estaViva = false;
        bola.posicao.x = width/2;
        bola.posicao.y = 50;
        bola.defineVelocidade();
        pontuacao = 0;
        corAux = 0;
      }
  }
  
  void mostraPontuacao(){
    fill(255);
    textSize(50);
    text(pontuacao, 30, 60);
  }
  
  void corBarraBola(){
    corAux++;
    if(corAux == 4){
      corAux = 0;
      print(corAux);
    }
  }
  
  void morte(){
    for (int i = 0; i < 30; i++){
      fill(#434641);
      triangle(i*50, height, i*50 + 25, height - 52, i*50 + 50, height);
    }
  }
}
