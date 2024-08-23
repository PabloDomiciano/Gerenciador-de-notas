import 'package:flutter_application_1/dominio/dto/dto_professor.dart';
import 'package:flutter_application_1/interface/i_dao_professor.dart';
import 'package:flutter_application_1/dominio/professor.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  var dto = DTOProfessor(nome: 'Helio', cpf: '733.003.300-68', status: 'A');
  var dao = DAOProfessorFake();
  var professor = Professor(dto: dto, dao: dao);

  group('Professor', () {
    group('NOME - não pode ser vazio', () {
      test('teste nome não vazio', () {
        expect(() => professor.eNomeNaoVazio(), returnsNormally);
      });
      test('teste status ativo', () {
        expect(() => professor.eVerificaStatus(), returnsNormally);
      });
    });
  });
}

class DAOProfessorFake implements IDAOProfessor {
  @override
  DTOProfessor salvar(DTOProfessor dto) {
    return dto;
  }
}
