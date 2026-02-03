// app/features/tab/domain/exceptions/tab_exception.dart
class TabSequenceException implements Exception {
  final String message;
  TabSequenceException(this.message);
  @override
  String toString() => "TabSequenceException: $message";
}