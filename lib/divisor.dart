import 'dart:ffi';

import 'package:flutter/material.dart';

class tensao extends StatefulWidget {
  @override
  tensaoState createState() => tensaoState();
}

class tensaoState extends State<tensao> {
  String resistorone, resistortwo, vin, vout;
  TextEditingController vInController = new TextEditingController();
  TextEditingController resOneController = new TextEditingController();

  TextEditingController resTwoController = new TextEditingController();

  TextEditingController vOutController = new TextEditingController();
  String _infoText = "";
  double vinResul, resoneResul, restwoResul, voutResul;

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  calcula() {
    setState(() {
      double vin = double.tryParse(vInController.text);

      double resistorone = double.tryParse(resOneController.text);
      double resistortwo = double.tryParse(resTwoController.text);
      double vout = double.tryParse(vOutController.text);

      if (vin == null) {
        vinResul = (vout * ((resistorone + resistortwo) / resistortwo));

        vInController.text = "${vinResul.toStringAsPrecision(2)}v";
      } else if (resistorone == null) {
        resoneResul = (((vin * resistortwo) / vout) - resistortwo);

        resOneController.text = "${resoneResul.toStringAsPrecision(3)}ohms";
      } else if (resistortwo == null) {
        restwoResul = ((vout * resistorone) / (vin - vout));

        resTwoController.text = "${restwoResul.toStringAsPrecision(3)}ohms";
      } else if (vout == null) {
        voutResul = ((resistortwo / (resistorone + resistortwo)) * vin);
        vOutController.text = "${voutResul.toStringAsPrecision(3)}v";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: Text('Divisor de Tensão'), actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.refresh,
                size: 30,
                color: Colors.white,
              ),
              onPressed: _resetFields)
        ]),
        backgroundColor: Colors.white,
        body: new SingleChildScrollView(
            child: new Container(
          margin: new EdgeInsets.all(15.0),
          child: new Form(
            key: _formkey,
            child: Column(children: <Widget>[
              _buildDivisor(),
              buildTextInfo(),
              buildbotton(context),
              SizedBox(
                height: 180,
              ),
               buildtoq(),
              SizedBox(
                height: 30,
              ),
            ]),
          ),
        )));
  }

  Widget _buildDivisor() {
    return new Column(children: <Widget>[
      new TextFormField(
        keyboardType: TextInputType.number,
        controller: vInController,
        decoration: new InputDecoration(
          hintText: 'Tensão de Entrada',
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
        controller: vOutController,
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
            if (_formkey.currentState.validate()) {
              FocusScope.of(context).requestFocus(new FocusNode());
            }
          },
          child: Text("Calcular",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
        )));
  }

  Text buildTextInfo() {
    return Text(_infoText,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.red, fontSize: 20.0, fontWeight: FontWeight.bold));
  }

  void _resetFields() {
    vInController.text = "";
    resOneController.text = "";
    resTwoController.text = "";
    vOutController.text = "";

    setState(() {
      _formkey = GlobalKey<FormState>();
    });
  }
  buildtoq(){
   return Center(
     
     child:
     Container(
       
       
         
       
       child:
         Text("TOQTEC",
              style: TextStyle(color: Colors.grey, fontSize: 20.0, fontFamily: "Imprima")
        
    
          ))); }
}
