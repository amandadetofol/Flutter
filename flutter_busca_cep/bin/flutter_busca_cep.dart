import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:flutter_busca_cep/flutter_busca_cep.dart' as flutter_busca_cep;
import 'dart:io';

import 'CepModel.dart';

/*
Faça um buscador de CEP usando a API do ViaCep.
O usuário deve enviar um cep, podendo ter a mascara(#####-###) ou não.
Os dados devem ser convertidos em um Model.
Ao buscar, deve ser mostrado no terminal os dados.
Enquanto o usuário não digitar(input) 0, deve se repetir. - OK 
 */

bool checkIfInformedCepIsValid(String cep){
  final cepRegex = RegExp(r'(^[0-9]{5})-?([0-9]{3}$)');
  return cepRegex.hasMatch(cep);  
}

Future<CepModel> getCepInformations(String cep) async {
  
  final response = await http.get(Uri.parse('https://viacep.com.br/ws/${cep}/json/'));
  if (response.statusCode == 200) {
    print(response.body);
    showCepProperties(CepModel.fromJson(jsonDecode(response.body)));
    return CepModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to get informations');
  }

}

void showCepProperties(CepModel model){
  print(" -----------------------------------------------------");
  print(" | Cep: ${model.cep}");
  print(" | Logradouro: ${model.logradouro}");
  print(" | Complemento: ${model.complemento}");
  print(" | Bairro: ${model.bairro}");
  print(" | Unidade Federativa: ${model.uf}");
  print(" | IBGE: ${model.ibge}");
  print(" | GIA: ${model.gia}");
  print(" | DDD: ${model.ddd}");
  print(" | SIAFI: ${model.siafi}");
  print(" -----------------------------------------------------");
}

Future<void> main(List<String> arguments) async {
  while (true) {
    print("-----------------------------------------------------");
    print("Entre com o seu CEP, com ou sem mascara de campo: ");
    String? userInput = stdin.readLineSync();

    if ((userInput != null) && (checkIfInformedCepIsValid(userInput))){
      print("Buscando informações...");
      await getCepInformations(userInput);
    } else {
      print("Fim.");
      break;
    }  
  }
}

