import 'package:flutter/material.dart';
class ActivityPage extends StatefulWidget {
  ActivityPage({Key? key}) : super(key: key);

  
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {

  String output='0';
  String _output="0";
  double num1=0;
  double num2=0;
  String operador="";

  /*
    Método para validar la selección de botones para las operaciones o/y números
  */
  pressedButton(String val){
    if(val== 'C'){
      _output='0';
      num1=0;
      num2=0;
      operador="";
    }else if(val == "+" || val == "-" || val == "*" || val == "/"){
      num1=double.parse(output);
      operador=val;
      _output="0";
      output=output+val;
    }else if(val =="."){
      if(_output.contains(".")){
        return;
      }else{
        _output=_output+val;
      }
    }else if(val == "="){
      num2=double.parse(output);
      if(operador == "+"){
        _output=(num1+num2).toString();
      }
      if(operador == "-"){
        _output=(num1-num2).toString();
      }
      if(operador == "*"){
        _output=(num1*num2).toString();
      }
      if(operador == "/"){
          _output=(num1/num2).toString();
       
      }
      num2=0.0;
      num1=0.0;
    }else{
      _output=_output+val;

    }
    setState(() {
      output=double.parse(_output).toStringAsFixed(2);
    });
  }
  /*
    Método para reutilizar la configuración y generar botones con un tipo de diseño predeterminado
  */
  Widget calBtn(String btnVal){
    return Expanded(
      child:Container(
        margin: EdgeInsets.all(10.0),
        decoration:BoxDecoration(
          color:Colors.grey[300],
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(2.0, 2.0),
              blurRadius: 8.0, 
              spreadRadius: 1.0
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-2.0, -2.0),
              blurRadius: 8.0, 
              spreadRadius: 1.0
            ),
          ]
        ),
        child: MaterialButton(
          padding: EdgeInsets.all(20.0),
          child:Text(btnVal, style: TextStyle(fontSize:22.0)),
          onPressed: ()=>pressedButton(btnVal),
        ),
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Colors.grey[300],
        body: Container(
          child: Column(
            children:<Widget>[
              Container(
                alignment:Alignment.bottomRight,
                padding: EdgeInsets.symmetric(horizontal:12.0, vertical:50.0),
                child: Text(output, style:TextStyle(fontSize: 60.0)),
              ),
              Expanded(child: Divider(),
              ),
              Column(
                children:<Widget>[
                  Row(
                    children: [
                      calBtn("."),
                      calBtn("C"),
                      calBtn("<-"),
                      calBtn("*"),
                    ],
                  ),
                  Row(
                    children: [
                      calBtn("7"),
                      calBtn("8"),
                      calBtn("9"),
                      calBtn("/"),
                    ],
                  ),
                  Row(
                    children: [
                      calBtn("4"),
                      calBtn("5"),
                      calBtn("6"),
                      calBtn("+"),
                    ],
                  ),
                  Row(
                    children: [
                      calBtn("1"),
                      calBtn("2"),
                      calBtn("3"),
                      calBtn("-"),
                    ],
                  ),
                  Row(
                    children: [
                      calBtn("0"),
                      calBtn("="),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}