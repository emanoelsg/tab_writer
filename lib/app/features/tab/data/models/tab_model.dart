// app/features/tab/data/models/tab_model.dart

import 'package:tab_writer/app/features/tab/domain/entities/tab_entity.dart';
import 'package:tab_writer/app/features/tab/domain/entities/mesuare_entity.dart';

class TabModel extends TabEntity {
  TabModel({
    required super.title,
    super.author,
    List<MeasureEntity>? measures,
  }) {
    if (measures != null) {
      this.measures.addAll(measures);

      _sortMeasures();
    }
  }

  void _sortMeasures() {
    measures.sort((a, b) => a.id.compareTo(b.id));
  }

  Map<String, dynamic> toJson() {
    _sortMeasures();
    return {
      'title': title,
      'author': author,
      'measures': measures
          .map(
            (m) => {
              'id': m.id,
              'p': m.p,
              'b': m.b,
              'g': m.g,
              'd': m.d,
              'a': m.a,
              'e': m.e,
            },
          )
          .toList(),
    };
  }

  factory TabModel.fromJson(Map<String, dynamic> json) {
    var list = json['measures'] as List;

    return TabModel(
      title: json['title'],
      author: json['author'],
      measures: list
          .map(
            (m) => MeasureEntity(
              id: m['id'] ?? 0,
              p: m['p'],
              b: m['b'],
              g: m['g'],
              d: m['d'],
              a: m['a'],
              e: m['e'],
            ),
          )
          .toList(),
    );
  }
}
