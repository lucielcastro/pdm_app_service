import 'package:flutter/material.dart';
import '../../../constants/const_colors.dart';
import '../../../constants/svg_asset.dart';

class AlertaServicos extends StatefulWidget {
  final Map<String, String> professionMap;
  final Map<String, Map<String, String>> professionOptions;
  final Function(String profession, String? option) onSelectionChanged;

  AlertaServicos({
    required this.professionMap,
    required this.professionOptions,
    required this.onSelectionChanged,
  });

  @override
  _AlertaServicosState createState() => _AlertaServicosState();
}

class _AlertaServicosState extends State<AlertaServicos> {
  String? selectedProfession;
  String? selectedOption;
  Map<String, String> selectedOptions = {};

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            ConstColors.white,
          ),
          
        ),
        onPressed: () {
          _showDropDownMenu(context);
        },
        child: Row(
          children: [
            Text(
              'Selecionar Profissão',
              style: TextStyle(
                  color: ConstColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(width: 5),
            SvgAsset(
              image: "seta-baixo",
            )
          ],
        ));
  }

  void _showDropDownMenu(BuildContext context) {
    List<String> professions = widget.professionMap.keys.toList();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selecione uma profissão'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<String>(
                value: selectedProfession,
                items: professions.map((String profession) {
                  return DropdownMenuItem<String>(
                    value: profession,
                    child: Text(widget.professionMap[profession]!),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedProfession = value;
                    selectedOptions = widget.professionOptions[value!] ?? {};
                    selectedOption =
                        null; // Limpa a seleção do segundo DropdownButton ao trocar de profissão.
                  });
                },
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: selectedOption,
                items: selectedOptions.keys.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(selectedOptions[option]!),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedOption =
                        value; // Atualiza a opção selecionada no segundo DropdownButton.
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _updateSelectionText();
                  Navigator.pop(
                      context); // Fecha a janela de diálogo após escolher as opções.
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _updateSelectionText() {
    String professionText =
        widget.professionMap[selectedProfession!] ?? 'Nenhuma Profissão';
    String optionText = selectedOption != null
        ? selectedOptions[selectedOption!] ?? 'Nenhuma Opção'
        : 'Nenhuma Opção';

    widget.onSelectionChanged(professionText, optionText);
  }
}
