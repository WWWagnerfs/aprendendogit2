import 'dart:io';

void main() {
  print("Calculadora de IMC");

  stdout.write("Informe o seu peso (em quilogramas): ");
  var pesoInput = stdin.readLineSync();
  stdout.write("Informe a sua altura (em metros): ");
  var alturaInput = stdin.readLineSync();

  if (pesoInput != null && alturaInput != null) {
    var peso = double.tryParse(pesoInput);
    var altura = double.tryParse(alturaInput);

    if (peso != null && altura != null) {
      var imc = calcularIMC(peso, altura);

      print("Seu IMC é: $imc");
      interpretarIMC(imc);
    } else {
      print("Valores de peso e altura inválidos.");
    }
  } else {
    print("Entrada inválida.");
  }
}

double calcularIMC(double peso, double altura) {
  return peso / (altura * altura);
}

void interpretarIMC(double imc) {
  if (imc < 18.5) {
    print("Você está abaixo do peso.");
  } else if (imc >= 18.5 && imc < 25) {
    print("Seu peso está saudável.");
  } else if (imc >= 25 && imc < 30) {
    print("Você está com sobrepeso.");
  } else {
    print("Você está obeso.");
  }
}
