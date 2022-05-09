import 'package:diabeticswatch/model/diabetics.dart';
import 'package:diabeticswatch/widget/button_widget.dart';
import 'package:flutter/material.dart';

class DiabeticFormWidget extends StatefulWidget {
  final ValueChanged<Diabetic> onSavedDiabetic;
  const DiabeticFormWidget({
    Key? key,
    required this.onSavedDiabetic,
  }) : super(key: key);

  @override
  _DiabeticFormWidgetState createState() => _DiabeticFormWidgetState();
}

class _DiabeticFormWidgetState extends State<DiabeticFormWidget> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController controllerData;
  late TextEditingController controllerManha;
  late TextEditingController controllerAntesAlmoco;
  late TextEditingController controllerDepoisAlmoco;
  late TextEditingController controllerAntesJanta;
  late TextEditingController controllerDepoisJanta;

  @override
  void initState() {
    super.initState();
    initDiabetic();
  }

  void initDiabetic() {
    controllerData = TextEditingController();
    controllerManha = TextEditingController();
    controllerAntesAlmoco = TextEditingController();
    controllerDepoisAlmoco = TextEditingController();
    controllerAntesJanta = TextEditingController();
    controllerDepoisJanta = TextEditingController();
  }

  @override
  Widget build(BuildContext context) => Form(
        key: formKey,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          buildData(),
          const SizedBox(
            height: 16,
          ),
          buildManha(),
          const SizedBox(
            height: 16,
          ),
          buildAntesAlmoco(),
          const SizedBox(
            height: 16,
          ),
          buildDepoisAlmoco(),
          const SizedBox(
            height: 16,
          ),
          buildAntesJanta(),
          const SizedBox(
            height: 16,
          ),
          buildDepoisJanta(),
          const SizedBox(
            height: 16,
          ),
          buildSubmit(),
          const SizedBox(
            height: 16,
          ),
        ]),
      );

  Widget buildData() => TextFormField(
        controller: controllerData,
        decoration: const InputDecoration(
            labelText: 'Data', border: OutlineInputBorder()),
      );
  Widget buildManha() => TextFormField(
        controller: controllerManha,
        decoration: const InputDecoration(
            labelText: 'Manhã', border: OutlineInputBorder()),
        validator: (value) =>
            value != null && value.isEmpty ? 'Digite Algo' : null,
      );
  Widget buildAntesAlmoco() => TextFormField(
        controller: controllerAntesAlmoco,
        decoration: const InputDecoration(
            labelText: 'Antes do Almoço', border: OutlineInputBorder()),
        validator: (value) =>
            value != null && value.isEmpty ? 'Digite Algo' : null,
      );
  Widget buildDepoisAlmoco() => TextFormField(
        controller: controllerDepoisAlmoco,
        decoration: const InputDecoration(
            labelText: 'Depois do Almoço', border: OutlineInputBorder()),
        validator: (value) =>
            value != null && value.isEmpty ? 'Digite Algo' : null,
      );
  Widget buildAntesJanta() => TextFormField(
        controller: controllerAntesJanta,
        decoration: const InputDecoration(
            labelText: 'Antes da Janta', border: OutlineInputBorder()),
        validator: (value) =>
            value != null && value.isEmpty ? 'Digite Algo' : null,
      );
  Widget buildDepoisJanta() => TextFormField(
        controller: controllerDepoisJanta,
        decoration: const InputDecoration(
            labelText: 'Depois da Janta', border: OutlineInputBorder()),
        validator: (value) =>
            value != null && value.isEmpty ? 'Digite Algo' : null,
      );
  Widget buildSubmit() => ButtonWidget(
      text: 'Salvar',
      onClicked: () {
        final form = formKey.currentState!;
        final isValid = form.validate();

        if (isValid) {
          final diabetic = Diabetic(
              data: controllerData.text,
              manha: controllerManha.text,
              antesalmoco: controllerAntesAlmoco.text,
              depoisalmoco: controllerDepoisAlmoco.text,
              antesjanta: controllerAntesJanta.text,
              depoisjanta: controllerDepoisJanta.text);
          widget.onSavedDiabetic(diabetic);
        }
      });
}
