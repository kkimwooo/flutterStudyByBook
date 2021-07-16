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
      home: MyHomePage(
          title:
              'Flutter Demo Home Page'), //표시할 화면의 인스턴스, 여기에 작성하는 위젯이 실제 이 앱이 표시하는 위젯
    );
  }
}

//시작 클래스가 실제로 표시하는 클래스. 카운터 앱 화면
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  // createState 재정의, StatefulWidget 생성될 때 한 번만 실행되는 메서드
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//MyHomePage 클래스의 상태를 나타내는 State 클래스, 변경 가능한 상태를 property 변수로 표현
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; //화면에 표시할 상태값인 카운터 숫자

  //counter 변수를 1 증가시키고 화면을 다시 그리는 메서드
  void _incrementCounter() {
    setState(() {
      // 화면을 다시 그리도록 하는 함수. StatefulWidget만 가능
      _counter++;
    });
  }

  //화면에 UI를 그리는 build 메서드. 그려질 Widget 반환
  @override
  Widget build(BuildContext context) {
    //Scaffold는 Material Design 기본 뼈대 위젯 만약 없으면 appBar나 body 등의 구조가 없고 Material Design 적용 안됨
    return Scaffold(
      appBar: AppBar(
        // 상단 앱바, widget.title로 MyHomePage의 프로퍼티 참조
        title: Text(widget.title),
      ),
      body: Center(
        // 표시할 내용
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter', //_counter 변수 표시, 정수형은 문자형으로 표시할때 $ 붙이고 수행, Text안에 들어갈땐 문자형
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, //클릭 시 _incrementCounter() 메서드 실행
        tooltip: 'Increment',
        child: Icon(Icons.add), //버튼 모양
      ),
    );
  }
}
