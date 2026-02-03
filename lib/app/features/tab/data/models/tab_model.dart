// app/features/tab/data/models/tab_model.dart
import 'package:tab_writer/app/core/utils/validators/tab_validator.dart';
import 'package:tab_writer/app/features/tab/domain/entities/tab_entity.dart';
import 'package:tab_writer/app/features/tab/domain/entities/mesuare_entity.dart';

class TabModel extends TabEntity {
  TabModel({
    required super.title,
    super.author,
    List<MeasureEntity>? measures,
  }) {
    if (measures != null) {
      // Chama o validador externo
      this.measures.addAll(TabValidator.validateAndSort(measures));
    }
  }

  /// Substitui medidas e revalida usando o Validator
  TabModel copyWithNewMeasures(List<MeasureEntity> newMeasures) {
    final List<MeasureEntity> combinedList = List<MeasureEntity>.from(measures);

    for (var newItem in newMeasures) {
      combinedList.removeWhere((oldItem) => oldItem.id == newItem.id);
      combinedList.add(newItem);
    }

    return TabModel(
      title: title,
      author: author,
      measures: combinedList,
    );
  }

  // Métodos de conversão permanecem focados no dado bruto
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'measures': measures.map((m) => {
        'id': m.id,
        'p': m.p, 'b': m.b, 'g': m.g, 'd': m.d, 'a': m.a, 'e': m.e,
      }).toList(),
    };
  }

  factory TabModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> measuresJson = json['measures'] ?? [];
    return TabModel(
      title: json['title'] ?? 'Untitled',
      author: json['author'],
      measures: measuresJson.map((m) => MeasureEntity(
        id: m['id'],
        p: m['p'], b: m['b'], g: m['g'], d: m['d'], a: m['a'], e: m['e'],
      )).toList(),
    );
  }
}