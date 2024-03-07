import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../models/credit_card_model.dart';

class HiveService {
  static var box = Hive.box('my_nosql');

  static Future<void> init() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive
      ..init(appDocumentDirectory.path)
      ..registerAdapter(CreditCardAdapter());
    await Hive.openBox("my_nosql");
  }

  /// Save object without key
  static saveCreditCard(CreditCard creditCard) async {
    box.add(creditCard);
  }

  static updateCreditCard(int index,CreditCard creditCard) async {
    box.putAt(index, creditCard);
  }

  static List<CreditCard> getAllCreditCards() {
    // List creditCards = box.values.toList();
    List<CreditCard> creditCards = [];
    for (int i = 0; i < box.length; i++) {
      var card = box.getAt(i);
      creditCards.add(card);
    }
    return creditCards;
  }

  static deleteCreditCardByIndex(int index) async {
    box.deleteAt(index);
  }
}