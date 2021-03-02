import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  _Hostage createState() => _Hostage();
}

class _Hostage extends State<Index> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGazolina = TextEditingController();
  String _resultado = '';

  void _calcular() {
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGazolina = double.tryParse(_controllerGazolina.text);

    if (precoAlcool == null || precoGazolina == null) {
      setState(() {
        this._resultado = 'Ops! o valor informado é inválido';
      });
    } else {
      if ((precoAlcool / precoGazolina) >= 0.7) {
        setState(() {
          this._resultado = "Gasoza é sua melhor opção!";
        });
      } else {
        setState(() {
          this._resultado = "Alcool é sua melhor opção!";
        });
      }
    }

    _controllerAlcool.text = '';
    _controllerGazolina.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Alcool ou Gasoza',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          child: SingleChildScrollView(
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Image.asset("images/logo.png"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Saiba qual a melhor opção de abastecimento do seu veículo.',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration:
                        InputDecoration(labelText: "Preço do Alcool, ex: 3.59"),
                    style: TextStyle(fontSize: 22),
                    controller: _controllerAlcool,
                  ),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration:
                        InputDecoration(labelText: "Preço da Gasoza, ex: 5.10"),
                    style: TextStyle(fontSize: 22),
                    controller: _controllerGazolina,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: RaisedButton(
                        color: Colors.blueGrey,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(15),
                        onPressed: () => _calcular(),
                        child: Text('Calcular opção')),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(_resultado,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold))),
                ],
              )),
        ));
  }
}
