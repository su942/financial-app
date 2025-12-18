import 'package:hive_flutter/hive_flutter.dart';
// Note: Adapters would technically be needed for custom objects,
// using generic Maps for simplicity in this prototype.

class HiveService {
  static const String _boxName = 'transactionsBox';

  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(_boxName);
  }

  Box get _box => Hive.box(_boxName);

  Future<void> saveTransaction(Map<String, dynamic> tx) async {
    await _box.add(tx);
  }

  List<Map<String, dynamic>> getTransactions() {
    return _box.values.cast<Map<String, dynamic>>().toList();
  }
}
