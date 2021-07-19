import 'package:flutter/material.dart'; // Material Design Widget 포함한 패키지
import 'package:flutter_test1/person.dart';

class SecondPage extends StatefulWidget {
  final Person person;

  const SecondPage({Key? key, required this.person}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    super.initState();
    print('SecondPage initState()');
  }

  @override
  void dispose() {
    super.dispose();
    print('SecondPage dispose()');
  }

  @override
  Widget build(BuildContext context) {
    print('SecondPage build()');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.person.name),
      ),
      body: ElevatedButton(
        child: Text('Previous Page'),
        onPressed: () {
          Navigator.pop(context); //현재 화면 종료하고 이전 화면으로 돌아가기
        },
      ),
    );
  }
}
