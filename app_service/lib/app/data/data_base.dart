import 'package:get/get.dart';

class DataBase extends GetxController {
  Map userData = {
    'nome': 'Maria Silva',
    'cpf': '123.456.789-01',
    'cidade': 'Caxias',
    'bairro': 'Maranhão',
    'rua': '2',
    'numero': '1',
  };

  final Map<String, String> professionMap = {
    'barbeiro': 'Barbeiro',
    'pintor': 'Pintor',
    'pedreiro': 'Pedreiro',
    'encanador': 'Encanador',
    'eletricista': 'Eletricista',
    'mecanico': 'Mecânico',
    'jardineiro': 'Jardineiro',
    'cozinheiro': 'Cozinheiro'
  };

  final Map<String, Map<String, String>> professionOptions = {
    'barbeiro': {
      'barba': 'Barba',
      'cabelo': 'Cabelo',
    },
    'pintor': {
      'pintura_casa': 'Pintura de Casa',
      'pintura_carro': 'Pintura de Carro',
    },
    'pedreiro': {
      'alvenaria': 'Alvenaria',
      'reboco': 'Reboco',
    },
    // Adicione outras opções para os demais profissionais, se necessário
  };

  final List<Map<String, dynamic>> dadosLoja = [
    {
      'nomeLoja': 'Babearia Jose',
      'horario': '15:00',
      'data': '10/10/2023',
      'status': 'Analizando',
    },
    {
      'nomeLoja': 'Salão Cabelos',
      'horario': '09:00',
      'data': '12/10/2023',
      'status': 'Em andamento',
    },
    {
      'nomeLoja': 'PetShop Pets',
      'horario': '17:00',
      'data': '10/10/2023',
      'status': 'Finalizado',
    }
  ];

  final Map servico = {
    'nome': 'João Silva',
    'servico': 'Troca de tomadas',
    'hora': '15:00',
    'data': '10/10/2023',
    'status': 'Pago',
    'valor': '100,00',
    'n_servico': '11363217',
    'pagamento': 'Pix'
  };
}
