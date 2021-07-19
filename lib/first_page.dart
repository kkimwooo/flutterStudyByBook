import 'package:flutter/material.dart'; // Material Design Widget 포함한 패키지
import 'package:flutter_test1/second_page.dart';
import 'package:flutter_test1/person.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First'),
      ),
      body: ElevatedButton(
        child: Text('Next Page'),
        onPressed: () async {
          final person = Person('홍길동', 20);
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondPage(person: person)),
          );
          print(result);
        },
      ),
    );
  }
}
