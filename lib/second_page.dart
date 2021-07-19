import 'package:flutter/material.dart'; // Material Design Widget 포함한 패키지
import 'package:flutter_test1/first_page.dart';
import 'package:flutter_test1/person.dart';

class SecondPage extends StatelessWidget {
  final Person person;

  //required를 붙이면 필수 입력 파라미터
  SecondPage({required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second'),
      ),
      body: ElevatedButton(
        child: Text('Previous Page'),
        onPressed: () {
          Navigator.pop(context, 'ok'); //현재 화면 종료하고 이전 화면으로 돌아가기
        },
      ),
    );
  }
}
