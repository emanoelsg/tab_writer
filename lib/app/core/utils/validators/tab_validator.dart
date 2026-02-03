// app/core/utils/validators/tab_validator.dart
import 'package:tab_writer/app/features/tab/domain/entities/mesuare_entity.dart';
import 'package:tab_writer/app/features/tab/domain/exceptions/tab_exception.dart';



class TabValidator {
  /// Ordena e valida se a sequência de compassos é íntegra.
  static List<MeasureEntity> validateAndSort(List<MeasureEntity> list) {
    if (list.isEmpty) return [];

    // 1. Cria cópia e ordena
    final sortedList = List<MeasureEntity>.from(list);
    sortedList.sort((a, b) => a.id.compareTo(b.id));

    // 2. Varredura de integridade
    for (int i = 0; i < sortedList.length; i++) {
      // Verifica Duplicatas
      if (i < sortedList.length - 1 && sortedList[i].id == sortedList[i + 1].id) {
        throw TabSequenceException(
          "ID duplicado detectado: ${sortedList[i].id}. Cada compasso deve ser único.",
        );
      }

      // Verifica Saltos (Gaps) - Garante que a música é contínua
      if (i > 0 && sortedList[i].id != sortedList[i - 1].id + 1) {
        throw TabSequenceException(
          "Quebra na sequência: detectado salto entre o ID ${sortedList[i - 1].id} e o ${sortedList[i].id}.",
        );
      }
    }

    return sortedList;
  }
}