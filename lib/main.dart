import 'package:flutter/material.dart';

double alcool = 0.0;
double gasolina = 0.0;
double result = 0.0;
String result2 = '...';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text('combustível vantajoso'),
        ),
        body: new Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new Text(
              'Insira os preços:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text('Álcool : '),
                  new Flexible(
                    child: new TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      onChanged: (text) {
                        alcool = double.parse(text);
                        calculaCombustivel();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text('Gasolina :'),
                  new Flexible(
                    child: new TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      onChanged: (value) {
                        gasolina = double.parse(value);
                        calculaCombustivel();
                      },
                    ),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Text(
                  'Abasteça : $result2',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.green[700],
                  ),
                ),
                Text(
                  '$result',
                  style: TextStyle(color: Colors.black.withOpacity(0.2)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void calculaCombustivel() {
    result = alcool / gasolina;

    if (result < 0.7) {
      print('Álcool = ' + alcool.toString());
      setState(() {
        result2 = 'Álcool';
      });
    } else {
      print('Gasolina = ' + gasolina.toString());
      setState(() {
        result2 = 'Gasolina';
      });
    }
  }
}
