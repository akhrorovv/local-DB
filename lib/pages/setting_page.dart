import 'package:flutter/material.dart';
import 'package:local_db/services/pref_service.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool? isSql;

  // _loadName() async {
  //   String result = (await Prefs.loadTypeDatabase()) as String;
  //   setState(() {
  //     typeDatabase = result as bool?;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Setting'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: const Text(
                'In which database should the data be stored?',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            RadioListTile<bool>(
              title: const Text(
                'SQL Database',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              value: true,
              groupValue: isSql,
              onChanged: (bool? value) {
                setState(() {
                  isSql = value;
                });
              },
            ),
            RadioListTile<bool>(
              title: const Text(
                'NoSQL Database',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              value: false,
              groupValue: isSql,
              onChanged: (bool? value) {
                setState(() {
                  isSql = value;
                });
              },
            ),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blue,
              ),
              child: MaterialButton(
                onPressed: () {
                  if (isSql != null) {
                    Prefs.storeTypeDatabase(isSql!);
                    Navigator.of(context).pop(isSql);
                    print('Selected value: $isSql');
                  } else {
                    print('Please select an option');
                  }
                },
                child: const Text(
                  'Save Changes',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            Text('$isSql'),
          ],
        ),
      ),
    );
  }
}
