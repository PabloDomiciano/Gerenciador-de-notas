import 'package:flutter_application_1/dominio/cpf.dart';
import 'package:flutter_application_1/dominio/dto/dto_professor.dart';
import 'package:flutter_application_1/interface/i_dao_professor.dart';

class Professor {
  late dynamic? id;
  late String nome;
  late String? descricao;
  late String cpf;
  late String _status;
  String get status => _status;

  set status(String status) {
    if (_status != 'A' || _status != 'I')
      throw Exception('Status deve ser "A" ou "I".');
    _status = status;
  }

  late IDAOProfessor dao;
  late DTOProfessor dto;

  Professor({required this.dto, required this.dao}) {
    id = dto.id;
    nome = dto.nome;
    descricao = dto.descricao;
    cpf = dto.cpf;
    _status = dto.status;
    CPF(cpf);
  }

  eNomeNaoVazio() {
    if (nome.isEmpty) throw Exception("Nome não pode ser vazio.");
  }

  eVerificaStatus() {
    if (_status == 'A' || _status == 'I') {
    } else
      throw Exception('Status deve ser "A" ou "I".');
  }

  DTOProfessor salvar(DTOProfessor dto) {
    eNomeNaoVazio();
    return dao.salvar(dto);
  }
}
