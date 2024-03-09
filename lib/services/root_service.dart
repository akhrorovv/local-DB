import 'package:local_db/services/sql_service.dart';

import 'nosql_service.dart';

class RootService{
  static Future<void> init() async {
    await SqlService.init();
    await NoSqlService.init();
  }
}