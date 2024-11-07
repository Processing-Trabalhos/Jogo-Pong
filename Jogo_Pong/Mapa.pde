public class Mapa{
  Bola bola;
  Barra barra;
  QLearning agente;
  
  int corAux;
  color[] cores = {#dc0030, #008ac9, #c2b600, #57378a};
  
  boolean estaViva;
  int pontuacao;
  int quadroAtual;
  int quadroUltimaAcao;
  String estadoUltimaAcao; 
  int ultimaAcao;
  int direita, esquerda;
  int velocidadeBarra;
  float aux = 0.6;
  
  Mapa(){
    this.bola = new Bola();
    this.barra = new Barra();
    this.estaViva = true;
    this.corAux = 0;
    this.agente = new QLearning(0.1, 0.99, 1.0, 0.01, 0.001);
    this.direita = 1;
    this.esquerda = -1;
    this.velocidadeBarra = 5;
  }
  
  void desenha(){
    background(0);
    stroke(255);
    
    reiniciar();
    bola.desenhar(cores[corAux]);
    bola.movimentar();
    barra.desenhar(cores[corAux]);
    pontua();
    mostraPontuacao();
    triangulos();
    atualizarQLearning();
    barra.atualizar(aux);
  }
  
  void reiniciar(){
    //Se a bolinha passar do limite da tela ela morre (Isso caso a bola esteja rapida demais e passar despercebida) 
      if (bola.posicao.y > height - 50) {
        estaViva = false;
        bola.posicao.x = width/2;
        bola.posicao.y = 50;
        bola.defineVelocidade();
        pontuacao = 0;
        corAux = 0;
        quadroAtual = 0;
        quadroUltimaAcao = 0;
        estadoUltimaAcao = obterEstado();
        ultimaAcao = 0;
      }
  }
  
  String obterEstado() {
    int bolaY =  round(map(bola.posicao.y, 0, width, 0, 10));
    int barraAcerto = round(map(bola.posicao.x - barra.posicao.x, 0, height, 0, 20));
    return  bolaY + "," + barraAcerto;
  }
  
  void atualizarQLearning(){
    quadroAtual++;
    
    // Ação do RL
    if (quadroAtual - quadroUltimaAcao >= 5) {
      
      // Atualizar valor Q após a ação
      float recompensa = estaViva ? 1 : - 100;
      String estadoAtual = obterEstado();
      agente.atualizarValorQ(estadoUltimaAcao, ultimaAcao, recompensa, estadoAtual);
      
      ultimaAcao = agente.escolherAcao(estadoAtual);
      if (ultimaAcao == 1 && bola.posicao.x > barra.posicao.x){
        barra.movimentar(velocidadeBarra, direita);
      }
      else if(ultimaAcao == 1 && bola.posicao.x < barra.posicao.x){
        barra.movimentar(velocidadeBarra, esquerda);
      }
      
      estadoUltimaAcao = estadoAtual;
      quadroUltimaAcao = quadroAtual;
    }
  }
  
  void pontua(){
      if(bola.posicao.x > barra.posicao.x && bola.posicao.x < (barra.posicao.x + barra.tamanho.x)){
        if(bola.posicao.y > barra.posicao.y && bola.posicao.y < (barra.posicao.y + barra.tamanho.y)){
          bola.velocidade.y *= -1;
          pontuacao++;
          corBarraBola();
        } 
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
    }
  }
  
  void triangulos(){
    for (int i = 0; i < 30; i++){
      fill(#434641);
      triangle(i*50, height, i*50 + 25, height - 52, i*50 + 50, height);
    }
  }
}
