import 'dart:html';

import 'package:flutter/material.dart'; // Material Design Widget 포함한 패키지

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
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'MyHomePage'),
    );
  }
}

//시작 클래스가 실제로 표시하는 클래스. 카운터 앱 화면
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//MyHomePage 클래스의 상태를 나타내는 State 클래스, 변경 가능한 상태를 property 변수로 표현
class _MyHomePageState extends State<MyHomePage> {
  var _text = 'Hello';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World'),
      ),
      body: Text(
        _text,
        style: TextStyle(fontSize: 40),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          (_text?.compareTo('World') != 0) ? _text = 'World' : _text = 'Hello';
        }),
        child: Icon(Icons.touch_app),
      ),
    );
  }
}
