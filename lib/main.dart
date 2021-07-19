import 'package:flutter/material.dart'; // Material Design Widget 포함한 패키지
import 'package:flutter_test1/first_page.dart';

//앱 시작 부분, 특별히 수정할 일이 없음
void main() => runApp(MyApp());

//시작 클래스. Material Design App 생성, StatelessWidget 상태를 가지지 않는 위젯
class MyApp extends StatelessWidget {
  //StatelessWidget은 build() 메서드를 가지고 있음
  @override
  Widget build(BuildContext context) {
    //StatelessWidget을 상속받은 클래스는 MaterialApp 클래스 인스턴스를 반환
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    );
  }
}
