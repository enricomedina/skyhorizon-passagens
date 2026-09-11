// =============================================================================
// SkyHorizon Airlines - Sistema de Emissão de Passagens
// Avaliação Formativa I - Programação para Dispositivos Móveis
// USCS - Prof. Ms. Raphael Lopes de Souza
//
// Arquivo único (main.dart) consolidando os Exercícios 1 a 10.
// Desenvolvido em Dart com Null-Safety habilitado.
// =============================================================================

// -----------------------------------------------------------------------------
// EXERCÍCIO 1: Abstração e Classes de Apoio
// -----------------------------------------------------------------------------

class Passageiro {
  String? nome;
  String? cpf;
  String? rg;
  String? email;
  String? celular;
}

class PlataformaVenda {
  int? codigoCanal;
  String? nomeCanal;
}

class Atendente {
  String? nome;
  String? matricula;
  String? cargo;
  String? email;
  String? celular;
  double? salario;
}

// -----------------------------------------------------------------------------
// EXERCÍCIOS 2 a 7: Classe Passagem
// (Agregação, Construtor Não Nomeado, Construtores Nomeados, Parâmetros
// Nomeados, Encapsulamento tradicional e nativo, Métodos de negócio)
// -----------------------------------------------------------------------------

class Passagem {
  // Exercício 2: atributo privado, inicializado com string vazia.
  String? _codigoLocalizador = '';

  // Exercício 2: atributos agregados.
  Passageiro? passageiro;
  PlataformaVenda? plataforma;
  Atendente? atendente;
  String? observacoes;

  // Exercício 2: Construtor Não Nomeado (vazio).
  Passagem();

  // Exercício 3: Construtor nomeado que recebe apenas o código localizador.
  Passagem.somenteCodigo(String codigoLocalizador)
      : _codigoLocalizador = codigoLocalizador;

  // Exercício 3: Construtor nomeado que recebe todos os atributos
  // posicionalmente (uso do atalho this.campo, válido também para
  // parâmetros posicionais em Dart).
  Passagem.completa(
    String? codigoLocalizador,
    this.passageiro,
    this.plataforma,
    this.atendente,
    this.observacoes,
  ) : _codigoLocalizador = codigoLocalizador;

  // Exercício 4: Construtor nomeado com parâmetros nomeados opcionais.
  Passagem.codigoEPassageiro({String? codigoLocalizador, this.passageiro})
      : _codigoLocalizador = codigoLocalizador;

  // Exercício 4: Construtor nomeado que recebe o código localizador
  // posicionalmente e os demais atributos agregados como parâmetros
  // nomeados obrigatórios (required), exceto observações (opcional).
  Passagem.all(
    String? codigoLocalizador, {
    required this.passageiro,
    required this.plataforma,
    required this.atendente,
    this.observacoes,
  }) : _codigoLocalizador = codigoLocalizador;

  // ---------------------------------------------------------------------
  // Exercício 5: Encapsulamento tradicional (getter/setter em formato de
  // método) com validação do código localizador.
  // ---------------------------------------------------------------------
  String? getCodigoLocalizador() {
    return _codigoLocalizador;
  }

  void setCodigoLocalizador(String? codigoLocalizador) {
    if (codigoLocalizador == null || codigoLocalizador.isEmpty) {
      print('Código localizador de passagem inválido!');
      return;
    }
    _codigoLocalizador = codigoLocalizador;
  }

  // ---------------------------------------------------------------------
  // Exercício 6: Getters e setters nativos do Dart (get / set) com a
  // mesma lógica de validação do Exercício 5.
  // ---------------------------------------------------------------------
  String? get codigoLocalizador => _codigoLocalizador;

  set codigoLocalizador(String? codigoLocalizador) {
    if (codigoLocalizador == null || codigoLocalizador.isEmpty) {
      print('Código localizador de passagem inválido!');
      return;
    }
    _codigoLocalizador = codigoLocalizador;
  }

  // ---------------------------------------------------------------------
  // Exercício 7: Métodos de negócio (comportamentos da Passagem).
  // ---------------------------------------------------------------------
  void EmitirPassagem() {
    print('Passagem emitida com sucesso!');
  }

  bool CancelarPassagem() {
    print('Passagem cancelada com sucesso!');
    return true;
  }

  void AtualizarPassagem() {
    print('Passagem atualizada com sucesso!');
  }

  Passagem ConsultarPassagem(String codigo) {
    print('Passagem consultada com sucesso!');
    return Passagem();
  }
}

// -----------------------------------------------------------------------------
// EXERCÍCIO 9: Mixins reutilizáveis (Logger e Auditoria)
// -----------------------------------------------------------------------------

mixin Logger {
  void log(String mensagem) {
    print('[Log]: $mensagem');
  }
}

mixin Auditoria {
  void auditar(String mensagem) {
    print('[Auditoria]: $mensagem');
  }
}

// -----------------------------------------------------------------------------
// EXERCÍCIO 8: Herança - PassagemPrimeiraClasse (SkyHorizon First Class)
// EXERCÍCIO 9: Aplicação dos mixins com "with"
// EXERCÍCIO 10: Sobrescrita polimórfica (@override)
// -----------------------------------------------------------------------------

class PassagemPrimeiraClasse extends Passagem with Logger, Auditoria {
  // Exercício 8: atributo específico da Primeira Classe.
  String? loungeAcesso;

