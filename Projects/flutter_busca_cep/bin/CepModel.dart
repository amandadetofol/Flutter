class CepModel {
  final String cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String localidade;
  final String uf; 
  final String ibge; 
  final String gia; 
  final String ddd; 
  final String siafi;

  const CepModel({
    required this.cep,
    required this.localidade,
    required this.complemento,
    required this.bairro,
    required this.uf,
    required this.ibge,
    required this.gia,
    required this.ddd,
    required this.siafi,
    required this.logradouro,
  });
 
  factory CepModel.fromJson(Map<String, dynamic> json) {
    return CepModel(
      cep: json['cep'],
      logradouro: json['logradouro'], 
      complemento: json['complemento'], 
      bairro: json['bairro'], 
      localidade: json['localidade'], 
      uf: json['uf'], 
      ibge: json['ibge'], 
      gia: json['gia'], 
      ddd: json['ddd'], 
      siafi: json['siafi']);
  }
}
