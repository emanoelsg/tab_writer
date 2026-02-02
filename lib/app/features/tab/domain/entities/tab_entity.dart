// app/features/tab/domain/entities/tab_entity.dart
import 'package:tab_writer/app/features/tab/domain/entities/mesuare_entity.dart';

class TabEntity {
  final String title;
  final String? author;
  final List<MeasureEntity> measures = [];

  TabEntity({required this.title, this.author});
}
