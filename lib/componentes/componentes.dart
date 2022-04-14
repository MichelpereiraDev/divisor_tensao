import 'package:divisor_tensao/cal.dart';
import 'package:divisor_tensao/componentes/componentes.dart';
import 'package:divisor_tensao/divisor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'componentes.dart';

class ComponentesDivisor extends Controller {

 


 GlobalKey<FormState> formkey = GlobalKey<FormState>();
 buildDivisor() {
    return new Column(children: <Widget>[
      new TextFormField(
        keyboardType: TextInputType.number,
        controller: vInController,
        decoration: new InputDecoration(
          hintText: 'Tensão de Entrada' ,
        ),
      ),
      SizedBox(height: 20),
      new TextFormField(
        keyboardType: TextInputType.number,
        controller: resOneController,
        decoration: new InputDecoration(hintText: 'Resistor +   (Em Ohms)'),
      ),
      SizedBox(height: 20),
      new TextFormField(
        keyboardType: TextInputType.number,
        controller: resTwoController,
        decoration: new InputDecoration(hintText: 'Resistor -   (Em Ohms)'),
      ),
      SizedBox(height: 20),
      new TextFormField(
        keyboardType: TextInputType.number,
        controller:vOutController,
        validator: (value) {
          if (value.isEmpty) {
            return 'valor';
          }
          return null;
        },
        decoration: new InputDecoration(hintText: 'Tensão de Saida'),
      ),
      SizedBox(height: 20),
    ]);
  }

  Container buildbotton(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        height: 60.0,
        child: Center(
            child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.white)),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
         calcula();
          print("print");
            //  if (formkey.currentState.validate()) {
            //  FocusScope.of(context).requestFocus(new FocusNode());
            //  }
          },
          child: Text("Calcular",
             style: GoogleFonts.catamaran() )),
        ));
  }

  void resetFields() {
   vInController.text = "";
   resOneController.text = "";
   resTwoController.text = "";
   vOutController.text = "";
  }

  buildtoq() {
    return Center(
        child: Container(
            child: Text("TOQTEC",
               style: GoogleFonts.catamaran() )));
  }
 


}

