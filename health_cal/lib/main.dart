import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI 계산기',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BmiMain(),
    );
  }
}

class BmiMain extends StatefulWidget {
  @override
  _BmiMainState createState() => _BmiMainState();
}

class _BmiMainState extends State<BmiMain> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  //폼의 상태를 얻기 위한 키
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비만도 계산기'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: '키'),
                keyboardType: TextInputType.number,
                controller: _heightController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '키를 입력하세요';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: '몸무게'),
                keyboardType: TextInputType.number,
                controller: _weightController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '몸무게를 입력하세요';
                  }
                  return null;
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    //폼에 입력한 값 검증
                    if (_formKey.currentState!.validate()) {
                      //검증시 처리
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BmiResult(
                                    double.parse(_heightController.text.trim()),
                                    double.parse(_weightController.text.trim()),
                                  )));
                    }
                  },
                  child: Text('결과'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BmiResult extends StatelessWidget {
  final double height;
  final double weight;

  BmiResult(this.height, this.weight);

  String _calcBmi(double bmi) {
    var result = '저체중';
    if (bmi >= 35) {
      result = '고도 비만';
    } else if (bmi >= 30) {
      result = '2단계 비만';
    } else if (bmi >= 25) {
      result = '1단계 비만';
    } else if (bmi >= 23) {
      result = '과체중';
    } else if (bmi >= 18.5) {
      result = '정상';
    }
    return result;
  }

  Widget _buildIcon(double bmi) {
    if (bmi >= 23) {
      return Icon(
        Icons.sentiment_very_satisfied,
        color: Colors.red,
        size: 100,
      );
    } else if (bmi >= 18.5) {
      return Icon(
        Icons.sentiment_satisfied,
        color: Colors.green,
        size: 100,
      );
    } else {
      return Icon(
        Icons.sentiment_dissatisfied,
        color: Colors.orange,
        size: 100,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bmi = weight / ((height / 100) * (height / 100));
    print('$height / $weight');
    print('BMI : $bmi');

    return Scaffold(
      appBar: AppBar(
        title: Text('비만도 계산기'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _calcBmi(bmi),
              style: TextStyle(fontSize: 36),
            ),
            SizedBox(
              height: 16,
            ),
            _buildIcon(bmi),
          ],
        ),
      ),
    );
  }
}
