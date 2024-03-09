import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../models/nosql_card_model.dart';

class NoSqlService {
  static var box = Hive.box('my_nosql');

  static Future<void> init() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive
      ..init(appDocumentDirectory.path)
      ..registerAdapter(NoSqlCardAdapter());
    await Hive.openBox("my_nosql");
  }

  /// Save object without key
  static saveCreditCard(NoSqlCard noSqlCard) async {
    box.add(noSqlCard);
  }

  static updateCreditCard(int index,NoSqlCard noSqlCard) async {
    box.putAt(index, noSqlCard);
  }

  static List<NoSqlCard> fetchNoSqlCards() {
    // List creditCards = box.values.toList();
    List<NoSqlCard> noSqlCards = [];
    for (int i = 0; i < box.length; i++) {
      var card = box.getAt(i);
      noSqlCards.add(card);
    }
    return noSqlCards;
  }

  static deleteCreditCardByIndex(int index) async {
    box.deleteAt(index);
  }
}