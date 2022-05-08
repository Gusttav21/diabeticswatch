class DiabeticFields {
  static final String id = 'Id';
  static final String data = 'Data';
  static final String manha = 'Manhã';
  static final String antesalmoco = 'Antes Almoço';
  static final String depoisalmoco = 'Depois Almoço';
  static final String antesjanta = 'Antes da Janta';
  static final String depoisjanta = 'Depois da Janta';

  static List<String> getFields() =>
      [id, data, manha, antesalmoco, depoisalmoco, antesjanta, depoisjanta];
}

class Diabetic {
  final int? id;
  final String data;
  final String manha;
  final String antesalmoco;
  final String depoisalmoco;
  final String antesjanta;
  final String depoisjanta;

  const Diabetic(
      {this.id,
      required this.data,
      required this.manha,
      required this.antesalmoco,
      required this.depoisalmoco,
      required this.antesjanta,
      required this.depoisjanta});
  Diabetic copy({
    int? id,
    String? data,
    String? manha,
    String? antesalmoco,
    String? depoisalmoco,
    String? antesjanta,
    String? depoisjanta,
  }) =>
      Diabetic(
          id: id ?? this.id,
          data: data ?? this.data,
          manha: manha ?? this.manha,
          antesalmoco: antesalmoco ?? this.antesalmoco,
          depoisalmoco: depoisalmoco ?? this.depoisalmoco,
          antesjanta: antesjanta ?? this.antesjanta,
          depoisjanta: depoisjanta ?? this.depoisjanta);

  Map<String, dynamic> toJson() => {
        DiabeticFields.id: id,
        DiabeticFields.data: data,
        DiabeticFields.manha: manha,
        DiabeticFields.antesalmoco: antesalmoco,
        DiabeticFields.depoisalmoco: depoisalmoco,
        DiabeticFields.antesjanta: antesjanta,
        DiabeticFields.depoisjanta: depoisjanta
      };
}
