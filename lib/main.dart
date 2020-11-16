import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Calculator',
      theme: ThemeData(

        primarySwatch: Colors.lightBlue,
      ),
      home: MyHomePage(title: 'My Calculator',),

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  String output="0";
  String _output="0";
  double num1=0.0;
  double num2=0.0;
  String operand = "";

  buttonPressed(String btntxt){
    if(btntxt == "C"){
      output="0";
      _output="0";
      num1=0.0;
      num2=0.0;
      operand = "";
    }else if(btntxt == "+"||btntxt == "-"||btntxt == "/"||btntxt == "x"||btntxt == "^"){

      num1 = double.parse(_output);
      operand=btntxt;
      _output = "0";
    }else if(btntxt=="."){
      if(_output.contains(".")){
        print("'.' is already exist");
        return;
      }else {
        _output=_output + btntxt;
      }
    }else if(btntxt == "="){
      num2 = double.parse(_output);
      if(operand == "+"){
        _output=(num1+num2).toString();
      }else if(operand == "-"){
        _output=(num1-num2).toString();
      }else if(operand == "x"){
        _output=(num1*num2).toString();
      }else if(operand == "/"){
        _output=(num1/num2).toString();
      }else if(operand == "^"){
        _output=(pow(num1,num2)).toString();
      }
      num1=double.parse(_output);
    }else{
      _output= _output+btntxt;
    }
    print(_output);
    setState(() {
      output=double.parse(_output).toStringAsFixed(1);
    });


  }



  Widget btn1(String btntxt) {
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(35.0),
        textColor: Colors.orangeAccent,
        child: new Text(btntxt,
          style: TextStyle(
            fontSize: 25,
            fontStyle: FontStyle.italic,
          ),
        ),
        onPressed: () =>
            buttonPressed(btntxt),
      ),
    );
  }

  Widget btn(String btntxt) {
    return new Expanded(
      child: new MaterialButton(
        padding: new EdgeInsets.all(35.0),
        color: Colors.lightBlueAccent,
        textColor: Colors.white,
        child: new Text(btntxt,
          style: TextStyle(
            fontSize: 23,
            fontStyle: FontStyle.italic,
          ),
        ),
        onPressed: () =>
            buttonPressed(btntxt),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          title: Text(widget.title),
        ),
        body: new Container(
          child: new Column(children: <Widget>[
            Container(
                alignment: Alignment.centerRight ,
                padding: new EdgeInsets.symmetric(
                  vertical: 60,
                  horizontal: 12,
                ),
                child: new Text(output, textAlign: TextAlign.center,style: new TextStyle(
                  fontSize: 80,
                  fontStyle: FontStyle.italic,
                  color: Colors.orange,
                ),)),

            new Expanded(
              child: new Divider(),
            ),

            new Column(children:[

              new Row(children:[
                btn1("7"),
                btn1("8"),
                btn1("9"),
                btn("/"),
              ]
              ),
              new Row(children:[
                btn1("4"),
                btn1("5"),
                btn1("6"),
                btn("x"),
              ]
              ),
              new Row(children:[
                btn1("1"),
                btn1("2"),
                btn1("3"),
                btn("-"),
              ]
              ),
              new Row(children:[
                btn1("0"),
                btn1("^"),
                btn1("."),
                btn("+"),
              ]
              ),
              new Row(
                  children:[
                    btn1("C"),
                    btn("="),
                  ]
              ),
            ]
            )


          ],),
        )

    );
  }
}