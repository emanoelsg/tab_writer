// app/features/tab/domain/repo/tab_repo.dart

import 'package:tab_writer/app/features/tab/domain/entities/tab_entity.dart';

abstract class TabRepository {
  Future<List<TabEntity>> getAllTabs();

  Future<TabEntity> getTabById(int id);

  Future<void> saveTab(TabEntity tab);

  Future<void> deleteTab(int id);
  Future<void> updateTab(TabEntity tab);
}
