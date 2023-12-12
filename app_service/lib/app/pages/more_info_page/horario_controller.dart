import 'package:get/get.dart';

class HorarioController extends GetxController {
  RxString horarioSelecionado = RxString('');

  void selecionarHorario(String horario) {
    horarioSelecionado.value = horario;
  }
}