  // Exercício 8: construtor que recebe os atributos posicionais/nomeados
  // da superclasse e encaminha para ela através de super.all, além do
  // parâmetro nomeado obrigatório loungeAcesso.
  PassagemPrimeiraClasse(
    String? codigoLocalizador, {
    required Passageiro? passageiro,
    required PlataformaVenda? plataforma,
    required Atendente? atendente,
    String? observacoes,
    required this.loungeAcesso,
  }) : super.all(
          codigoLocalizador,
          passageiro: passageiro,
          plataforma: plataforma,
          atendente: atendente,
          observacoes: observacoes,
        );

  // Exercício 10: sobrescrita polimórfica de AtualizarPassagem(), chamando
  // os métodos herdados dos mixins Logger e Auditoria.
  @override
  void AtualizarPassagem() {
    print('Passagem de Primeira Classe atualizada com sucesso!');
    log('Alteração realizada pelo atendente: ${super.atendente?.nome}');
    auditar('Verificação de segurança realizada para bilhete de Primeira Classe.');
  }
}

// -----------------------------------------------------------------------------
// EXERCÍCIO 10: Função main() - demonstração de todo o sistema
// -----------------------------------------------------------------------------

void main() {
  print('=== SkyHorizon Airlines - Sistema de Emissão de Passagens ===\n');

  // --- Entidades de apoio (Exercício 1) ---
  var passageiro1 = Passageiro();
  passageiro1.nome = 'Ana Beatriz Ferreira';
  passageiro1.cpf = '123.456.789-00';
  passageiro1.rg = '12.345.678-9';
  passageiro1.email = 'ana.ferreira@email.com';
  passageiro1.celular = '(11) 98888-7777';

  var passageiro2 = Passageiro();
  passageiro2.nome = 'Carlos Eduardo Souza';
  passageiro2.cpf = '987.654.321-00';
  passageiro2.email = 'carlos.souza@email.com';

  var plataforma1 = PlataformaVenda();
  plataforma1.codigoCanal = 10;
  plataforma1.nomeCanal = 'Agência Voe Fácil';

  var atendente1 = Atendente();
  atendente1.nome = 'Marina Alves';
  atendente1.matricula = 'F-2024-001';
  atendente1.cargo = 'Atendente de Balcão';
  atendente1.email = 'marina.alves@skyhorizon.com';
  atendente1.celular = '(11) 97777-1234';
  atendente1.salario = 3200.00;

  // --- 1) Passagem usando o Construtor Não Nomeado (Exercício 2) ---
  print('--- Passagem 1: Construtor Não Nomeado + setters ---');
  var passagem1 = Passagem();
  passagem1.passageiro = passageiro1;
  passagem1.plataforma = plataforma1;
  passagem1.atendente = atendente1;
  passagem1.observacoes = 'Cliente com bagagem extra.';

  // Exercício 6: uso do setter nativo com validação (tentativa inválida).
  passagem1.codigoLocalizador = '';
  // Exercício 6: uso do setter nativo com validação (valor válido).
  passagem1.codigoLocalizador = 'SKY001';
  print('Código localizador (getter nativo): ${passagem1.codigoLocalizador}');
  passagem1.EmitirPassagem();

  // --- 2) Passagem usando construtor nomeado somenteCodigo (Exercício 3) ---
  print('\n--- Passagem 2: Construtor somenteCodigo ---');
  var passagem2 = Passagem.somenteCodigo('SKY002');
  print('Código localizador (getter tradicional): ${passagem2.getCodigoLocalizador()}');
  // Exercício 5: uso do setter tradicional com validação (tentativa inválida).
  passagem2.setCodigoLocalizador(null);
  passagem2.AtualizarPassagem();

  // --- 3) Passagem usando construtor completa (Exercício 3) ---
  print('\n--- Passagem 3: Construtor completa (posicional) ---');
  var passagem3 = Passagem.completa(
    'SKY003',
    passageiro2,
    plataforma1,
    atendente1,
    'Passageiro solicitou refeição especial.',
  );
  print('Passageiro: ${passagem3.passageiro?.nome}');
  print('Canal de venda: ${passagem3.plataforma?.nomeCanal}');

  // --- 4) Passagem usando construtor all com parâmetros nomeados (Exercício 4) ---
  print('\n--- Passagem 4: Construtor all (parâmetros nomeados) ---');
  var passagem4 = Passagem.all(
    'SKY004',
    passageiro: passageiro1,
    plataforma: plataforma1,
    atendente: atendente1,
    observacoes: 'Cliente preferencial - milhas acumuladas.',
  );
  var cancelada = passagem4.CancelarPassagem();
  print('Passagem cancelada? $cancelada');

  var consulta = passagem4.ConsultarPassagem('SKY004');
  print('Código da passagem consultada (nova instância vazia): "${consulta.getCodigoLocalizador()}"');

  // --- 5) PassagemPrimeiraClasse (Herança + Mixins + Polimorfismo) ---
  print('\n--- Passagem 5: PassagemPrimeiraClasse (Herança, Mixins e Polimorfismo) ---');
  var passagemVip = PassagemPrimeiraClasse(
    'SKY-VIP-001',
    passageiro: passageiro1,
    plataforma: plataforma1,
    atendente: atendente1,
    observacoes: 'Bilhete de Primeira Classe - refeição gourmet.',
    loungeAcesso: 'Sala VIP Star Alliance - Terminal 3',
  );

  print('Código localizador: ${passagemVip.codigoLocalizador}');
  print('Lounge de acesso: ${passagemVip.loungeAcesso}');

  // Método herdado da superclasse (Exercício 7).
  passagemVip.EmitirPassagem();

  // Método sobrescrito polimorficamente (Exercício 10) - chama os mixins.
  passagemVip.AtualizarPassagem();

  print('\n=== Fim da demonstração ===');
}
