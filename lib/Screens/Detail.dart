import 'package:andoo/Models/Quote.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    var message = ModalRoute.of(context)!.settings.arguments;

    print(message);
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: const Text('Detail'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('$message'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
