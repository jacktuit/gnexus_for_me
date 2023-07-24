import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FamilyTree extends StatefulWidget {
  const FamilyTree({Key? key}) : super(key: key);

  @override
  State<FamilyTree> createState() => _FamilyTreeState();
}

class _FamilyTreeState extends State<FamilyTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "name".tr(),
            ),
            Text(
              "welcomeTo".tr(),
            ),
            ElevatedButton(
                onPressed: () {
                  context.locale = Locale('ru');
                },
                child: Text('Ru')),
            ElevatedButton(
                onPressed: () {
                  context.locale = Locale('uz');
                },
                child: Text('Uz')),
            ElevatedButton(
                onPressed: () {
                  context.locale = Locale('en');
                },
                child: Text('Uz')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
