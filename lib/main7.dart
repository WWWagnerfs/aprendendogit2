import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: IMCCalculadora(),
  ));
}

class IMCCalculadora extends StatefulWidget {
  @override
  _IMCCalculadora createState() => _IMCCalculadora();
}

class _IMCCalculadora extends State<IMCCalculadora> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String result = '';
  Color resultColor = Colors.black;

  Color cor(double imc) {
    if (imc < 18.5) {
      return Colors.green;
    } else if (imc >= 18.5 && imc < 25) {
      return Colors.blue;
    } else if (imc >= 25 && imc < 30) {
      return Colors.orange;
    } else if (imc >= 30 && imc < 35) {
      return Colors.red;
    } else if (imc >= 35 && imc < 40) {
      return Colors.red;
    } else {
      return Colors.red;
    }
  }

  void calculaIMC() {
    final weightInput = weightController.text.replaceAll(',', '.');
    final heightInput = heightController.text.replaceAll(',', '.');

    double weight = double.tryParse(weightInput) ?? 0.0;
    double height = double.tryParse(heightInput) ?? 0.0;

    if (weight > 0 && height > 0) {
      double imc = weight / (height * height);
      Color color = cor(imc);

      setState(() {
        if (imc < 18.5) {
          result = 'Abaixo de 18.5 - Baixo Peso (${imc.toStringAsFixed(2)})';
        } else if (imc >= 18.5 && imc < 25) {
          result =
              'Entre 18.5 e 24.99 - Peso Normal (${imc.toStringAsFixed(2)})';
        } else if (imc >= 25 && imc < 30) {
          result = 'Entre 25 e 29.99 - Sobrepeso (${imc.toStringAsFixed(2)})';
        } else if (imc >= 30 && imc < 35) {
          result =
              'Entre 30 e 34.99 - Obesidade Grau I (${imc.toStringAsFixed(2)})';
        } else if (imc >= 35 && imc < 40) {
          result =
              'Entre 35 e 39.99 - Obesidade Grau II (${imc.toStringAsFixed(2)})';
        } else {
          result =
              'Acima de 40 - Obesidade Grau III (${imc.toStringAsFixed(2)})';
        }
        resultColor = color;
      });
    } else {
      setState(() {
        result = 'Informe peso e altura válidos';
        resultColor = Colors.black;
      });
    }
  }

  void limpaDados() {
    setState(() {
      weightController.text = '';
      heightController.text = '';
      result = '';
      resultColor = Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: weightController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Peso (KG)'),
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Altura (Metros)'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: calculaIMC,
              child: Text('Calcular IMC'),
            ),
            SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: resultColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                'Resultado: $result',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: limpaDados,
              child: Text('Limpar Dados'),
            ),
          ],
        ),
      ),
    );
  }
}
