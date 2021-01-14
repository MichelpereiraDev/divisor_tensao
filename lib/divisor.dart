import 'package:divisor_tensao/cal.dart';

import 'package:flutter/material.dart';

final calcu = Calcu();

class Tensao extends StatefulWidget {
  @override
  tensaoState createState() => tensaoState();
}

class tensaoState extends State<Tensao> {
  String resistorone, resistortwo, vin, vout;
  TextEditingController vInController = new TextEditingController();
  TextEditingController resOneController = new TextEditingController();

  TextEditingController resTwoController = new TextEditingController();

  TextEditingController vOutController = new TextEditingController();

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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
        controller: calcu.vInController,
        decoration: new InputDecoration(
          hintText: 'Tensão de Entrada',
        ),
      ),
      SizedBox(height: 20),
      new TextFormField(
        keyboardType: TextInputType.number,
        controller: calcu.resOneController,
        decoration: new InputDecoration(hintText: 'Resistor +   (Em Ohms)'),
      ),
      SizedBox(height: 20),
      new TextFormField(
        keyboardType: TextInputType.number,
        controller: calcu.resTwoController,
        decoration: new InputDecoration(hintText: 'Resistor -   (Em Ohms)'),
      ),
      SizedBox(height: 20),
      new TextFormField(
        keyboardType: TextInputType.number,
        controller: calcu.vOutController,
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
            calcu.calcula();
            if (_formkey.currentState.validate()) {
              FocusScope.of(context).requestFocus(new FocusNode());
            }
          },
          child: Text("Calcular",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
        )));
  }

  void _resetFields() {
    calcu.vInController.text = "";
    calcu.resOneController.text = "";
    calcu.resTwoController.text = "";
    calcu.vOutController.text = "";
  }

  buildtoq() {
    return Center(
        child: Container(
            child: Text("TOQTEC",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20.0,
                    fontFamily: "Imprima"))));
  }
}
