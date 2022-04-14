import 'package:divisor_tensao/componentes/componentes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

final compo = new ComponentesDivisor();

class Tensao extends StatefulWidget {
  @override
  tensaoState createState() => tensaoState();
}

class tensaoState extends State<Tensao> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: Row(
          children: [
            Icon(Icons.engineering),
            Padding(
              padding: const EdgeInsets.only(left: 35.0),
              child: Text('Divisor de Tensão',style: GoogleFonts.catamaran() ),
            ),
          ],
        ), actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.refresh,
                size: 30,
                color: Colors.white,
              ),
              onPressed: compo.resetFields)
        ]),


     
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: new SingleChildScrollView(
              child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: compo.formkey,
              child: Column(children: <Widget>[
                 SizedBox(width: 40),
                compo.buildDivisor(),
                compo.buildbotton(context),
                SizedBox(
                  height: 150,
                ),
                compo.buildtoq(),
                SizedBox(
                  height: 30,
                ),
              ]),
            ),
          )),
        ));
  }
}
