import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


class Calculator extends StatefulWidget {
  const Calculator({ Key? key }) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  var outputtext = "";

Widget btn(var btntext){
  return ElevatedButton( style: ElevatedButton.styleFrom(primary: Colors.teal[300]),onPressed: (){
    setState(() {
      outputtext = outputtext + btntext;
    });
  }, child: Text(btntext));
}

clear(){
  setState(() {
    outputtext = "";
  });
}

result(){
  Parser p = Parser();
  Expression exp = p.parse(outputtext);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);

  setState(() {
    outputtext = eval.toString();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.black45,
      title: Center(child: Text('Calculator')),
      ),
      backgroundColor: Colors.black54,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(outputtext,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                btn("7"),
                btn("8"),
                btn("9"),
                btn("-"),
              ],),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                btn("4"),
                btn("5"),
                btn("6"),
                btn("+"),
              ],),
            ),
             
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                btn("1"),
                btn("2"),
                btn("3"),
                btn("*"),
            ],),
             ),
             
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                btn("0"),
                ElevatedButton( style: ElevatedButton.styleFrom(primary: Colors.teal[300]),onPressed: clear, child: Text("Clear")),
                ElevatedButton( style: ElevatedButton.styleFrom(primary: Colors.teal[300]),onPressed: result, child: Text("=")),
                btn("/"),
            ],),
             )

          ],
          
          ),
      ),
      
    );
  }
}
