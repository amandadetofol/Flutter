void start(){
  print("Started Main");
  f1();
  print("Finished Main");
}


void f1(){
  print("Started f1");

   // try - catch: pega qualquer exception e permite pegar o objeto do erro
   // finaly - default do try catch. roda tanto no cenario de erro quanto no de sucesso.
   // no dart qualquer objeto pode ser uma exception: n tem padrao de propriedades na exception

  try {
    f2();
  } catch(error, stacktrace) {
    print("-----------");
    print("Erro:");
    print(error.toString());
    print(stacktrace.toString());
    print("-----------");
    rethrow; //manda pra baixo na pilha 
  } finally { 
    print("Finally");
  }
  
  print("Finished f1");
}

void f2(){
  print("Started f2");
  for (int i=1; i<=5; i++){
    print(i);
    double amount = double.parse("eai meu chapa");

    // try - on: preciso saber extamente qual eh a exception
    /*
    try {
     
    } on FormatException {
      print("Failed parse");
    }*/

  }
  print("Finished f2");
}