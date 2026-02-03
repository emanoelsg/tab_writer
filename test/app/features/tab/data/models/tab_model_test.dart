// test/app/features/tab/data/models/tab_model_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:tab_writer/app/features/tab/domain/entities/mesuare_entity.dart';
import 'package:tab_writer/app/features/tab/data/models/tab_model.dart';
import 'package:tab_writer/app/features/tab/domain/exceptions/tab_exception.dart'; // Ajuste o path

void main() {
  group('TabValidator & TabModel Logic', () {
    
    // Dados de exemplo (Happy Path)
    final m1 = MeasureEntity(id: 1, p: '1', b: '1', g: '1', d: '1', a: '1', e: '1');
    final m2 = MeasureEntity(id: 2, p: '2', b: '2', g: '2', d: '2', a: '2', e: '2');
    final m3 = MeasureEntity(id: 3, p: '3', b: '3', g: '3', d: '3', a: '3', e: '3');

    test('Deve ordenar medidas passadas fora de ordem', () {
      final model = TabModel(
        title: 'Test',
        measures: [m3, m1, m2], // Ordem bagunçada
      );

      expect(model.measures[0].id, 1);
      expect(model.measures[1].id, 2);
      expect(model.measures[2].id, 3);
    });

    test('Edge Case: Deve lançar TabSequenceException se houver IDs duplicados', () {
      final duplicateM2 = MeasureEntity(id: 2, p: 'X', b: 'X', g: 'X', d: 'X', a: 'X', e: 'X');
      
      expect(
        () => TabModel(title: 'Erro', measures: [m1, m2, duplicateM2]),
        throwsA(isA<TabSequenceException>()),
      );
    });

    test('Edge Case: Deve lançar TabSequenceException se houver "buracos" na sequência', () {
      // Pulando o ID 2
      expect(
        () => TabModel(title: 'Erro', measures: [m1, m3]),
        throwsA(isA<TabSequenceException>()),
      );
    });

    test('Funcionalidade: copyWithNewMeasures deve substituir corretamente', () {
      final modelOriginal = TabModel(title: 'Original', measures: [m1, m2]);
      
      final m2Atualizado = MeasureEntity(id: 2, p: '9', b: '9', g: '9', d: '9', a: '9', e: '9');
      
      final novoModel = modelOriginal.copyWithNewMeasures([m2Atualizado]);

      expect(novoModel.measures.length, 2);
      expect(novoModel.measures[1].p, '9'); // Verificando se o valor mudou
      expect(novoModel.measures[1].id, 2);  // Mantendo a ordem
    });
  });

  group('JSON Serialization (Node.js/MySQL Ready)', () {
    test('toJson deve gerar mapa com estrutura correta', () {
      final m1 = MeasureEntity(id: 1, p: '5', b: '-', g: '-', d: '-', a: '-', e: '-');
      final model = TabModel(title: 'Música', author: 'Autor', measures: [m1]);

      final json = model.toJson();

      expect(json['title'], 'Música');
      expect(json['measures'], isA<List>());
      expect(json['measures'][0]['p'], '5');
    });

    test('fromJson deve instanciar model corretamente', () {
      final json = {
        'title': 'Música JSON',
        'author': 'Dev',
        'measures': [
          {'id': 1, 'p': '3', 'b': '-', 'g': '-', 'd': '-', 'a': '-', 'e': '-'},
          {'id': 2, 'p': '5', 'b': '-', 'g': '-', 'd': '-', 'a': '-', 'e': '-'},
        ]
      };

      final model = TabModel.fromJson(json);

      expect(model.title, 'Música JSON');
      expect(model.measures.length, 2);
      expect(model.measures[1].id, 2);
    });
  });
}