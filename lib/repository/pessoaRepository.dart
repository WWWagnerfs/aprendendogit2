import 'package:mobile/entidades/pessoa.dart';

class PessoaRepository {
  //Atributos que guardam/acessam os dados da API
  static List<Pessoa> listaPessoas = [
    Pessoa(foto: 'images/foto1.jfif', nome: 'João', idade: 20),
    Pessoa(foto: 'images/foto2.jfif', nome: 'Ana', idade: 24),
    Pessoa(foto: 'images/foto1.jfif', nome: 'André', idade: 26),
    Pessoa(foto: 'images/foto2.jfif', nome: 'Luisa', idade: 19),
  ];
  //Métodos que acessam a API
  //GET, POST, UPDATE, DELETE
  // Create Read Update Delele - CRUD
}
