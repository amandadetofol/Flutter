
//Aula 01 - Variáveis, Funções e Constantes
void aula01(){

  //Definindo diretamente o tipo
  int a = 1; 
  int b = 1; 
  int c = a+b; 
  int teste = somar(a,c);

  String nome = "Amanda";

  //O compilador infere o tipo 
  var numero = 1; 
  
  //final = mesmo que constantes no swift 
  final contante = 0; 
  
  print("Soma de a + b  = $c");
  print("Olá $nome");
  print("$teste");
}

int somar(int a, int b){
  return a + b;
}


//Aula 02 - Classes
class Calculadora {

  soma(a, b) {
    return a+b; 
  }

  static somaEstatica(a, b){
    return a+b;
  }

}

class Pessoa {
  final String nome; 

  Pessoa(this.nome);
}

void aula02(){
  Calculadora calculadora = new Calculadora();
  var resultado = calculadora.soma(12345, 098765);
  var resultadoEstatico = Calculadora.somaEstatica(65738, 9282892);

  var pessoa = Pessoa("Amanda");

  print(resultado);
  print(resultadoEstatico);
  print("Nome da pessoa que eu criei: ${pessoa.nome}");
}


//Aula 03 - Listas em Dart 
class Carro {
  final String nome;

  Carro(this.nome);

  String toString(){
    return "Carro: $nome";
  }
}

final Carro c1 = new Carro("Fusca");
final Carro c2 = new Carro("BMW");
final Carro c3 = new Carro("Chevete");

void aula03(){
  List<Carro> carros = [c1,c2];
  carros.add(c3);

  for(Carro carro in carros) {
    print(" >> ${carro.nome}");
  }

  //Se dar o print diretamente na lista, ele mostrará as instancias que ela contém, a não ser que eu sobreescreva o método toString da classe
  print("Lista ${carros}. Tamanho: ${carros.length}");
}

//Aula 04 - Maps em dart 
void aula04(){
  Map<String, Carro> meuMapa = {};
  meuMapa["1"] = c1;
  meuMapa["2"] = c2;
  meuMapa["3"] = c3;

  print("Lista ${meuMapa}. Tamanho: ${meuMapa.length}");

  for(String chave in meuMapa.keys) {
      print("Chave: $chave");
  }

  for(Carro carro in meuMapa.values) {
    print("Carro: ${carro.nome}");
  }
}

//Aula 05 - Herança

//Classe Pai 
class Automovel {
  void acelerar(int velocidade){
    print("Acelerar: $velocidade");
  }
}

class Caminhao extends Automovel {
  String nome;
  Caminhao(this.nome);
}

class Onibus extends TransportePublico {
  void quantidadeDePessoas(int pessoas){}
}

//O abstract class é o protocol do Swift
abstract class TransportePublico {
  void quantidadeDePessoas(int pessoas);
}

void aula05(){
  var caminhao01 = new Caminhao("Caminhão bom demais");
  caminhao01.acelerar(100);
  print(caminhao01.nome);
}

//Aula 06 - MixIn = Adicionar métodos de outras classes na sua classe sem utilizar herança, porque no dart só é permitido herdar de uma única classe.  
mixin Combustivel {
  void abastecer(int quantidade){
    print("Abastecendo: $quantidade L");
  }
}

class Moto with Combustivel {

  void acelerar(int velocidade){
    super.abastecer(10);
    print("Acelerar: $velocidade");
  }

  //Método Resumido 
  String toString() => "Moto";

}

void aula06(){
  var moto = new Moto();
  moto.acelerar(100);
}

void main(){
  //aula01();
  //aula02();
  //aula03();
  //aula04();
  //aula05();
  aula06();
}
