import 'package:get/get.dart';

class ServicoController extends GetxController {
  RxString servicoSelecionado = RxString('');

  void selecionarServico(String servico) {
    servicoSelecionado.value = servico;
  }
}
